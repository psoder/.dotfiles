#!/usr/bin/env bash
set -euo pipefail

HOSTS_DIR="$HOME/.dotfiles/.config/hypr/hosts"
HOSTS_LUA="$HOSTS_DIR/$(hostname).lua"
if [[ ! -f "$HOSTS_LUA" ]]; then
  HOSTS_LUA="$HOSTS_DIR/default.lua"
fi
if [[ ! -f "$HOSTS_LUA" ]]; then
  echo "no host config at $HOSTS_DIR, cannot determine wallpaper dir" >&2
  exit 1
fi
OVERRIDE=$(grep -oP "hl\.env\('WALLPAPER_DIR',\s*'\K[^']+" "$HOSTS_LUA" || true)
if [[ -z "$OVERRIDE" ]]; then
  echo "WALLPAPER_DIR not set in $HOSTS_LUA" >&2
  exit 1
fi
WALLPAPER_DIR="${OVERRIDE/#\~/$HOME}"
STATE_DIR="$HOME/.local/state/wallpaper-rotate"
QUEUE_FILE="$STATE_DIR/queue"
LAST_FILE="$STATE_DIR/last"
LOCK_FILE="$STATE_DIR/.lock"
CURRENT_LINK="$STATE_DIR/current"

mkdir -p "$STATE_DIR"

exec 9>"$LOCK_FILE"
flock -n 9 || exit 0

if ! hyprctl monitors -j >/dev/null 2>&1; then
  echo "hyprland not reachable, skipping" >&2
  exit 0
fi

if [[ ! -d "$WALLPAPER_DIR" ]]; then
  echo "wallpaper dir $WALLPAPER_DIR does not exist" >&2
  exit 1
fi

LAST=""
[[ -f "$LAST_FILE" ]] && LAST=$(cat "$LAST_FILE")

CURRENT_SET="$STATE_DIR/.current"
KEPT="$STATE_DIR/.kept"
EXCLUDE="$STATE_DIR/.exclude"
NEW="$STATE_DIR/.new"

find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort > "$CURRENT_SET"
if [[ ! -s "$CURRENT_SET" ]]; then
  echo "no images found in $WALLPAPER_DIR" >&2
  exit 1
fi

if [[ -f "$QUEUE_FILE" ]]; then
  grep -Fxf "$CURRENT_SET" "$QUEUE_FILE" > "$KEPT" || : > "$KEPT"
else
  : > "$KEPT"
fi

cp "$KEPT" "$EXCLUDE"
[[ -n "$LAST" ]] && echo "$LAST" >> "$EXCLUDE"
grep -Fxvf "$EXCLUDE" "$CURRENT_SET" > "$NEW" || : > "$NEW"

shuf "$NEW" >> "$KEPT"
mv "$KEPT" "$QUEUE_FILE"
rm -f "$CURRENT_SET" "$EXCLUDE" "$NEW"

if [[ ! -s "$QUEUE_FILE" ]]; then
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | shuf > "$QUEUE_FILE"
fi

NEXT=""
while [[ -s "$QUEUE_FILE" ]]; do
  CANDIDATE=$(head -n1 "$QUEUE_FILE")
  tail -n +2 "$QUEUE_FILE" > "$QUEUE_FILE.tmp" && mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"
  if [[ -f "$CANDIDATE" ]]; then
    NEXT="$CANDIDATE"
    break
  fi
done

if [[ -z "$NEXT" ]]; then
  echo "no valid images left in $WALLPAPER_DIR" >&2
  exit 1
fi

mapfile -t MONITORS < <(hyprctl monitors -j | jq -r '.[] | select(.disabled == false) | .name')

if (( ${#MONITORS[@]} == 0 )); then
  echo "no enabled monitors reported by hyprctl" >&2
  exit 1
fi

# hyprctl prints "error: ..." on failure; don't trust the exit status alone.
FAILED=0
for MONITOR in "${MONITORS[@]}"; do
  if ! OUT=$(hyprctl hyprpaper wallpaper "$MONITOR,$NEXT" 2>&1) || [[ "$OUT" == error:* || "$OUT" == *"err:"* ]]; then
    echo "failed to set wallpaper on $MONITOR: $OUT" >&2
    FAILED=1
  fi
done

if (( FAILED )); then
  echo "wallpaper NOT rotated; leaving $CURRENT_LINK untouched" >&2
  exit 1
fi

ln -sfn "$NEXT" "$CURRENT_LINK"
echo "$NEXT" > "$LAST_FILE"

echo "wallpaper set to $NEXT on ${MONITORS[*]}"

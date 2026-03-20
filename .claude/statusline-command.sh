#!/usr/bin/env bash
# Claude Code status line — styled after Starship Catppuccin Macchiato prompt

input=$(cat)

# Catppuccin Macchiato palette (ANSI approximate)
RED='\033[38;2;237;135;150m'
PEACH='\033[38;2;245;169;127m'
YELLOW='\033[38;2;238;212;159m'
GREEN='\033[38;2;166;218;149m'
SAPPHIRE='\033[38;2;125;196;228m'
LAVENDER='\033[38;2;183;189;248m'
CRUST='\033[38;2;24;25;38m'
RESET='\033[0m'

BG_RED='\033[48;2;237;135;150m'
BG_PEACH='\033[48;2;245;169;127m'
BG_YELLOW='\033[48;2;238;212;159m'
BG_GREEN='\033[48;2;166;218;149m'
BG_SAPPHIRE='\033[48;2;125;196;228m'
BG_LAVENDER='\033[48;2;183;189;248m'

# Data from Claude
user=$(whoami)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')

# Truncate path: show only last segment with "…/" prefix when more than 1 segment deep from home.
# e.g. ~/Projects/psoder.net → …/psoder.net, ~ → ~, ~/foo → ~/foo
rel_path=$(echo "$cwd" | sed "s|^$HOME|~|")
IFS='/' read -ra parts <<< "$rel_path"
count=${#parts[@]}
# parts[0] is "~" (or empty if absolute path not under HOME)
# more than 1 segment deep from home means count > 2 (e.g. ~ / Projects / psoder.net = 3 parts)
if [ "$count" -gt 2 ]; then
    trimmed_path="…/${parts[$((count-1))]}"
else
    trimmed_path="$rel_path"
fi

model=$(echo "$input" | jq -r '.model.display_name // ""')

# Git branch & status (skip optional locks)
git_branch=""
git_status_str=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    git_branch=$(git -C "$cwd" -c gc.auto=0 symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" -c gc.auto=0 rev-parse --short HEAD 2>/dev/null)
    git_dirty=$(git -C "$cwd" -c gc.auto=0 status --porcelain 2>/dev/null)
    if [ -n "$git_dirty" ]; then
        git_status_str=" ✘"
    else
        git_status_str=" $"
    fi
fi

# Context usage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
context_str=""
if [ -n "$used_pct" ]; then
    context_str=$(LC_NUMERIC=C printf "%.0f%%" "$used_pct")
fi

# OS icon for Arch Linux (󰣇 U+F0EC7) — Nerd Font required
OS_ICON=$'\uf303'

# Build status line
# Red segment: OS icon + username (matches Starship $os + $username in bg:red fg:crust)
printf "${BG_RED}${CRUST} ${OS_ICON} ${user} "
printf "${RED}${BG_PEACH}\ue0b0"

# Peach segment: directory (matches Starship $directory in bg:peach fg:crust)
printf "${CRUST} ${trimmed_path} "

if [ -n "$git_branch" ]; then
    # Yellow segment: git branch + status (matches Starship $git_branch $git_status in bg:yellow fg:crust)
    # Branch symbol  = U+E0A0
    printf "${PEACH}${BG_YELLOW}\ue0b0"
    printf "${CRUST} \ue725 ${git_branch}${git_status_str} "
    printf "${YELLOW}${BG_SAPPHIRE}\ue0b0"
else
    printf "${PEACH}${BG_SAPPHIRE}\ue0b0"
fi

printf "${CRUST} ${model} "

if [ -n "$context_str" ]; then
    printf "${SAPPHIRE}${BG_LAVENDER}\ue0b0"
    printf "${CRUST} %s " "${context_str}"
    printf "${RESET}${LAVENDER}\ue0b0"
else
    printf "${RESET}${SAPPHIRE}\ue0b0"
fi

printf "${RESET}\n"

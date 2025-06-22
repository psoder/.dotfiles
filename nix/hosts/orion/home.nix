{ config, pkgs, ... }:

{
  home.username = "psoder";
  home.homeDirectory = "/home/psoder";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    bat
    eza
    dust
    starship
    delta
    tokei
    atuin
    zellij

    rustc
    rustup
    bun

    spotify
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
          	if status is-interactive
                starship init fish | source
                atuin init fish | source

                if set -q ZELLIJ
                else
                  zellij
                end
      	end
    '';

    shellAliases = {
      vim = "nvim";
      gs = "git status";
      dotl = "cd ~/.dotfiles";
      ls = "eza";
      cat = "bat";
    };
  };

  programs.git = {
    enable = true;
    aliases = {
      pod = "pull origin dev";
      sw = "switch";
      swc = "switch -c";
      df = "diff";
      wd = "diff --word-diff";
      dc = "diff --cached";
      dfs = "diff --stat";
      lg = "log --oneline --graph --abbrev-commit --date=relative";
      sp = "stash pop";
      sa = "stash push --include-untracked";
      sl = "stash list";
      ss = "stash show --stat";
    };
    extraConfig = {
      core = {
        pager = "delta";
        excludesFile = "~/.dotfiles/.config/git/gitignore_global";
      };
      user = {
        name = "Pontus";
        email = "52171526+psoder@users.noreply.github.com";
      };
      help.autocorrect = "15";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff";
      rerere.enabled = true;
      grep = {
        lineNumber = true;
        patternType = "perl";
      };
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
    };
    includes = [{
      contents = {
        user = {
          name = "Pontus";
          email = "pontus@clira.io";
        };
      };

      condition = "gitdir:~/Clira/*";
    }];
  };

  home.file = {
    ".config/nvim".source = ../../../.config/nvim;

    ".config/git".source = ../../../.config/git;

    ".config/ghostty/config".text = ''
      initial-command = fish

      theme = catppuccin-macchiato 
      background-opacity = 0.95
      keybind = ctrl+shift+enter=toggle_fullscreen
      keybind = ctrl+enter=unbind
    '';

    ".config/zellij".source = ../../../.config/zellij;

    ".config/starship.toml".source = ../../../.config/starship.toml;

    ".config/atuin".source = ../../../.config/atuin;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/psoder/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

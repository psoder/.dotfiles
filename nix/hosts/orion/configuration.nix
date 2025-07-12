# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "orion"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.fwupd.enable = true;

  # Enable fingerprint reader support
  services.fprintd.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.psoder = {
    isNormalUser = true;
    description = "Pontus";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;

    packages = with pkgs; [
      stow
      bat
      eza
      dust
      starship
      delta
      tokei
      atuin
      zellij
      fzf

      hyprshot
      hyprlock
      hypridle
      hyprpaper
      hyprcursor
      swaynotificationcenter
      catppuccin-cursors.macchiatoPeach

      rustc
      rustup
      bun

      spotify
      obsidian
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    dconf.profiles.psoder.databases = [{
      lockAll = true;
      settings = {
        "org/gnome/desktop/input-sources" = {
          show-all-sources = true;
          sources = [ [ "xkb:eu" ] ];
          xkb-options = "";
        };
      };
    }];

    fish.enable = true;
    firefox.enable = true;
    steam.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    hyprland = {
      enable = true;
      withUWSM = true;
    };

    waybar.enable = true;
    
    yazi.enable = true;
  };

  # programs.nvf = {
  #   enable = true;
  #   settings = {
  #     vim = {
  #       theme = {
  #         enable = true;
  #         name = "catppuccin";
  #         style = "macchiato";
  #       };
  #
  #       statusline.lualine.enable = true;
  #
  #       telescope = {
  #         enable = true;
  #         setupOpts = {
  #           defaults = {
  #             color_devicons = true;
  #             mappings = {
  #               i = (lib.generators.mkLuaInline ''
  #                 { ['<c-enter>'] = 'to_fuzzy_refine' }
  #               '');
  #             };
  #           };
  #         };
  #         extensions = [
  #           {
  #             name = "fzf";
  #             packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
  #             setup = { fzf = { fuzzy = true; }; };
  #           }
  #           {
  #             name = "ui-select";
  #             packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
  #             setup = {
  #               ui-select = "require('telescope.builtin').get_dropdown()";
  #             };
  #           }
  #         ];
  #         mappings = {
  #           helpTags = "<leader>sh";
  #           findFiles = "<leader>sf";
  #           liveGrep = "<leader>sg";
  #           diagnostics = "<leader>sd";
  #           resume = "<leader>sr";
  #           buffers = "<leader><leader>";
  #         };
  #       };
  #
  #       treesitter = {
  #         enable = true;
  #         fold = true;
  #       };
  #
  #       autocomplete = {
  #         nvim-cmp = {
  #           enable = true;
  #           mappings = {
  #             confirm = "<C-y>";
  #             complete = "<C-Space>";
  #             next = "<C-n>";
  #             previous = "<C-p>";
  #             scrollDocsDown = "<C-f>";
  #             scrollDocsUp = "<C-b>";
  #           };
  #           sourcePlugins = [ "cmp-luasnip" "cmp-nvim-lsp" "cmp-path" ];
  #         };
  #       };
  #       autopairs.nvim-autopairs.enable = true;
  #       undoFile.enable = true;
  #       searchCase = "smart";
  #
  #       comments.comment-nvim.enable = true;
  #
  #       filetree.nvimTree = {
  #         enable = true;
  #         setupOpts = { git.enable = true; };
  #       };
  #
  #       formatter.conform-nvim = {
  #         enable = true;
  #         setupOpts = { formatters_by_ft = { nix = [ "nixfmt" ]; }; };
  #       };
  #
  #       lsp = {
  #         enable = true;
  #         formatOnSave = true;
  #         lightbulb.enable = true;
  #
  #         mappings = {
  #           nextDiagnostic = "[d";
  #           previousDiagnostic = "]d";
  #           openDiagnosticFloat = "<leader>e";
  #
  #           goToDefinition = "gd";
  #           listReferences = "gr";
  #           listImplementations = "gI";
  #           goToType = "<leader>D";
  #           listDocumentSymbols = "<leader>ds";
  #           signatureHelp = "<leader>ds";
  #           listWorkspaceSymbols = "<leader>ws";
  #           renameSymbol = "<leader>rn";
  #           codeAction = "<leader>ca";
  #           goToDeclaration = "<leader>gD";
  #         };
  #       };
  #
  #       languages = {
  #         enableTreesitter = true;
  #
  #         nix.enable = true;
  #         rust = {
  #           enable = true;
  #           lsp.enable = true;
  #           treesitter.enable = true;
  #         };
  #         ts.enable = true;
  #         lua.enable = true;
  #       };
  #
  #       options = {
  #         updatetime = 250;
  #         tm = 300;
  #       };
  #
  #       globals = { maplocalleader = " "; };
  #
  #       utility = {
  #         icon-picker.enable = true;
  #         smart-splits = {
  #           enable = true;
  #           keymaps = {
  #             swap_buf_down = null;
  #             swap_buf_up = null;
  #             swap_buf_left = null;
  #             swap_buf_right = null;
  #           };
  #         };
  #       };
  #
  #       binds = {
  #         whichKey = {
  #           enable = true;
  #           register = {
  #             "<leader>c" = "[C]ode";
  #             "<leader>d" = "[D]ocument";
  #             "<leader>r" = "[R]ename";
  #             "<leader>s" = "[S]earch";
  #             "<leader>w" = "[W]orkspace";
  #             "<leader>t" = "[T]oggle";
  #             "<leader>h" = "Git [H]unk";
  #           };
  #         };
  #       };
  #
  #       notes.todo-comments.enable = true;
  #
  #       git.gitsigns.enable = true;
  #
  #       startPlugins = [ "vim-sleuth" ];
  #
  #       diagnostics = {
  #         enable = true;
  #         nvim-lint = {
  #           enable = true;
  #           linters_by_ft = { markdown = [ "markdownlint" ]; };
  #         };
  #       };
  #
  #       keymaps = [
  #         {
  #           key = "<ESC>";
  #           mode = [ "n" ];
  #           action = "<cmd>nohlsearch<CR>";
  #         }
  #         {
  #           key = "<leader>sk";
  #           mode = [ "n" ];
  #           action = "<cmd>Telescope keymaps<CR>";
  #           desc = "[S]earch [K]eymaps";
  #         }
  #         {
  #           key = "<leader>ss";
  #           mode = [ "n" ];
  #           action = "<cmd>Telescope builtin<CR>";
  #           desc = "[S]earch [S]elect Telescope";
  #         }
  #         {
  #           key = "<leader>sw";
  #           mode = [ "n" ];
  #           action = "<cmd>Telescope grep_string<CR>";
  #           desc = "[S]earch current [W]ord";
  #         }
  #         {
  #           key = "<leader>.";
  #           mode = [ "n" ];
  #           action = "<cmd>Telescope oldfiles<CR>";
  #           desc = "[S]earch Recent Files";
  #         }
  #         {
  #           key = "<leader>/";
  #           mode = [ "n" ];
  #           lua = true;
  #           action = ''
  #             function()
  #               require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
  #                 winblend = 10,
  #                 previewer = false,
  #               })
  #             end
  #           '';
  #         }
  #         {
  #           key = "<leader>s/";
  #           mode = [ "n" ];
  #           lua = true;
  #           action = ''
  #             function()
  #               require('telescope.builtin').live_grep {
  #                 grep_open_files = true,
  #                 prompt_title = 'Live Grep in Open Files',
  #               }
  #             end
  #           '';
  #         }
  #       ];
  #
  #       mini = {
  #         ai.enable = true;
  #         surround.enable = true;
  #         statusline.enable = true;
  #       };
  #
  #       augroups = [{
  #         name = "kickstart-highlight-yank";
  #         clear = true;
  #       }];
  #
  #       autocmds = [{
  #         enable = true;
  #         desc = "Highlight when yanking text";
  #         event = [ "TextYankPost" ];
  #         group = "kickstart-highlight-yank";
  #         callback = (lib.generators.mkLuaInline ''
  #           function()
  #             vim.highlight.on_yank()
  #           end
  #         '');
  #       }];
  #
  #       visuals = {
  #         nvim-web-devicons.enable = true;
  #         fidget-nvim = {
  #           enable = true;
  #           setupOpts = { integration.nvim-tree.enable = true; };
  #         };
  #         indent-blankline.enable = true;
  #       };
  #     };
  #   };
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    cmake
    unzip
    ghostty
    gcc
    busybox
    ripgrep
    ripgrep-all
    fd
    nixd
    nixfmt
    brightnessctl

    wofi
    font-awesome
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.nftables.enable = true;
  # networking.firewall.allowedInterfaces = [ "wlp192s0" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

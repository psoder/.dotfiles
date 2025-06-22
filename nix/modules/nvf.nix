{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    statusline.lualine.enable = true;

    telescope = { enable = true; };

    autocomplete = { nvim-cmp.enable = true; };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      ts.enable = true;
    };
  };
}

{ config, pkgs, inputs, ... }: {
  imports = [
    # stylix must be added to config and home manager twice, due to standalone usage of home manager
    inputs.stylix.homeManagerModules.stylix
    ../modules/theming/theming.nix
    ./modules/starship.nix
    ./modules/fastfetch.nix
    ./modules/fish.nix
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/bat.nix
    ./packages/sharedPackages.nix
    ./packages/wslPackages.nix
  ];

  home.username = "tim";
  home.homeDirectory = "/home/tim";

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config = { allowUnfree = true; };

  home.file = {
    # Symlink tmux configuration
    ".config/tmux/tmux.conf".source = ./config/tmux/tmux.conf;
  };
  xdg.configFile.nvim.source = ./config/nvim;

  home.sessionVariables = { };

  programs.home-manager.enable = true;
}

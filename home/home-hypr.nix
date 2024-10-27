{ config, pkgs, inputs, ... }: {
  imports = [
    # stylix must be added to config and home manager twice, due to standalone usage of home manager
    inputs.stylix.homeManagerModules.stylix
    inputs.ags.homeManagerModules.default
    ../modules/theming/theming.nix
    ./modules/ags/ags.nix
    ./modules/hyprland/hyprland.nix
    ./modules/hyprland/hyprlock.nix
    ./modules/kitty.nix
    ./modules/alacritty.nix
    ./modules/starship.nix
    ./modules/fastfetch.nix
    ./modules/tofi.nix
    ./modules/fish.nix
    ./modules/bash.nix
    ./modules/fonts.nix
    ./modules/git.nix
    ./modules/bat.nix
    ./packages/sharedPackages.nix
    ./packages/hyprPackages.nix
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
    # symlink ags
    ".config/ags".source = ./modules/ags/config;
  };
  xdg.configFile.nvim.source = ./config/nvim;

  # home.sessionPath = [
  #   "$HOME/.nix-profile/bin" # binaries
  #   "$HOME/.nix-profile/share/applications" # .desktop files
  # ];

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
  #  /etc/profiles/per-user/tim/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

{ config, pkgs, inputs, ... }:
let configPath = builtins.path { path = ./config; };
in {
  imports = [
    # stylix must be added to config and home manager twice, due to standalone usage of home manager
    inputs.stylix.homeManagerModules.stylix
    inputs.ags.homeManagerModules.default
    ./modules/ags/ags.nix
    ./modules/theming.nix
    ./modules/hyprland/home.nix
    ./modules/kitty.nix
    ./modules/alacritty.nix
    ./modules/starship.nix
    ./modules/fastfetch.nix
    ./modules/tofi.nix
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

  home.packages = with pkgs; [
    vscode
    discord
    obsidian
    alacritty
    xfce.thunar
    starship
    vlc
    obs-studio
    wdisplays
    #tools
    zoxide
    dust
    tldr
    bat
    btop
    fastfetch
    yazi
    direnv
    #scripts
   (writeShellScriptBin "ct" (builtins.readFile ./config/scripts/ct))
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

  home.file = {
    # Symlink tmux configuration
    ".config/tmux/tmux.conf".source = "${configPath}/tmux/tmux.conf";
    # Symlink Neovim configuration directory
    ".config/nvim".source = "${configPath}/nvim";
    # symlink ags
    ".config/ags".source = ./modules/ags/config;

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
  #  /etc/profiles/per-user/tim/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

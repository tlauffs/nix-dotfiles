{ config, pkgs, system, inputs, ... }: {
  imports = [
    # stylix must be added to config and home manager twice, due to standalone usage of home manager
    inputs.stylix.homeManagerModules.stylix
    inputs.ags.homeManagerModules.default
    ./modules/theming/theming.nix
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

  # TODO: seperate into wsl and linux/hyprland packages
  home.packages = with pkgs; [
    # programs
    neovim
    kitty
    fish
    tmux
    git
    firefox
    google-chrome
    pavucontrol
    networkmanagerapplet
    #tools
    just
    cargo
    fzf
    fd
    unzip
    brightnessctl
    ripgrep
    wl-clipboard
    nodejs
    hyprshot
    tofi
    gcc
    xfce.thunar
    vscode
    discord
    obsidian
    alacritty
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
    hyprlock
    wlroots
    #scripts
    (writeShellScriptBin "ct" (builtins.readFile ./scripts/ct))
    (writeShellScriptBin "t" (builtins.readFile ./scripts/changetheme))
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
    ".config/tmux/tmux.conf".source = ./config/tmux/tmux.conf;
    # Symlink Neovim configuration directory
    ".config/nvim".source = ./config/nvim;
    # symlink ags
    ".config/ags".source = ./modules/ags/config;
  };

  xdg.configFile."environment.d/envvars.conf".text = ''
    PATH="$HOME/.nix-profile/bin:$PATH"
  '';

  home.sessionPath = [
    "$HOME/.nix-profile/bin" # binaries
    "$HOME/.nix-profile/share/applications" # .desktop files
  ];

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
  targets.genericLinux.enable = true;
}

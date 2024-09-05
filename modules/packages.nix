{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    home-manager
    kitty
    tmux
    fzf
    neofetch
    pavucontrol
    git
    gnumake
    libinput
    unzip
    libgcc
    gcc
    ripgrep
    wl-clipboard
    wget
    just
    nodejs
    # wm packages
    waybar
    dunst
    libnotify
    swww
    rofi-wayland
    networkmanagerapplet
    #apps
    firefox
    google-chrome
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "JetBrainsMono";
      fontSize = "9";
      loginBackground = false;
    })
  ];
}

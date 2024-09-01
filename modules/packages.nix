{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    home-manager
    alacritty
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
    xfce.thunar
    #apps
    firefox
    google-chrome
  ];

}

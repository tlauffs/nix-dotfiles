{ pkgs, ...}:
{
 environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    home-manager
    alacritty
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
    #  wget
  ];

}

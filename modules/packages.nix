{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    home-manager
    kitty
    tmux
    fzf
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
    cargo
    nodejs
    fish
    # tools
    flameshot
    brightnessctl
    # wm packages
    waybar
    # dunst
    libnotify
    swww
    tofi
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

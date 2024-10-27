{ pkgs, ... }: {
  home.packages = with pkgs; [
    # programs
    firefox
    google-chrome
    pavucontrol
    brightnessctl
    wl-clipboard
    hyprshot
    tofi
    xfce.thunar
    vscode
    discord
    obsidian
    vlc
    obs-studio
    wdisplays
    hyprlock
    kitty
    alacritty
  ];
}

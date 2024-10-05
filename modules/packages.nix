{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    home-manager
    gnumake
    libinput
    libgcc
    wget
    libnotify
    networkmanagerapplet
  ];
}

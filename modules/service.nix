{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # fstrim
  services.fstrim.enable = true;
  # for battery info (used by ags)
  services.upower.enable = true;
}

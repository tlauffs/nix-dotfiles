{
  # hardware.graphics = {
  # enable = true;
  # enable32Bit = true;
  # };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
}

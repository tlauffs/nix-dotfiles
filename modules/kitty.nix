{ pkgs, config, ... }: { 

  services = {
    dunst.enable = true;
  };

  programs = {
    waybar.enable = true;
    kitty.enable = true;
    alacritty.enable = true;
    # rofi.enable = true;
  };

}

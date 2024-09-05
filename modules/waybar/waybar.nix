{ pkgs, config, ... }: {
  # disable auto generated stylix styles
  stylix.targets.waybar.enable = false;
  # config
  programs = {
    waybar = {
      enable = true;
      # systemd.enable = true;
      # systemd.target = "graphical-session.target";
      style = ./style.css;
    };
  };
}

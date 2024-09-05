{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    theme = "catppuccin-mocha";
    settings = {
      # Autologin = {
      #   Session = "hyprland";
      #   User = "tim";
      # };
    };
  };
}

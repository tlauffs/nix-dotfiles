{ inputs, pkgs, config, ... }: {

  # Theming
  stylix.enable = true;
  stylix.autoEnable = true;
  # stylix.homeManagerIntegration.autoImport = false;
  # stylix.homeManagerIntegration.followSystem = false;

  # the stylix.image option currently needs to be set but is not bieng used since all colors are from base16Scheme
  stylix.image = ../../assets/images/kanagawa.jpg;

 stylix.base16Scheme = {
    base00 = "1F1F28";
    base01 = "2A2A37";
    base02 = "223249";
    base03 = "727169";
    base04 = "C8C093";
    base05 = "DCD7BA";
    base06 = "938AA9";
    base07 = "363646";
    base08 = "C34043";
    base09 = "FFA066";
    base0A = "DCA561";
    base0B = "98BB6C";
    base0C = "7FB4CA";
    base0D = "7E9CD8";
    base0E = "957FB8";
    base0F = "D27E99";
  };

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 16;

  # fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; };
      name = "VictorMono Nerd Font";
    };
    sansSerif = {
      package = pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; };
      name = "CaskaydiaCove Nerd Font";
    };
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };
  };
  stylix.fonts.sizes = {
    applications = 12;
    terminal = 12;
    desktop = 10;
    popups = 10;
  };

  # terminal theming 
  stylix.opacity = { terminal = 0.82; };

}

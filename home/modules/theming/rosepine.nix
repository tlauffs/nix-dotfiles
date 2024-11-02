{ pkgs, ... }: {

  # Theming
  stylix.enable = true;
  stylix.autoEnable = true;
  # stylix.homeManagerIntegration.autoImport = false;
  # stylix.homeManagerIntegration.followSystem = false;

# the stylix.image option currently needs to be set but is not bieng used since all colors are from base16Scheme
  stylix.image =  ../../assets/images/rose-pine.jpg;

  stylix.base16Scheme = {
    base00 = "191724";
    base01 = "1f1d2e";
    base02 = "26233a";
    base03 = "6e6a86";
    base04 = "908caa";
    base05 = "e0def4";
    base06 = "e0def4";
    base07 = "524f67";
    base08 = "eb6f92";
    base09 = "f6c177";
    base0A = "ebbcba";
    base0B = "31748f";
    base0C = "9ccfd8";
    base0D = "c4a7e7";
    base0E = "f6c177";
    base0F = "524f67";
  };

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 16;

  # fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrainsMono Nerd Font";
    };
    sansSerif = {
      # package = pkgs.nerdfonts.override { fonts = [ "FiraSans" ]; };
      # name = "FiraSans";
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrainsMono Nerd Font";

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
  stylix.opacity = { terminal = 0.9; };

}

{ inputs, pkgs, config, ... }: {

  # Theming
  stylix.enable = true;
  stylix.autoEnable = true;
  # stylix.homeManagerIntegration.autoImport = false;
  # stylix.homeManagerIntegration.followSystem = false;

  # the stylix.image option currently needs to be set but is not bieng used since all colors are from base16Scheme
  stylix.image = ../assets/images/Cloudsday.jpg;
  stylix.base16Scheme = {
    base00 = "1e1e2e"; # base
    base01 = "181825"; # mantle
    base02 = "313244"; # surface0
    base03 = "45475a"; # surface1
    base04 = "585b70"; # surface2
    base05 = "cdd6f4"; # text
    base06 = "f5e0dc"; # rosewater
    base07 = "b4befe"; # lavender
    base08 = "f38ba8"; # red
    base09 = "fab387"; # peach
    base0A = "f9e2af"; # yellow
    base0B = "a6e3a1"; # green
    base0C = "94e2d5"; # teal
    base0D = "89b4fa"; # blue
    base0E = "cba6f7"; # mauve
    base0F = "f2cdcd"; # flamingo
  };

  # cursor
  stylix.cursor.package = pkgs.catppuccin-cursors.mochaLight;
  stylix.cursor.name = "Catppuccin-Mocha-Light-Cursors";
  stylix.cursor.size = 16;

  # fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
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

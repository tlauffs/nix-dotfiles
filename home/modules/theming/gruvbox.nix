{ inputs, pkgs, config, ... }: {

  # Theming
  stylix.enable = true;
  stylix.autoEnable = true;
  # stylix.homeManagerIntegration.autoImport = false;
  # stylix.homeManagerIntegration.followSystem = false;

  # the stylix.image option currently needs to be set but is not bieng used since all colors are from base16Scheme
  stylix.image = ../../assets/images/gruvbox.png;

  stylix.base16Scheme = {
    base00 = "202020"; # bg
    base01 = "2a2827"; # bg2
    base02 = "504945"; # bg6
    base03 = "5a524c"; # bg8
    base04 = "bdae93"; # p-fg3
    base05 = "ddc7a1"; # fg
    base06 = "ebdbb2"; # p-fg1
    base07 = "fbf1c7"; # p-fg0
    base08 = "ea6962"; # red
    base09 = "e78a4e"; # orange
    base0A = "d8a657"; # yellow
    base0B = "a9b665"; # green
    base0C = "89b482"; # aqua/cyan
    base0D = "7daea3"; # blue
    base0E = "d3869b"; # purple
    base0F = "bd6f3e"; # dim-orange
  };

  # cursor
  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 16;

  # fonts
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; };
      name = "Cascadia Mono NF";
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
  stylix.opacity = { terminal = 0.9; };

}

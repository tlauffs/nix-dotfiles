{ pkgs, config, ... }: {
  programs = {
    kitty = {
      enable = true;
      settings = {
        # Font settings
        font_family = "JetBrainsMono";
        font_size = "13.0";

        foreground = "#${config.colorScheme.palette.base05}";
        background = "#${config.colorScheme.palette.base00}";
        selection_foreground = "#${config.colorScheme.palette.base06}";
        selection_background = "#${config.colorScheme.palette.base02}";
        url_color = "#${config.colorScheme.palette.base0D}";

        color0 = "#${config.colorScheme.palette.base00}";
        color1 = "#${config.colorScheme.palette.base08}";
        color2 = "#${config.colorScheme.palette.base0B}";
        color3 = "#${config.colorScheme.palette.base0A}";
        color4 = "#${config.colorScheme.palette.base0D}";
        color5 = "#${config.colorScheme.palette.base0E}";
        color6 = "#${config.colorScheme.palette.base0C}";
        color7 = "#${config.colorScheme.palette.base05}";

        color8 = "#${config.colorScheme.palette.base03}";
        color9 = "#${config.colorScheme.palette.base09}";
        color10 = "#${config.colorScheme.palette.base0B}";
        color11 = "#${config.colorScheme.palette.base0A}";
        color12 = "#${config.colorScheme.palette.base0D}";
        color13 = "#${config.colorScheme.palette.base0E}";
        color14 = "#${config.colorScheme.palette.base0C}";
        color15 = "#${config.colorScheme.palette.base07}";

        # Cursor settings
        cursor = "#${config.colorScheme.palette.base05}";
        cursor_text_color = "#${config.colorScheme.palette.base00}";
        cursor_shape = "block";
        cursor_blink = false;

        # Window settings
        background_opacity = "0.85";
        dynamic_background_opacity = false;
        window_padding_width = "4";
        window_padding_height = "4";

        # Scrolling and mouse settings
        scrollback_lines = "10000";
        mouse_hide_wait = "3.0";
      };
    };
  };
}

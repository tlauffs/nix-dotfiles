{ lib, config, ... }: {
  stylix.targets.tofi.enable = false;
  programs.tofi = {
    enable = true;
    settings = {
      font = "JetBrains Mono Nerd Font";
      font-size = 14;

      # Window Style
      horizontal = true;
      anchor = "top";
      width = "100%";
      height = 34;
      outline-width = 0;
      border-width = 0;
      min-input-width = 130;
      result-spacing = 30;
      padding-top = 6;
      padding-bottom = 0;
      padding-left = 16;
      padding-right = 0;
      prompt-text = "  drun:";

      # Catppuccin Theme with hex color references
      prompt-color =
        lib.mkForce "${config.stylix.base16Scheme.base0D}"; # blue
	  prompt-padding = 50;

      background-color =
        lib.mkForce "${config.stylix.base16Scheme.base00}"; # Base background
      text-color =
        lib.mkForce "${config.stylix.base16Scheme.base05}"; # Text color

      input-color =
        lib.mkForce "${config.stylix.base16Scheme.base04}"; # Input text color
      input-background = lib.mkForce
        "${config.stylix.base16Scheme.base02}"; # Darker background for input
      input-background-padding = "3, 10"; # Nix array syntax
      input-background-corner-radius = 12;

      selection-color = lib.mkForce
        "${config.stylix.base16Scheme.base0B}"; # Selected item background
      selection-match-color = lib.mkForce
        "${config.stylix.base16Scheme.base0E}"; # Matched text highlight
      selection-background = lib.mkForce
        "${config.stylix.base16Scheme.base02}"; # Darker background for selection
      selection-background-padding = "3, 10"; # Nix array syntax
      selection-background-corner-radius = 12;

      clip-to-padding = false;
      require-match = false;
    };
  };
}

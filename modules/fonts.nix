{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      dejavu_fonts
      powerline-fonts
      powerline-symbols
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };
}

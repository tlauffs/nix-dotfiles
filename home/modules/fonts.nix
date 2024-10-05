{ pkgs, ... }: {
  fonts = {
    fontconfig.enable = true;
    # enableDefaultPackages = true;
  };
  home.packages = with pkgs; [
    jetbrains-mono
    victor-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    dejavu_fonts
    powerline-fonts
    powerline-symbols
    cascadia-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" "CascadiaCode" ]; })
  ];
}

{ pkgs, ... }: 
{
fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
     (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [ "JetBrainsMono" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };
}

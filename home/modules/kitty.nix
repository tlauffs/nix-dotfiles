{ pkgs, config, ... }: {
  programs = {
    kitty.enable = true;
    kitty.extraConfig = "window_padding_width 6";
  };
}

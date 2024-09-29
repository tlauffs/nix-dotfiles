let
  catppuccin = import ./catppuccin.nix;
  gruvbox = import ./gruvbox.nix;
  kanagawa = import ./kanagawa.nix;

  selectedScheme = builtins.getEnv "COLOR_SCHEME";

  theme = if selectedScheme == "gruvbox" then
    gruvbox
  else if selectedScheme == "kanagawa" then
    kanagawa
  else
    catppuccin;
in theme

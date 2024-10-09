let
  catppuccin = import ./catppuccin.nix;
  gruvbox = import ./gruvbox.nix;
  kanagawa = import ./kanagawa.nix;
  rosepine = import ./rosepine.nix;

  filePath = /home/tim/nix-dotfiles/home/current_theme.txt;
  selectedScheme = builtins.readFile filePath;

  isGruvbox = builtins.match (".*gruvbox.*") selectedScheme != null;
  isKanagawa = builtins.match (".*kanagawa.*") selectedScheme != null;
  isRosepine = builtins.match (".*rose-pine.*") selectedScheme != null;

  theme =
    if isGruvbox then gruvbox else if isKanagawa then kanagawa else if isRosepine then rosepine else catppuccin;
in theme

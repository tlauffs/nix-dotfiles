{ pkgs, config, ... }: {
  programs.ags = {
    enable = true;
    # null or path, leave as null if you don't want hm to manage the config
    # broken -> manged in home.files
    # configDir = ./config;
    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
  };
}

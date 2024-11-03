{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    fish
    tmux
    git
    just
    cargo
    fzf
    fd
    unzip
    ripgrep
    nodejs
    gcc
    starship
    zoxide
    dust
    tldr
    bat
    btop
    fastfetch
    yazi
    direnv
    php
    gnumake
    #scripts
    (writeShellScriptBin "ct" (builtins.readFile ../scripts/ct))
    (writeShellScriptBin "t" (builtins.readFile ../scripts/changetheme))
  ];
}

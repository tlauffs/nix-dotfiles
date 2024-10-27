{ pkgs, ... }: {
  home.packages = with pkgs; [
    # programs
    neovim
    fish
    tmux
    git
    fzf
    just
    cargo
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

    # langauge servers
    lua-language-server
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    emmet-ls
    nodePackages.bash-language-server
    nodePackages.diagnostic-languageserver
    nodePackages.dockerfile-language-server-nodejs
    pyright
    php
    phpactor
    nil
    #formaters
    nodePackages.prettier
    stylua
    black
    php83Packages.php-cs-fixer
    alejandra

    #scripts
    (writeShellScriptBin "ct" (builtins.readFile ../scripts/ct))
    (writeShellScriptBin "t" (builtins.readFile ../scripts/changetheme))
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

}

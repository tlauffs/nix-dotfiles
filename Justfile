# just is a command runner, Justfile is very similar to Makefile, but simpler.
############################################################################
#
#  Nix and Home Manager specific commands
#  currently --impure is need as current_theme.txt is read as absolute path
############################################################################

# WSL-specific build
terminal-build:
  home-manager switch --impure --flake .#tim-terminal

# Hyprland-specific build
desktop-build:
  home-manager switch --impure --flake .#tim-desktop

# Universal commands
up:
  nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
  nix flake update $(i)

# Show profile history for NixOS
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Open a Nix repl
repl:
  nix repl -f flake:nixpkgs

# Garbage collect all unused Nix store entries
gc:
  sudo nix-collect-garbage --delete-old

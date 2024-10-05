# just is a command runner, Justfile is very similar to Makefile, but simpler.
############################################################################
#
#  NixOS and Home Manager specific commands
#  currently --impure is need as current_theme.txt is read as absolute path
############################################################################

# NixOS-specific update (includes both NixOS and Home Manager updates for Hyprland)
nixos-update:
  nixos-rebuild switch --impure --flake . --use-remote-sudo
  home-manager switch --impure --flake .#tim-hypr

# WSL-specific Home Manager update
wsl-update:
  home-manager switch --impure --flake .#tim-wsl

# Hyprland-specific Home Manager update (non-NixOS systems)
hypr-update:
  home-manager switch --impure --flake .#tim-hypr

# NixOS-specific build
nixos-build:
  nixos-rebuild switch --impure --flake . --use-remote-sudo
  home-manager switch --impure --flake .#tim-hypr

# WSL-specific build
wsl-build:
  home-manager switch --impure --flake .#tim-wsl

# Hyprland-specific build
hypr-build:
  home-manager switch --impure --flake .#tim-hypr

# Debug for NixOS
nixos-debug:
  nixos-rebuild switch --impure --flake . --use-remote-sudo --show-trace --verbose

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

# Clean old profile generations (older than 7 days)
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d

# Garbage collect all unused Nix store entries
gc:
  sudo nix-collect-garbage --delete-old

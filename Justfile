# just is a command runner, Justfile is very similar to Makefile, but simpler.
############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

update:
  git submodule update --init --recursive
  nixos-rebuild switch --flake . --use-remote-sudo
  home-manager switch --flake "$HOME/nix-dotfiles?submodules=1"

build:
  nixos-rebuild switch --flake . --use-remote-sudo
  home-manager switch --flake "$HOME/nix-dotfiles?submodules=1"

debug:
  nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

up:
  nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
  nix flake update $(i)

history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old


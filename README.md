## Dotfiles for NixOS and Home Manager Config

### Running on NixOS (Hyprland)
- **First time setup**:
    - Run `just nixos-update` or use the following two commands:
        nixos-rebuild switch --flake . --use-remote-sudo
        home-manager switch --flake .#tim-hypr
- **Rebuild**: Run `just nixos-build`.

### Running Home Manager on non-NixOS (WSL, Ubuntu, etc.)
- **Install Nix package manager**: https://nixos.org/download/
- **Install standalone Home Manager**: https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone
- **Enable flakes** in `~/.config/nix/nix.conf`:
    experimental-features = nix-command flakes
- **First time setup**:
    - For **WSL**, run `just wsl-update` or the following command:
        home-manager switch --flake .#tim-wsl
    - For **Hyprland (non-NixOS)**, run `just hypr-update` or the following command:
        home-manager switch --flake .#tim-hypr
- **Rebuild**:
    - For **WSL**, run `just wsl-build`.
    - For **Hyprland (non-NixOS)**, run `just hypr-build`.

### General Commands
- **Update flake**: Run `just up` to update all flake inputs.
- **Garbage collect old generations**: Run `just gc` to clean up old Nix store entries.

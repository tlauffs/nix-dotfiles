## Dotfiles for NixOS and Home Manager Config

### Running Home Manager on non-NixOS Disto or WSL
- **Install Nix package manager**: https://nixos.org/download/
- **Install standalone Home Manager**: https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone
- **Enable flakes** in `~/.config/nix/nix.conf`:
    experimental-features = nix-command flakes
- **Enable nixgl**: https://github.com/nix-community/nixGL
    - nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
    - nix-env -iA nixgl.auto.nixGLDefault
- **Add Hyprland to Login Manager**:
   - if using LightDM:
        - change /usr/share/wayland-sessions/hyprland.desktop to:
        ```
        [Desktop Entry]
        Name=Hyprland
        Comment=An intelligent dynamic tiling Wayland compositor
        Exec=nixGL Hyprland
        Type=Application
        ```


- **To Build:**
    - For **WSL**, run `just terminal-build` or the following command:
        `home-manager switch --impure --flake .#tim-terminal`
    - For **Hyprland (non-NixOS)**, run `just desktop-build` or the following command:
        `home-manager switch --impure --flake .#tim-desktop`

### Running on NixOS (Hyprland):
- The master Branch of this repo is currently only using nix and home-manger, there is a brach nixos-config that uses nixos but it isnt being updated
- **First time setup**:
    - Run `just nixos-update` or use the following two commands:
        `nixos-rebuild switch --impure --flake . --use-remote-sudo`
        `home-manager switch --impure --flake .#tim-hypr`
- **Rebuild**: Run `just nixos-build`.


### General Commands
- **Update flake**: Run `just up` to update all flake inputs.
- **Garbage collect old generations**: Run `just gc` to clean up old Nix store entries.

![Prefiew Image](./preview.png)

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  _module.args.pkgsUnstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };

  imports = [ # Include the results of the hardware scan.
    inputs.stylix.nixosModules.stylix
    ./hardware-configuration.nix
    # doesnt work yet on stable branch
    # ./modules/displaymanager.nix
    ./modules/theming/theming.nix
    ./modules/bootloader.nix
    ./modules/networking.nix
    ./modules/timzone.nix
    ./modules/user.nix
    ./modules/hyprland/global.nix
    ./modules/sound.nix
    ./modules/fonts.nix
    ./modules/packages.nix
    ./modules/service.nix
    ./modules/fish.nix
    ./modules/graphics.nix
    ./modules/steam.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # flakes enable
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

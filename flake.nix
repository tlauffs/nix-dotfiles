{
  description = "Tim's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # nixgl.url = "github:nix-community/nixGL";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let system = "x86_64-linux";
    in {
      formatter.x86_64-linux =
        nixpkgs.legacyPackages.x86_64-linux.nixfmt-classic;

      # Home Manager configuration for hyprland
      homeConfigurations.tim-desktop = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/home-desktop.nix ]; # Linux-specific Home Manager config
      };

      # Home Manager configuration for WSL
      homeConfigurations.tim-terminal = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home/home-terminal.nix ]; # WSL-specific Home Manager config
      };

    };
}


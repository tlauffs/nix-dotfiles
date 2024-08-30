{
  description = "Tim's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      nix-colors.url = "github:misterio77/nix-colors";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let 
    	system = "x86_64-linux";
    in {
      formatter.x86_64-linux =
        nixpkgs.legacyPackages.x86_64-linux.nixfmt-classic;
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
	  specialArgs = { inherit nix-colors; };
      };
      homeConfigurations.tim = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home.nix ];
	  extraSpecialArgs = { inherit nix-colors; };
      };
    };
}

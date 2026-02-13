{
  description = "Niko loves configs <3";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { nixpkgs, nixpkgs-unstable, home-manager, niri, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
      
      mkSystem = pkgs: system: hostname: 
        pkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          };
          modules = [
            niri.nixosModules.niri
            { networking.hostName = hostname; }
            ./configuration.nix
            ./hosts/${hostname}/hardware-configuration.nix
          ];
        };
    in {
      nixosConfigurations = {
        nikopad = mkSystem nixpkgs system "nikopad";
      };
      homeConfigurations.ratyuha = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          niri.homeModules.niri
          ./home
        ];
      };
    };
}

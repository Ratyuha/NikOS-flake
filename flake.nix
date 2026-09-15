{
  description = "Niko loves configs <3";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };
  
  outputs = { nixpkgs, nixpkgs-unstable, home-manager, niri, nixvim, ... }@inputs:
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
            ./shared
            ./hosts/${hostname}/default.nix
          ];
        };
    in {
      nixosConfigurations = {
        nikopad = mkSystem nixpkgs system "nikopad";
        nikostation = mkSystem nixpkgs system "nikostation";
      };
      homeConfigurations.ratyuha = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          niri.homeModules.niri
          nixvim.homeModules.nixvim
          ./home
        ];
      };
    };
}

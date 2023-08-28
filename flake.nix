{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    username = "ivenw";
    hostname = "nixos";
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        }; # Pass flake inputs to our config
        modules = [./nixos/configuration.nix];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."${system}";
      extraSpecialArgs = {
        inherit inputs;
      }; # Pass flake inputs to our config
      modules = [
        ./home-manager/home.nix
      ];
    };

    devShells."${system}" = {
      python310 = pkgs.mkShell {
        name = "python310";
        packages = with pkgs; [
          python310
          poetry
          gcc
        ];
        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib"
        '';
      };
      rust = pkgs.mkShell {
        name = "rust";
        packages = with pkgs; [
          rustup
        ];
      };
    };
  };
}

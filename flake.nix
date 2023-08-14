{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:misterio77/nix-colors";

    # hardware.url = "github:nixos/nixos-hardware";

  };

  outputs =
    { nixpkgs
    , nixpkgs-unstable
    , home-manager
      # , hyprland
    , nix-colors
    , ...
    }@inputs:
    let
      username = "ivenw";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
      pkgs-unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {

          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
          }; # Pass flake inputs to our config
          modules = [ ./nixos/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}"; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {
          inherit inputs;
          pkgs-unstable = nixpkgs-unstable.legacyPackages."${system}";
          inherit nix-colors;
        }; # Pass flake inputs to our config
        modules = [ ./home-manager/home.nix ];
      };


      devShells.x86_64-linux.python38 = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.poetry
          pkgs.python38
        ];

      };
    };
}

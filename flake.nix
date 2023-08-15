{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:misterio77/nix-colors";

    # hardware.url = "github:nixos/nixos-hardware";

  };

  outputs =
    { nixpkgs
    , home-manager
    , nix-colors
    , ...
    }@inputs:
    let
      username = "ivenw";
      hostname = "nixos";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {

          specialArgs = {
            inherit inputs;
          }; # Pass flake inputs to our config
          modules = [ ./nixos/configuration.nix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations."${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."${system}";
        extraSpecialArgs = {
          inherit inputs;
          inherit nix-colors;
        }; # Pass flake inputs to our config
        modules = [ ./home-manager/home.nix ];
      };


      # devShells.x86_64-linux.python38 = pkgs.mkShell {
      #   nativeBuildInputs = [
      #     pkgs.poetry
      #     pkgs.python38
      #   ];

    };
}

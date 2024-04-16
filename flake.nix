{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-terraform.url = "github:stackbuilders/nixpkgs-terraform";
    # hardware.url = "github:nixos/nixos-hardware";
  };

  nixConfig = {
    extra-substituters = "https://nixpkgs-terraform.cachix.org";
    extra-trusted-public-keys = "nixpkgs-terraform.cachix.org-1:8Sit092rIdAVENA3ZVeH9hzSiqI/jng6JiCrQ1Dmusw=";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixpkgs-terraform,
    ...
  } @ inputs: let
    username = "ivenw";
    hostname = "nixos";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [nixpkgs-terraform.overlays.default];
    };
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
      python312 = pkgs.mkShell {
        name = "python312";
        packages = with pkgs; [
          python312
          poetry
          gcc
          zlib
        ];
        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib"
        '';
      };
      python311 = pkgs.mkShell {
        name = "python311";
        packages = with pkgs; [
          python311
          poetry
          gcc
          zlib
        ];
        shellHook = ''
          export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib"
        '';
      };
      rust = pkgs.mkShell {
        name = "rust";
        packages = with pkgs; [
          rustup
          bacon
        ];
      };
      zig = pkgs.mkShell {
        name = "zig";
        packages = with pkgs; [
          zig
        ];
      };
      go = pkgs.mkShell {
        name = "go";
        packages = with pkgs; [
          go
        ];
      };
      tf = pkgs.mkShell {
        name = "tf";
        packages = with pkgs; [
          terraform-versions."1.5.7"
          opentofu
          tflint
          tfsec
          terraform-docs
          terramate
          go
        ];
      };
    };
  };
}

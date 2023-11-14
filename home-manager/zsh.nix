{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      # nixos
      rebuild-switch = "sudo nixos-rebuild switch --flake ~/nixos-config";
      rebuild-reboot = "sudo nixos-rebuild boot --flake ~/nixos-config && systemctl reboot";
      update = "home-manager switch --flake ~/nixos-config";
      cleanup = "sudo nix-store --gc && nix-env --delete-generations +1";

      # config
      config-nix = "cd ~/nixos-config && nvim";
      config-nvim = "cd ~/nixos-config/home-manager/nvim && nvim";

      # dev shells
      dev-rust = "nix develop ~/nixos-config#rust -c $SHELL";
      dev-py311 = "nix develop ~/nixos-config#python311 -c $SHELL";
      dev-go = "nix develop ~/nixos-config#go -c $SHELL";
      dev-zig = "nix develop ~/nixos-config#zig -c $SHELL";
      dev-node = "nix develop ~/nixos-config#node -c $SHELL";
    };
    oh-my-zsh = {
      enable = true;
    };
  };
}

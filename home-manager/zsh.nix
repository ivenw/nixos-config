{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      # nixos
      nix-system-update-now = "sudo nixos-rebuild switch --flake ~/nixos-config";
      nix-system-update-on-reboot = "sudo nixos-rebuild boot --flake ~/nixos-config && systemctl reboot";
      nix-home-update = "home-manager switch --flake ~/nixos-config";
      nix-upgrade = "nix flake update --flake ~/nixos-config";
      nix-config = "cd ~/nixos-config";

      switch-to-configuration = "sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch";
      cleanup = "nix-env --delete-generations +1 && switch-to-configuration && sudo nix-collect-garbage -d";

      # config
      config-nvim = "cd ~/nixos-config/home-manager/nvim && nvim";

      pvim = "poetry run nvim";
      ptest = "poetry run pytest";

      # dev shells
      dev-rust = "nix develop ~/nixos-config#rust -c $SHELL";
      dev-py310 = "nix develop ~/nixos-config#python310 -c $SHELL";
      dev-py311 = "nix develop ~/nixos-config#python311 -c $SHELL";
      dev-py312 = "nix develop ~/nixos-config#python312 -c $SHELL";
      dev-go = "nix develop ~/nixos-config#go -c $SHELL";
      dev-zig = "nix develop ~/nixos-config#zig -c $SHELL";
      dev-tf = "nix develop ~/nixos-config#tf -c $SHELL";
    };
    oh-my-zsh = {
      enable = true;
    };
  };
}

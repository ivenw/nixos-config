{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      # nixos
      rebuild-switch = "sudo nixos-rebuild switch --flake ~/nixos-config";
      rebuild-reboot = "sudo nixos-rebuild boot --flake ~/nixos-config && systemctl reboot";
      update = "home-manager switch --flake ~/nixos-config";
      switch-to-configuration = "sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch";
      cleanup = "nix-env --delete-generations +1 && switch-to-configuration && sudo nix-collect-garbage -d";

      # config
      config-nix = "cd ~/nixos-config && nvim";
      config-nvim = "cd ~/nixos-config/home-manager/nvim && nvim";

      # dev shells
      dev-rust = "nix develop ~/nixos-config#rust -c $SHELL";
      dev-py311 = "nix develop ~/nixos-config#python311 -c $SHELL";
      dev-py312 = "nix develop ~/nixos-config#python312 -c $SHELL";
      dev-go = "nix develop ~/nixos-config#go -c $SHELL";
      dev-zig = "nix develop ~/nixos-config#zig -c $SHELL";
      dev-node = "nix develop ~/nixos-config#node -c $SHELL";
    };
    oh-my-zsh = {
      enable = true;
    };
  };
}

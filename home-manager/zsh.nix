{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      update = "home-manager switch --flake ~/nixos-config";
      cleanup = "sudo nix-store --gc && nix-env --delete-generations +1";
      nd = "mkdir -pv";
      nf = "touch";
      deldir = "rm -rIv";
      config-nvim = "cd ~/nixos-config/home-manager/nvim && nvim";
    };
    oh-my-zsh = {
      enable = true;
    };
  };
}

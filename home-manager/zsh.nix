{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
      update = "home-manager switch --flake ~/nixos-config";
      cleanup = "sudo nix profile wipe-history";
      nd = "mkdir -pv";
      nf = "touch";
      rmdir = "rm -rIv";
    };
    oh-my-zsh = {
      enable = true;
    };
  };
}

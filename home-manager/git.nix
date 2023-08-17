{...}: {
  programs.git = {
    enable = true;
    userName = "Iven Winkelmann";
    userEmail = "winkelmann.iven@gmail.com";
    aliases = {
      s = "status";
      c = "commit -m";
      ca = "commit -am";
      co = "checkout";
      aa = "add -A";
      prune = "remote prune origin";
    };
    extraConfig = {
      init.defaultBranch = "main";
      credential = {
        credentialStore = "secretservice";
        helper = "/run/current-system/sw/bin/git-credential-manager";
      };
    };
  };
}

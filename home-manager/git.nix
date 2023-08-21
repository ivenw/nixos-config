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

      # GCM
      credential = {
        credentialStore = "secretservice";
        helper = "/run/current-system/sw/bin/git-credential-manager";
      };
      credential."dev.azure.com".useHttpPath = true;

      # Delta
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only --theme=base16-256";
      delta = {
        navigate = true;
        light = false;
        merge.conflictstyle = "diff3";
        diff.colorMoved = "default";
      };
    };
  };
}

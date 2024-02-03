{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["blue"];
        size = "compact";
        tweaks = [
          "rimless"
          # "black"
        ];
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
    # font = {
    #   name = "JetBrainsMono Nerd Font";
    # };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = true;
      clock-show-weekday = true;
      enable-animations = true;
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
    };
    "org/gnome/system/location" = {
      enabled = true;
    };
    "org/gnome/shell".enabled-extensions = [
      "just-perfection-desktop@just-perfection"
    ];
    "org/gnome/shell/extensions/just-perfection" = {
      theme = true;
      dash = false;
      workspace = false;
      overlay-key = false;
      top-panel-position = 1;
      clock-menu-position = 1;
      clock-menu-position-offset = 6;
      animation = 5;
      notification-banner-position = 5;
    };
    "org/gnome/desktop/wm/keybindings" = {
      toggle-overview = ["<Super>space"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      switch-input-source = ["F2"];
      toggle-fullscreen = ["<Super>f"];
    };
  };
}

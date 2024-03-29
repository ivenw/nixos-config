{pkgs, ...}: let
  catppuccin = {
    name = "Catppuccin-Macchiato-Compact-Flamingo-Dark";
    variant = "macchiato";
    accent = "flamingo";
  };
in {
  gtk = {
    enable = true;
    theme = {
      name = catppuccin.name;
      package = pkgs.catppuccin-gtk.override {
        variant = catppuccin.variant;
        accents = [catppuccin.accent];
        size = "compact";
        tweaks = [
          "rimless"
          # "black"
          # "float"
        ];
      };
    };
    cursorTheme = {
      name = "Catppuccin-Macchiato-Dark-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = catppuccin.variant;
        accent = catppuccin.accent;
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
  # home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Compact-Flamingo-dark";

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
      workspaces-only-on-primary = true;
    };
    "org/gnome/system/location" = {
      enabled = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
    };
    "org/gnome/shell/keybindings" = {
      toggle-overview = ["<Super>space"];
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

    "org/gnome/shell" = {
      disabled-extensions = [];
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "just-perfection-desktop@just-perfection"
      ];
    };
    "org/gnome/shell/user-theme".name = catppuccin.name;
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
  };
}

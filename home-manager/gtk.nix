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
  };
}

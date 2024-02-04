{pkgs, ...}: {
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
      gnome-connections
    ])
    ++ (with pkgs.gnome; [
      simple-scan
      cheese # webcam tool
      epiphany # web browser
      geary # email reader
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-music
      gnome-maps
      gnome-clocks
      gnome-calendar
      gnome-weather
      gnome-contacts
    ]);
  environment.gnome.systemPackages = with pkgs.gnomeExtensions; [
    just-perfection
  ];
}

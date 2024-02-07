{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    blueman
    gnome.nautilus
    networkmanagerapplet
  ];
}

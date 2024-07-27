{ config, pkgs, inputs, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Add Hyprland to the session options
  services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.adwaita-icon-theme
    hyprland
  ];

  # Enable some GNOME services
  services.gnome = {
    core-utilities.enable = true;
    gnome-keyring.enable = true;
  };

  # Enable Wayland support
  services.xserver.displayManager.gdm.wayland = true;
}
{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      # ../../modules/i3.nix
      # ../../modules/gnome-hyprland.nix
      ../../modules/wayland-gnome.nix
      # ../../modules/hyprland.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    initrd.luks.devices."luks-a52d74c7-ae16-4207-b589-68913b9b9ec5".device = "/dev/disk/by-uuid/a52d74c7-ae16-4207-b589-68913b9b9ec5";
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
#   networking.defaultGateway = "192.168.5.201";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

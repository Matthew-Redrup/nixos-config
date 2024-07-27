{ config, pkgs, inputs, ... }:

{
  # Enable Wayland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Configure XDG portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  # Enable greetd display manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    waybar             # Status bar
    swww               # Wallpaper
    dunst              # Notification daemon
    libnotify          # Notification library
    swaylock-effects   # Screen locker
    wofi               # Application launcher
    wl-clipboard       # Clipboard manager
    alacritty          # Terminal
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # Enable sound
#   sound.enable = true;
#   security.rtkit.enable = true;
#   services.pipewire = {
#     enable = true;
#     alsa.enable = true;
#     alsa.support32Bit = true;
#     pulse.enable = true;
#   };
}
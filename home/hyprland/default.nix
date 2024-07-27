# { config, pkgs, ... }:

# {
#   wayland.windowManager.hyprland = {
#     enable = true;
#     extraConfig = ''
#       # Your Hyprland config here
#       # For example:
#       bind = SUPER, Return, exec, kitty
#       bind = SUPER, D, exec, rofi -show drun
#     '';
#   };

#   # Install some useful GNOME extensions
#   home.packages = with pkgs.gnomeExtensions; [
#     appindicator
#     dash-to-dock
#   ];
# }

{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # Monitor
      monitor=,preferred,auto,auto

      # Set programs that you use
      $terminal = alacritty
      $menu = wofi --show drun

      # Some default env vars.
      env = XCURSOR_SIZE,24

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = us
          follow_mouse = 1
          touchpad {
              natural_scroll = true
          }
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 5
          gaps_out = 20
          border_size = 2
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
          layout = dwindle
      }

      decoration {
          rounding = 10
	  drop_shadow = true
	  shadow_range = 4
	  shadow_render_power = 3
	  col.shadow = rgba(1a1a1aee)

	  blur {
		enabled = true
		size = 3
		passes = 1
		new_optimizations = true
	  }
      }

      animations {
          enabled = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_on_top = true
      }

      gestures {
          workspace_swipe = true
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      # Key bindings
      bind = SUPER, Return, exec, $terminal
      bind = SUPER, C, killactive,
      bind = SUPER, M, exit,
      bind = SUPER, E, exec, dolphin
      bind = SUPER, V, togglefloating,
      bind = SUPER, R, exec, $menu
      bind = SUPER, P, pseudo, # dwindle
      bind = SUPER, J, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = SUPER, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = SUPER SHIFT, 1, movetoworkspace, 1
      bind = SUPER SHIFT, 2, movetoworkspace, 2
      bind = SUPER SHIFT, 3, movetoworkspace, 3
      bind = SUPER SHIFT, 4, movetoworkspace, 4
      bind = SUPER SHIFT, 5, movetoworkspace, 5
      bind = SUPER SHIFT, 6, movetoworkspace, 6
      bind = SUPER SHIFT, 7, movetoworkspace, 7
      bind = SUPER SHIFT, 8, movetoworkspace, 8
      bind = SUPER SHIFT, 9, movetoworkspace, 9
      bind = SUPER SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # Execute your favorite apps at launch
      exec-once = waybar & hyprpaper & firefox
    '';
  };

  # Configure other programs
  programs.waybar.enable = true;

  # Install additional packages
  home.packages = with pkgs; [
    swww
    wofi
    dunst
    libnotify
    swaylock-effects
  ];
}

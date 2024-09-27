{ pkgs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      nm-applet --indicator & 
      ags &
      sleep 0.5
      kitty
    	'';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$dmenu" = "tofi-drun | xargs hyprctl dispatch exec --";
      "$menu" = "tofi-run | xargs hyprctl dispatch exec --";
      "$emoji_menu" =
        "cat ~/nix-dotfiles/assets/emoji.txt | tofi | awk '{print $1}' | wl-copy";

      monitor = [
        "* , preferred, auto, 1.0"
        "eDP-1, 1920x1080, 0x0, 1.0"
        "DP-2, preferred, -1920x0, 1.0"
        "desc:HJW HDMI TO USB 0x01348D1D, preferred, auto, 1.0, mirror, DP-2"
      ];

      bindl = [
        # Trigger when the lid closes (disable laptop monitor)
        ''
          ,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable" && ags -q && ags''
        # Trigger when the lid opens (enable laptop monitor)
        ''
          ,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 1920x1080, 0x0, 1" && hyprctl keyword monitor "DP-2, auto, -1920x0, 1.0" && ags -q && ags''
      ];

      general = {
        gaps_in = "2";
        gaps_out = "4";
        border_size = "2";
        layout = "master";
      };

      device = {
        name = "msft0004:00-06cb:ce2d-touchpad";
        sensitivity = "+1.0";
      };

      decoration = {
        rounding = "8";
        active_opacity = "1.0";
        inactive_opacity = "0.88";
        drop_shadow = "false";

        blur = {
          enabled = "true";
          size = "3";
          passes = "1";
          vibrancy = "0.1696";
        };
      };

      animations = {
        enabled = "true";
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
        ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 3, smoothOut, slide"
          "windowsMove, 1, 3, default"
          "border, 1, 3, default"
          "fade, 1, 3, smoothIn"
          "fadeDim, 1, 3, smoothIn"
          "workspaces, 1, 3, default"
        ];
      };

      dwindle = { preserve_split = "true"; };

      misc = {
        force_default_wallpaper = "0";
        disable_splash_rendering = "true";
        disable_hyprland_logo = "true";
      };

      input = {
        kb_layout = "us";
	  kb_variant = "intl";
        accel_profile = "flat";
        follow_mouse = "2";
        touchpad = {
          natural_scroll = "true";
          clickfinger_behavior = "1";
        };
      };

      bind = [
        # actions
        "$mod, RETURN, exec, $terminal"
        "$mod, q, killactive"
        "$mod SHIFT, e, exit"
        "$mod, f, exec, $fileManager"
        "$mod, b, togglefloating"
        "$mod SHIFT, F, fullscreen,"
        #tofi
        "$mod, d, exec, $dmenu"
        "$mod, s, exec, $emoji_menu"
        "$mod SHIFT, d, exec, $menu"
        # change focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod SHIFT, Tab, cyclenext"
        "$mod SHIFT, Tab, bringactivetotop"
        #workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        #move workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        # resize 
        "$mod SHIFT, l, resizeactive, 50 0"
        "$mod SHIFT, h, resizeactive, -50 0"
        "$mod SHIFT, k, resizeactive, 0 -50"
        "$mod SHIFT, j, resizeactive, 0 50"
        # brightness and volume
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ",XF86MonBrightnessUp, exec, brightnessctl s +10%"
      ];
      bindr = [
        # rotate panes
        "$mod, Tab, layoutmsg, rollprev"
      ];
      bindm = [
        #move resize with mouse
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      windowrulev2 = "suppressevent maximize, class:.*";
      exec-once = "${startupScript}/bin/start";
    };
  };
}

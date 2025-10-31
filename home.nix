{ config, pkgs, inputs, ... }:

{
  home.stateVersion = "25.05";

  home.username = "benzo";
  home.homeDirectory = "/home/benzo";

  programs.home-manager.enable = true;

  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      $mod = SUPER

      bind = $mod, Return, exec, ghostty
      bind = $mod, Q, killactive
      bind = $mod SHIFT, M, exit
      bind = $mod, F, fullscreen
      bind = $mod, Space, togglefloating

      bind = $mod, left, movefocus, l
      bind = $mod, right, movefocus, r
      bind = $mod, up, movefocus, u
      bind = $mod, down, movefocus, d

      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5

      bind = $mod SHIFT, 1, movetoworkspace, 1
      bind = $mod SHIFT, 2, movetoworkspace, 2
      bind = $mod SHIFT, 3, movetoworkspace, 3
      bind = $mod SHIFT, 4, movetoworkspace, 4
      bind = $mod SHIFT, 5, movetoworkspace, 5

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      # DMS keybinds
      bind = $mod, Space, exec, dms ipc call spotlight toggle
      bind = $mod, V, exec, dms ipc call clipboard toggle
      bind = $mod, N, exec, dms ipc call notifications toggle
      bind = $mod, comma, exec, dms ipc call settings toggle
      bind = $mod, C, exec, dms ipc call control-center toggle
      bind = $mod, X, exec, dms ipc call powermenu toggle
      bind = $mod, P, exec, dms ipc call notepad toggle
      bind = $mod, TAB, exec, dms ipc call hypr toggleOverview
    '';
  };
}

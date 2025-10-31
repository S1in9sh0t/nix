{ config, pkgs, inputs, ... }:

{
  # Import DMS modules at the TOP LEVEL
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    # Uncomment next line if you want niri integration:
    # inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];

  home.username = "benzo";
  home.homeDirectory = "/home/benzo";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
  
  # Enable DankMaterialShell
  programs.dankMaterialShell = {
    enable = true;
  };

  # Hyprland configuration via home-manager
  wayland.windowManager.hyprland = {
    enable = true;
    
    # Basic settings
    settings = {
      "$mod" = "SUPER";
      
      # Keybinds
      bind = [
        # Terminal
        "$mod, Return, exec, kitty"
        
        # Window management
        "$mod, Q, killactive"
        "$mod SHIFT, M, exit"
        "$mod, F, fullscreen"
        "$mod, D, togglefloating"
        
        # Focus movement
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        
        # Move windows to workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        
        # DMS keybinds
        "$mod, Space, exec, dms ipc call spotlight toggle"
        "$mod, V, exec, dms ipc call clipboard toggle"
        "$mod, N, exec, dms ipc call notifications toggle"
        "$mod, comma, exec, dms ipc call settings toggle"
        "$mod, C, exec, dms ipc call control-center toggle"
        "$mod, X, exec, dms ipc call powermenu toggle"
        "$mod, P, exec, dms ipc call notepad toggle"
        "$mod, TAB, exec, dms ipc call hypr toggleOverview"
      ];
      
      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };

  # Add some basic packages
  home.packages = with pkgs; [
    kitty  # or your preferred terminal
    # Add other packages you need
  ];
}

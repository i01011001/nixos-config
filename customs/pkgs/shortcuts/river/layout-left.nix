{
  pkgs,
}:
pkgs.writeShellScriptBin "layout-left" ''
riverctl map normal Super+Control H send-layout-cmd wideriver "--layout left" &&
riverctl map normal Super H focus-view left 
''

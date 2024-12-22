{
  pkgs,
}:
pkgs.writeShellScriptBin "layout-right" ''
riverctl map normal Super+Control L send-layout-cmd wideriver "--layout right" &&
riverctl map normal Super H focus-view right 
''

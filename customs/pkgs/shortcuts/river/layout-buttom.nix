{
  pkgs,
}:
pkgs.writeShellScriptBin "layout-bottom" ''
riverctl map normal Super+Control J send-layout-cmd wideriver "--layout bottom" &&
riverctl map normal Super H focus-view bottom
''

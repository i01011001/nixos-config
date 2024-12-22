{
  pkgs,
}:
pkgs.writeShellScriptBin "layout-top" ''
riverctl map normal Super+Control K send-layout-cmd wideriver "--layout top" &&
riverctl map normal Super H focus-view top
''

{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./alacritty
    ./direnv
    ./nixvim
    ./ripgrep
    ./fd
    ./fzf
    ./zsh
    ./cursor
    ./gtk
    ./yazi
    ./btop
    ./floorp
    ./git
    ./tofi
    ./mako
    # ./sway
    # ./hypr
    # ./wezterm
    # ./foot
    # ./river
    # ./qutebrowser
  ];
}

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
    ./river
    # ./sway
    # ./hypr
    # ./wezterm
    # ./foot
    # ./qutebrowser
  ];
}

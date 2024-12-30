{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
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
	./swappy
    ./foot
    # ./hypr
	# ./ghostty
    ./river
	# ./awesome
    # ./wezterm
    # ./alacritty
    # ./sway
    # ./qutebrowser
  ];
}

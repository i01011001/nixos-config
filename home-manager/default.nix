{ lib, ... }:
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
    # ./river
    # ./awesome
    # ./wezterm
    # ./alacritty
    # ./sway
    # ./qutebrowser
  ];

  home = {
    username = "void";
  };

  # Enable home-manager
  programs.home-manager = {
    enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}

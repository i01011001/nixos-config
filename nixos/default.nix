{ pkgs, ... }:
{
  imports = [
    ./systemPackages
    ./nix-ld
    ./opentabletdriver
    ./nvidia
    # ./fzf
    ./hardware
    ./wireshark
    ./tmux
    ./opengl
    ./printer
    ./scanner
    ./audio
    ./bootloader
    ./bluetooth
    ./networking
    ./fonts
    ./users
    ./avahi
    ./insecure
    ./environment
    ./zsh
    ./ssh
    ./qt
    ./settings
    ./adb
  ];

  programs.nano.enable = false;
  time.timeZone = "Asia/Kathmandu";
  system.stateVersion = "23.11";
}

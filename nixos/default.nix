{ pkgs, ... }:
{
  imports = [
    ### core
    ./core/audio
    ./core/bluetooth
    ./core/bootloader
    ./core/environment
    ./core/fonts
    ./core/hardware
    ./core/networking
    ./core/opengl
    ./core/qt
    ./core/settings
    ./core/users
    ./core/zsh

    ### optional
    ./optional/adb
    ./optional/avahi
    ./optional/insecure
    ./optional/nix-ld
    ./optional/nvidia
    ./optional/printer
    ./optional/scanner
    ./optional/ssh
    ./optional/systemPackages
    ./optional/tmux
    ./optional/wireshark
    # ./optional/qemu
    ./optional/multipass
    # ./optional/opentabletdriver
    # ./optional/x11

  ];

  programs.nano.enable = false;
  time.timeZone = "Asia/Kathmandu";
  system.stateVersion = "23.11";
}

{ pkgs, ... }:
{
	imports = [
			./systemPackages
			./nix-ld
			./extra
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


}

{ lib, pkgs, inputs, ... }: {
	imports = [
		./alacritty
			./direnv
			./nixvim
			./ripgrep
			./fd
			./fzf
			./shell
			./cursor
			./gtk
			./yazi
			./btop
			./floorp
			./git
			./tofi
			./mako
			./hypr
# ./river
# ./foot
	];
							}

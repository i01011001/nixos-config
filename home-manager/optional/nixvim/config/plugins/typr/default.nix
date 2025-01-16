{ pkgs, ... }:
{
	programs.nixvim = {
		extraPlugins = [ pkgs.vimPlugins.typr ];
	};
}

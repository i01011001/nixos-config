{ pkgs, ... }:
{
	programs.nixvim = {
		extraPlugins = [ 
		pkgs.vimPlugins.nvzone-typr
		];
	};
}

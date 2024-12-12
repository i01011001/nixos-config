{
	config,
		pkgs,
		inputs,
		...
}:
let

in
{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
### plugins
			./config/plugins/lsp.nix
			./config/plugins/telescope.nix
			./config/plugins/whichkey.nix
			./config/plugins/colorschemes.nix
			./config/plugins/oil.nix
			./config/plugins/harpoon.nix
			./config/plugins/cmp.nix
			./config/plugins/markdown-preview.nix
			./config/plugins/web-devicons.nix
			./config/plugins/diffview.nix
			./config/plugins/surround.nix
# ./config/plugins/gitsigns.nix
# ./config/plugins/noice.nix
# ./config/plugins/notify.nix
# ./config/plugins/treesitter.nix
# ./config/plugins/mini.nix
# ./config/plugins/neogit.nix
# ./config/plugins/lazygit.nix
# ./config/plugins/lualine.nix
# ./config/plugins/ufo.nix
# ./config/plugins/neorg.nix
# ./config/plugins/bufferline.nix

### basics
			./config/keymaps.nix
			./config/options.nix
			];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;
		diagnostics = {
			float = {
				border = "single";
			};
		};
		package = inputs.neovim-nightly.packages.${pkgs.system}.default;

		performance = {
			byteCompileLua = {
				enable = true;
				nvimRuntime = true;
				configs = true;
				plugins = true;
			};
		};
		extraPlugins = [
		];

		extraConfigLua = ''
			'';

	};
}

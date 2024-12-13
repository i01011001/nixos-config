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
			./config/plugins/oil.nix
			./config/plugins/harpoon.nix
			./config/plugins/cmp.nix
			./config/plugins/markdown-preview.nix
			./config/plugins/web-devicons.nix
			./config/plugins/diffview.nix
			./config/plugins/surround.nix
			./config/plugins/colorschemes.nix
			./config/plugins/base16.nix
			./config/plugins/fzf-lua.nix
# ./config/plugins/gitsigns.nix

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
# virtual_lines.only_current_line = false;
			virtual_text = false;
# signs = false;

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

			vim.diagnostic.config({
					signs = {
					text = {
					[vim.diagnostic.severity.ERROR] = '',
					[vim.diagnostic.severity.WARN] = '',
					[vim.diagnostic.severity.INFO] = '',
					},
					},
					})
		'';
	};
}

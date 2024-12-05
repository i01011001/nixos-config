{ config, pkgs, inputs, ... }:
let

in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ### plugins
    ./config/plugins/lsp.nix
    ./config/plugins/telescope.nix
    ./config/plugins/whichkey.nix
    ./config/plugins/colorschemes.nix
    ./config/plugins/noice.nix
    ./config/plugins/notify.nix
    ./config/plugins/oil.nix
    ./config/plugins/harpoon.nix
    ./config/plugins/gitsigns.nix
    ./config/plugins/cmp.nix
    ./config/plugins/markdown-preview.nix
    ./config/plugins/web-devicons.nix
    ./config/plugins/diffview.nix
	./config/plugins/surround.nix
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
    diagnostics = { float = { border = "rounded"; }; };
	package= inputs.neovim-nightly.packages.${pkgs.system}.default;

    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };
    extraPlugins = [
		(pkgs.vimUtils.buildVimPlugin {
				name = "peek";
				src = pkgs.fetchFromGitHub {
					owner = "toppair";
					repo = "peek.nvim";
					rev = "master";
					hash = "sha256-hGIPxHwTSXTHFJ3JiVATMjEmoFhZ87fWElj1AMPMbQU=";
				};
				})
		# (pkgs.vimUtils.buildVimPlugin {
		# 		name = "markview";
		# 		src = pkgs.fetchFromGitHub {
		# 		owner = "OXY2DEV";
		# 		repo = "markview.nvim";
		# 		rev = "main";
		# 		hash = "sha256-4D4jB9CmamMAdpEodw4MdDyJVU6EMsh8P4gLs7p4E40=";
		# 		};
		# 		})
		(pkgs.vimUtils.buildVimPlugin {
			name = "typr";
			src =  pkgs.fetchFromGitHub {
					owner = "nvzone";
					repo = "typr";
					rev = "master";
					hash = "sha256-N1V1nktgckvZa+Q5/YNoMFd1yKPwJr+QxXUhiJAV8c0=";
				};
			})
    ];   

    extraConfigLua = '' 
require('peek').setup({
  auto_load = true,         -- whether to automatically load preview when
                            -- entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete
  syntax = true,            -- enable syntax highlighting, affects performance
  theme = 'dark',           -- 'dark' or 'light'
  update_on_change = true,
  app = 'floorp',          -- 'webview', 'browser', string or a table of strings
                            -- explained below
  filetype = { 'markdown' },-- list of filetypes to recognize as markdown
  -- relevant if update_on_change is true
  throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
  throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
})
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    '';

  };
}

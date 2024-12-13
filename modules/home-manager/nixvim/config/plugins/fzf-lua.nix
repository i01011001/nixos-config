{
	programs.nixvim.plugins.fzf-lua= {
		enable = true;
		keymaps = 
		{
			"<C-p>" = {
				action = "git_files";
				options = {
					desc = "Fzf-Lua Git Files";
					silent = true;
				};
				settings = {
					previewers = {
						cat = {
							cmd = "/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/cat";
						};
					};
					winopts = {
						height = 0.5;
					};
				};
			};
			"<leader>fg" = "live_grep";
		};
	};
}
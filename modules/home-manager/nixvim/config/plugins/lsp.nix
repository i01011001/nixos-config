{
	programs.nixvim = {
		plugins.lsp = {
			enable = true;
			servers = {
				clangd = {
					enable = true;
					cmd = [
						"clangd"
							"--offset-encoding=utf-16"
					];
				};
# nil-ls.enable = true;
				nixd.enable = true;
				marksman.enable = true;
				zls.enable = true;
				lua_ls.enable = true;
				yamlls.enable = true;
# hls.enable = true;
				cssls.enable = true;
				cmake.enable = true;
				bashls.enable = true;
				arduino_language_server.enable = true;
# css_variables.enable = true;
# ccls.enable = true;
			};

			keymaps = {
				silent = true;
				lspBuf = {
					gd = {
						action = "definition";
						desc = "Goto Definition";
					};
					gD = {
						action = "declaration";
						desc = "Goto Declaration";
					};
					gI = {
						action = "implementation";
						desc = "Goto Implementation";
					};
					gT = {
						action = "type_definition";
						desc = "Type Definition";
					};
					K = {
						action = "hover";
						desc = "Hover";
					};
				};
				diagnostic = {
					"<leader>cd" = {
						action = "open_float";
						desc = "Line Diagnostics";
					};
				};

			};
		};
		extraConfigLua = '' 
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


					'';

	};
}

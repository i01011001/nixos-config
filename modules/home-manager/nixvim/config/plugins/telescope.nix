{
	programs.nixvim = {
		plugins.telescope = {
			enable = true;
			settings= {
				defaults = {
					layout_strategy="buffer";
					# layout_config = {
					# 	botton_pane = {
					# 		height = 0.4;
					# 		preview_cutoff = 40;
					# 		prompt_position = "top";
					# 		width = 0.5;
					# 	};
					# };
					borderchars = [
						"─" "│" "─" "│" "┌" "┐" "┘" "└"
					];
				};
			};
			extensions.fzf-native = {
				enable = true;

			};
			keymaps = {
				"<leader><space>" = {
					action = "find_files";
					options.desc = "Find project files";
				};
				"<leader>/" = {
					action = "live_grep";
					options.desc = "Grep (root dir)";
				};
				"<leader>:" = {
					action = "command_history";
					options.desc = "Command History";
				};
				"<leader>b" = {
					action = "buffers";
					options.desc = "+buffer";
				};
				"<leader>fr" = {
					action = "oldfiles";
					options.desc = "Recent";
				};
				"<leader>fb" = {
					action = "buffers";
					options.desc = "Buffers";
				};
				"<leader>gf" = {
					action = "git_files";
					options.desc = "Search git files";
				};
				"<leader>gc" = {
					action = "git_commits";
					options.desc = "Commits";
				};
				"<leader>gp" = {
					action = "git_bcommits";
					options.desc = "Branch Commits";
				};
				"<leader>gs" = {
					action = "git_status";
					options.desc = "Status";
				};
				"<leader>gb" = {
					action = "git_branches";
					options.desc = "Braches";
				};
				"<leader>sb" = {
					action = "current_buffer_fuzzy_find";
					options.desc = "Buffer";
				};
				"<leader>sc" = {
					action = "command_history";
					options.desc = "Command History";
				};
				"<leader>sD" = {
					action = "diagnostics";
					options.desc = "Workspace diagnostics";
				};
				"<leader>sH" = {
					action = "highlights";
					options.desc = "Search Highlight Groups";
				};
				"<leader>r" = {
					action = "lsp_references";
					options.desc = "LSP references";
				};

			};
		};

    extraConfigLua = ''
	local api=vim.api
require("telescope.pickers.layout_strategies").buffer = function(self)
  local layout = require("telescope.pickers.window").get_initial_window_options(self)
  local prompt = layout.prompt
  local results = layout.results
  local preview = layout.preview
  local config = self.layout_config
  local padding = self.window.border and 2 or 0
  local width = api.nvim_win_get_width(self.original_win_id)
  local height = api.nvim_win_get_height(self.original_win_id)
  local pos = api.nvim_win_get_position(self.original_win_id)
  local wline = pos[1] + 1
  local wcol = pos[2] + 1
  
  -- Height
  prompt.height = 1
  preview.height = self.previewer and math.floor(height * 0.64) or 0
  results.height = height
    - padding
    - (prompt.height + padding)
    - (self.previewer and (preview.height + padding) or 0)
  
  -- Line
  local rows = {}
  local mirror = config.mirror == true
  local top_prompt = config.prompt_position == "top"
  if mirror and top_prompt then
    rows = { prompt, results, preview }
  elseif mirror and not top_prompt then
    rows = { results, prompt, preview }
  elseif not mirror and top_prompt then
    rows = { preview, prompt, results }
  elseif not mirror and not top_prompt then
    rows = { preview, results, prompt }
  end
  local next_line = 1 + padding / 2
  for k, v in pairs(rows) do
    if v.height ~= 0 then
      v.line = next_line
      next_line = v.line + padding + v.height
    end
  end
  
  -- Width
  prompt.width = width - padding
  results.width = prompt.width
  preview.width = prompt.width
  
  -- Col
  prompt.col = wcol + padding / 2
  results.col = prompt.col
  preview.col = prompt.col
  
  if not self.previewer then
    layout.preview = nil
  end
  
  return layout
end
    '';
	};
	
}

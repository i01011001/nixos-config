{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>sh";
        action = "<cmd>set laststatus=0<cr>";
        options = {
          desc = "remove statusline";
        };
      }
      {
        mode = "n";
        key = "<leader>sl";
        action = "<cmd>set laststatus=2<cr>";
        options = {
          desc = "add statusline";
        };
      }

    ];
    # extraConfigLua =  ''
    #     vim.keymap.set(“n”, “<leader>dt”, function()
    #     if vim.diagnostic.is_enabled() then
    #     vim.diagnostic.disable()
    #     else
    #     vim.diagnostic.enable()
    #     end
    #     end)
    #     '';
  };
}

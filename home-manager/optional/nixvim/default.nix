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
    ./config/plugins/lsp
    ./config/plugins/telescope
    ./config/plugins/whichkey
    ./config/plugins/oil
    ./config/plugins/harpoon
    ./config/plugins/markdown-preview
    ./config/plugins/web-devicons
    ./config/plugins/diffview
    ./config/plugins/surround
    ./config/plugins/cmp
    # ./config/plugins/colorizer
    # ./config/plugins/blink
    # ./config/plugins/fzf-lua
    # ./config/plugins/gitsigns

    ### basics
    ./config/colorscheme
    ./config/keymaps
    ./config/options
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

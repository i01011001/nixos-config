{
  programs.nixvim.plugins = {
    treesitter = {
      enable = false;
      folding = true;
      # nixGrammars = false;
      # settings.indent.enable = false;
    };
    # rainbow-delimiters.enable = false;
  };
}

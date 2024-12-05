{
    programs.nixvim.plugins.lsp = {
        enable = true;
        servers = {
            clangd = {
                enable = true;
                cmd = [ "clangd" "--offset-encoding=utf-16" ];
            };
# nil-ls.enable = true;
            nixd.enable = true;
            marksman.enable = true;
			zls.enable = true;
			lua_ls.enable =true;
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
}

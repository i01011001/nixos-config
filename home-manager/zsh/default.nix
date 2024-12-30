{pkgs, ...}: {
	programs.zsh = {
		enable = true;
		enableCompletion = true;
# autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			update_online = "sudo nixos-rebuild switch --verbose && rm -rf ~/.cache/tofi-drun";
			update = "sudo nixos-rebuild switch --verbose --offline && rm -rf ~/.cache/tofi-drun";
			source_idf = "source $HOME/code/esp/idf/esp-idf/export.sh";
			source_matter = "source $HOME/code/esp/idf/esp-matter/export.sh";
			nixc = "cd /etc/nixos/ && nvim .";
		};
		history = {
			size = 10000;
			path = "$HOME/.cache/zsh/history";
		};
		initExtraFirst = builtins.readFile ./zsh;
	};
			 }

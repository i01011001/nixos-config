{ pkgs, inputs, ... }: {
  imports = [
    ./systemPackages
    ./nix-ld
    ./extra
    ./opentabletdriver
    ./nvidia
    # ./fzf
    ./wireshark
    ./tmux
	./opengl
  ];
}


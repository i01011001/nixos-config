{pkgs}:

pkgs.stdenv.mkDerivation{
		pname = "wideriver";
		version = "1.2";
		src = ./. ;

		nativeBuildInputs = with pkgs;[
			pkg-config
				wayland-scanner
		];

		buildInputs = with pkgs;[
			wayland
		];
		installFlags = [ "PREFIX=$(out)" ];
}


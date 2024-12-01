{ pkgs, ... }:

pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "river-ultitile";
  version = "1.1.1";

  src = pkgs.fetchFromSourcehut {
    owner = "~midgard";
    repo = "river-ultitile";
    rev = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-iGpedbZEnaWaYE9SC1rwsqyMj+UXV8fEhLRYB/f6Qs8=";
  };
  nativeBuildInputs = with pkgs; [
    pkg-config
    # river
    wayland
    pandoc
    wayland-protocols
    wayland-scanner
    zig_0_12.hook
  ];

  postPatch = ''
    ln -s ${pkgs.callPackage ./deps.nix { }} $ZIG_GLOBAL_CACHE_DIR/p
  '';

  buildPhase = "";
  installPhase = ''
    mkdir -p $out/
    zig build -Doptimize=ReleaseSafe --prefix $out/
  '';
})

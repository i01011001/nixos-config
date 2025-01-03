{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    # (final: prev: {
    # wireshark = prev.wireshark.overrideAttrs (oldAttrs:{
    #     nativeBuildInputs =  builtins.filter (x: x != pkgs.python3)
    #         (oldAttrs.nativeBuildInputs ++ [(pkgs.python3.withPackages(ps: with ps; [ pip pyserial psutil west] ))]);
    #
    #     buildInputs =  oldAttrs.buildInputs ++ [
    #         (pkgs.python3.withPackages(ps: with ps; [ pip pyserial psutil west] ))
    #     ];
    # });
    # wireshark-custom = final.wireshark;
    # })

    (final: prev: {
      old_libunistring = prev.libunistring.overrideAttrs (
        oldAttrs:
        let
          pname = "libunistring";
          version = "0.9.10";
        in
        {
          version = "${version}";
          src = pkgs.fetchurl {
            url = "mirror://gnu/libunistring/${pname}-${version}.tar.gz";
            sha256 = "sha256-qC5bMzM5qI6kYI5GNUeaHPsuAar7kl4SkLZXENQ/YQs=";
          };
        }
      );

      discord-unstable = prev.discord.override {
        withOpenASAR = true;
        withVencord = true;
      };

      new_zlib = prev.zlib.overrideAttrs (
        oldAttrs:
        let
          version = "1.2.11";
        in
        {
          version = "${version}";
          src = pkgs.fetchurl {
            url = "https://gitlab.com/sortix/libz/-/archive/v1.2.10/libz-v${version}.tar.gz";
            sha256 = "sha256-cY7oLpeOQKnxcJstFDxfA++nrZ0IeEnE05lW2UyGVr4=";
          };
        }
      );

      pureref2 = prev.pureref.overrideAttrs (
        oldAttrs:
        let
          version = "2.0.3";
        in
        {
          src =
            pkgs.runCommand "PureRef-${version}_x64.Appimage"
              {
                nativeBuildInputs = with pkgs; [
                  curl
                  gnugrep
                  cacert
                ];
                outputHash = "sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=";
              }
              ''
                key="$(curl -A 'nixpkgs/Please contact maintainer if there is an issue' "https://www.pureref.com/download.php" --silent | grep '%3D%3D' | cut -d '"' -f2)"
                curl -L "https://www.pureref.com/files/build.php?build=LINUX64.Appimage&version=${version}&downloadKey=$key" --output $out
              '';
        }
      );
    })

    (self: super: {
      dwl =
        (super.dwl.overrideAttrs (oldAttrs: rec {
          patches = [
            ../customs/pkgs/dwl/dwl-patches/attachbottom.patch
            ../customs/pkgs/dwl/dwl-patches/pertag.patch
            ../customs/pkgs/dwl/dwl-patches/restoretiling.patch # only after pertag
            ../customs/pkgs/dwl/dwl-patches/autostart.patch
            # ../customs/pkgs/dwl/dwl-patches/minimalborders.patch
            ../customs/pkgs/dwl/dwl-patches/unclutter.patch
            ../customs/pkgs/dwl/dwl-patches/alwayscenter.patch
            ../customs/pkgs/dwl/dwl-patches/stacker.patch
            ../customs/pkgs/dwl/dwl-patches/zoomswap.patch
          ];
        })).override
          { configH = ../customs/pkgs/dwl/config.h; };
    })
  ];
}

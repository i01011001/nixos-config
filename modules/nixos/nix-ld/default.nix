{ pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      openssl
      zlib
      fuse3
      icu
      nss
      curl
      expat
      libusb1
      libidn2
      libyaml
      libnghttp2
      gnutls
      gmp

      glib
      e2fsprogs

      libxcrypt-legacy
      libunistring
      old_libunistring

      gobject-introspection
      libgcc

      cjson
      crow
    ];
  };
}

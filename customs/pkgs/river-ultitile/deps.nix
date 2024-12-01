{ linkFarm, fetchzip }:

linkFarm "zig-packages" [{
  name = "1220b0f8f822c1625af7aae4cb3ab2c4ec1a4c0e99ef32867b2a8d88bb070b3e7f6d";
  path = fetchzip {
    url = "https://codeberg.org/ifreund/zig-wayland/archive/v0.1.0.tar.gz";
    hash = "sha256-VLEx8nRgmJZWgLNBRqrR7bZEkW0m5HTRv984HKwoIfA=";
  };
}]

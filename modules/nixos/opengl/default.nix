{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware.graphics = {
    enable = true;
    # extraPackages = [
    # 	pkgs.mesa.drivers
    # ];
  };

}

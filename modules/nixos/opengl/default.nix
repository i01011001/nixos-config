
{ config, lib, pkgs, ... }: {
  # Enable OpenGL
  hardware.graphics = { enable = true; };
}

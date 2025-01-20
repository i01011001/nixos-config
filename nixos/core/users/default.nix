{ pkgs, ... }:
{
  users = {
    users.void = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "dialout"
        "input"
        "adbusers"
        "wireshark"
        "lp"
        "scanner"
        "networkmanager"
      ];
    };
    defaultUserShell = pkgs.zsh;
  };
}

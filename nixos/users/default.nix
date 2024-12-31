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
      initialPassword = "01011001";
      openssh.authorizedKeys.keys = [
        "AAAAC3NzaC1lZDI1NTE5AAAAICjmHMA0P7sAiw0WX0yld81fVpyHk7h9iixdtS4nzAgh"
      ];
    };
    defaultUserShell = pkgs.zsh;
  };
}

{ pkgs, ... }:
{
  users.users.isobu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      tree
    ];
  };
}

{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}

{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
    ./modules/boot.nix
    ./modules/nvidia.nix
    ./modules/audio.nix
    ./modules/packages.nix
    ./modules/programs.nix
    ./modules/fonts.nix
    ./modules/users.nix
  ];

  home-manager.users.isobu = import /home/isobu/.config/home-manager/home.nix;

  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/Kyiv";
  security.rtkit.enable = true;

  services.flatpak.enable = true;

  system.stateVersion = "25.11";
}

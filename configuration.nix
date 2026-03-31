{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
 #grub
  boot.loader.grub.enable = true; 
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-btw";  #hostname
  networking.networkmanager.enable = true;
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
 };
 #sway
 programs.sway = {
  enable = true;
  package = pkgs.swayfx;
 };
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Kyiv";  #timezone

   services.flatpak.enable = true;
   services.xserver.videoDrivers = [ "nvidia" ];
 
 #nvidia
 hardware.nvidia = {
   modesetting.enable = true;
   powerManagement.enable = true;
   open = false;
   nvidiaSettings = true;
   package = config.boot.kernelPackages.nvidiaPackages.stable;
 };
 
 hardware.nvidia.prime = {
   offload = {
     enable = true;
     enableOffloadCmd = true;
   };
   intelBusId = "PCI:0:2:0";
   nvidiaBusId = "PCI:1:0:0";
};
 
 #pipewire
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

 #user
      users.users.nicname = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];
    };

 #packages
    environment.systemPackages = with pkgs; [
      neovim
      firefox
      nemo
      spotify
      fastfetch
      btop
      pavucontrol
      waybar
      wofi
      wget
      playerctl
      grim
      git
    ];
    
 #font
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
];
  system.stateVersion = "25.11"; 

}


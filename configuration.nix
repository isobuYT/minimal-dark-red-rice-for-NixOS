{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  #name replace with your name
  home-manager.users.name = import /home/isobu/.config/home-manager/home.nix; 
  users.users.name = { 
   isNormalUser = true;
   extraGroups = [ "wheel" "networkmanager" ];
      packages = with pkgs; [
        tree
    ];
 };

  #Europe/Kyiv replace with your timezone
  time.timeZone = "Europe/Kyiv";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #nixos replace with your hostname
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  #steam
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
  #appimage
  programs.appimage = {
  enable = true;
  binfmt = true;
};

  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

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
 
 services.pipewire = {
  enable = true;
  pulse.enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock.rate = 48000;
      default.clock.quantum = 512;
      default.clock.min-quantum = 512;
      default.clock.max-quantum = 512;
     };
   };
 };     

    environment.systemPackages = with pkgs; [
      neovim
      yt-dlp
      firefox
      nemo
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
   
   security.rtkit.enable = true;
   fonts.packages = with pkgs; [
   nerd-fonts.jetbrains-mono
];
  system.stateVersion = "25.11"; 

}


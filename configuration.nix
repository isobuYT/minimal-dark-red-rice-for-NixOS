{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.extraEntries = ''
  menuentry "Arch Linux" {
    search --set=root --fs-uuid 6f15a0ca-042a-43d9-8f10-0a20da588511
    linux /boot/vmlinuz-linux root=UUID=6f15a0ca-042a-43d9-8f10-0a20da588511 rw
    initrd /boot/initramfs-linux.img
  }
'';

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
 };
  programs.sway = {
  enable = true;
  package = pkgs.swayfx;
 };
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Kyiv";

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
    };

      users.users.nicname = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];
    };

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
    
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
];
  system.stateVersion = "25.11"; 

}


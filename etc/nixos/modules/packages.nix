{ pkgs, ... }:
{
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
}

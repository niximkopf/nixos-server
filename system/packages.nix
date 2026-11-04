{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    htop
    btop
    kitty
    nautilus
    neovim
    yt-dlp
    firefox
    opencode
  ];
}
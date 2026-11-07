{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-tree
    wget
    unzip
    psmisc
    nvd
    eza
    bat
    ripgrep
    fd
    zoxide
    fzf
    ncdu
    file
    htop
    neovim
    yt-dlp
    firefox
    yazi

  ];
}

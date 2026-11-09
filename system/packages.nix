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
    btop
    neovim
    yt-dlp
    firefox
    yazi
    tmux
    lm_sensors
  ];
}

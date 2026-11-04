{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/ssh.nix
    ../../modules/jellyfin.nix
    ../../modules/nextcloud.nix
    ../../modules/wireguard.nix

    ../../system/nix.nix
    ../../system/packages.nix
    ../../system/timezone.nix
    ../../system/user.nix
  ];

  networking = {
    hostName = "nix-server1";
    firewall.enable = true;
  };
  services.getty.autologinUser = "niximkopf";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "26.11";
}

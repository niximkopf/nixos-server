{ pkgs, ... }:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    hostName = "nextcloud.local";
    https = false;

    database.createLocally = true;

    config = {
      dbtype = "pgsql";
      adminuser = "admin";
      adminpassFile = "/etc/nextcloud-admin-pass";
    };

    settings.trusted_domains = [
      "192.168.1.10" # IP deines Servers im Heimnetz anpassen
      "10.100.0.1"   # Adresse des Servers im VPN
    ];
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}

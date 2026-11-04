{ ... }:

{
  networking.nat = {
    enable = true;
    externalInterface = "eth0"; #edit
    internalInterfaces = [ "wg0" ];
  };

  networking.firewall.allowedUDPPorts = [ 51820 ];

  networking.wireguard.interfaces.wg0 = {
    ips = [ "10.100.0.1/24" ];
    listenPort = 51820;
    privateKeyFile = "/etc/wireguard/private.key";

    peers = [
      {
        # Gerät 1, z. B. dein Handy
        publicKey = "PUBLIC-KEY-DES-HANDYS";
        allowedIPs = [ "10.100.0.2/32" ];
      }
    ];
  };
}

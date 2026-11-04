{ ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true; # Port 8096
  };
}

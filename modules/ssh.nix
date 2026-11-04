{ ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = true; # Port 22
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}

{ ... }:

{
  users.users.niximkopf = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      # "ssh-ed25519 AAAA... dein-key"
    ];
  };
}
{ ... }:

{
  users.users.niximkopf = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJq+gY8Fnfsouebm2+x1RTgz8cSTQM4kBx88fKl/LXEN niximkopf@tpad490"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE5dukB1Gc8PzH9kceqKXvruzHc3U5b9z4qg0j0LmHi8 niximkopf@nix-btw"
    ];
  };
}

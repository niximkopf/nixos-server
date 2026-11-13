{ ... }:

{
  fileSystems = {
    "/home/niximkopf/hdd1" = {
      device = "/dev/sdc1";
      fsType = "ext4";
      options = [ "nofail" ];
    };
    "/home/niximkopf/hdd2" = {
      device = "/dev/sda1";
      fsType = "ext4";
      options = [ "nofail" ];
    };
  };
}

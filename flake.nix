{
  description = "nixos-server";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs@{ self, nixpkgs, nvf, ... }:
  let
    mkHost = hostPath: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        hostPath
        nvf.nixosModules.default
      ];
    };
  in
  {
    nixosConfigurations = {
      nix-server1 = mkHost ./hosts/server1;
      nix-server2 = mkHost ./hosts/server2;
    };
  };
}
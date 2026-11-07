{ inputs, pkgs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlays.default ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.smp = {
      enable = true;
      autoStart = true;

      # "fabric" = neueste Version. Für feste Version z. B.
      # pkgs.fabricServers.fabric-1_21_1 verwenden. Die Version muss
      # zu den Mods passen UND zu dem, was deine Mitspieler starten.
      package = pkgs.fabricServers.fabric-26_2.override{jre_headless = pkgs.jdk25_headless;};

      # Arbeitsspeicher. Bei nur 4 GB im Rechner lieber -Xmx2G lassen,
      # bei 8 GB sind 3G möglich.
      jvmOpts = "-Xms4G -Xmx10G";

      serverProperties = {
        server-port = 25565;
        motd = "nixcraft";
        gamemode = "survival";
        difficulty = "normal";
        max-players = 8;
        view-distance = 16;
        simulation-distance = 8;
        online-mode = true;
        #white-list = true;
        enforce-whitelist = true;
      };

      # Erlaubte Spieler: Name = Konto-Kennung (UUID).
      # Die UUID findest du, indem du den Spielernamen auf einer
      # Seite wie namemc.com nachschlägst.
      #whitelist = {
        # SpielerName1 = "00000000-0000-0000-0000-000000000000";
        # SpielerName2 = "00000000-0000-0000-0000-000000000000";
      #};

      # Rechte als Operator (Admin) für dich:
      # operators = {
      #   DeinName = { uuid = "00000000-0000-0000-0000-000000000000"; level = 4; };
      # };

      # Mods: Nur Mods verwenden, die nur auf dem Server laufen müssen.
      # Fast alle brauchen die "Fabric API". Jede Datei braucht Adresse
      # und Prüfsumme. Mit dem Hilfsprogramm "nix-modrinth-prefetch" aus
      # dem nix-minecraft-Projekt bekommst du beides für Mods von
      # Modrinth. Beispiel:
      #
      # symlinks = {
      #   mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
      #     FabricApi = pkgs.fetchurl {
      #       url  = "https://cdn.modrinth.com/data/.../fabric-api-....jar";
      #       hash = "sha256-....";
      #     };
      #   });
      # };
    };
  };

  # Port für die Mitspieler. Von außen nur erreichbar, wenn du im Router
  # den Port 25565 (TCP) an den Server weiterleitest.
  networking.firewall.allowedTCPPorts = [ 25565 ];
}

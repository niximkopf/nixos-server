# Tailscale: privates Netzwerk zwischen deinen Geräten, ganz ohne
# Port-Weiterleitung im Router.
#
# Einmalig vorbereiten:
#  1. Im Tailscale-Adminbereich einen "Auth key" erzeugen.
#  2. Den Schlüssel als einzige Zeile in /etc/tailscale-authkey speichern
#     (Rechte nur für root: chmod 600).
#  Alternativ ohne Schlüsseldatei: nach dem Umstellen einmal
#  "sudo tailscale up" ausführen und den Link im Browser bestätigen.
{ ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true; # Port 41641/UDP für direkte Verbindungen

    # Wird nur beim ersten Anmelden gebraucht. Wenn du lieber den Link
    # im Browser bestätigst, diese Zeile löschen.
    authKeyFile = "/etc/tailscale-authkey";

    # Auf "server" stellen, wenn der Server später dein ganzes Heimnetz
    # oder als Ausgang ins Internet (Exit-Node) bereitstellen soll.
    # useRoutingFeatures = "server";
  };

  # Alles, was über das Tailscale-Netz kommt, gilt als vertrauenswürdig.
  # Dadurch erreichst du Jellyfin, Nextcloud und SSH von unterwegs,
  # ohne dass diese Ports im Internet offen sind.
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}

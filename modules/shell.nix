{ config, pkgs, ... }:

{
  programs.zsh = {
    enable                    = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;
    enableCompletion          = true;
    dotDir                    = config.home.homeDirectory;

    shellAliases = {
      ls      = "eza --icons";
      cat     = "bat";
      cd      = "z";
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos";
      update  = "sudo nix flake update --flake ~/.nixos";
      cleanup = "sudo nix-collect-garbage -d";
      gs      = "git status";
      gp      = "git push";
      gl      = "git pull";
      ga      = "git add .";
      gc      = "git commit -m";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
    '';
  };
}

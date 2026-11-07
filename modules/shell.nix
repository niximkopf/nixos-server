{ config, pkgs, ... }:

{
  programs.zsh = {
    enable                    = true;
    autosuggestions.enable     = true;
    syntaxHighlighting.enable = true;
    enableCompletion          = true;

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

    interactiveShellInit = ''
      eval "$(zoxide init zsh)"
    '';
  };
}

{ config, pkgs, ... }:

{
  home = {
    username = "al";
    homeDirectory = "/Users/al";
    stateVersion = "24.05";

    packages = [
      pkgs.htop
      pkgs.eza
      pkgs.bat
      pkgs.fd
      pkgs.git
      pkgs.neovim
      pkgs.zellij
      pkgs.wget
      pkgs.hyperfine
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };

    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
      shellAliases = {
        find = "fd";
        cat = "bat --theme=\"Catppuccin Frappe\"";
        ls = "eza --icons=always";
        lsl = "ls -l";
        lsls = "lsl --total-size";
        bench = "hyperfine";
      };
    };

    git = {
      enable = true;
      userName = "alDuncanson";
      userEmail = "alDuncanson@proton.me";
    };
  };
}

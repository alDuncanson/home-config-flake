{ config, pkgs, ... }:

{
  home.username = "al";
  home.homeDirectory = "/Users/al";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.zsh
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

  home.file = {
    ".zshrc".source = ./dotfiles/zsh/zshrc;
    ".config/zsh/zsh-syntax-highlighting" = {
      source = ./dotfiles/zsh/zsh-syntax-highlighting;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    userName = "alDuncanson";
    userEmail = "alDuncanson@proton.me";
  };

  programs.home-manager = {
    enable = true;
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      find = "fd";
      cat = "bat --theme=\"Catppuccin Frappe\"";
      ls = "eza --icons=always";
      lsl = "ls -l";
      lsls = "lsl --total-size";
      bench = "hyperfine";
    };
  };
}

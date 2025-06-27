{
  pkgs,
  username,
  ...
}:
{
  home = {
    inherit username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";

    packages = with pkgs; [
      htop
      eza
      fd
      git
      wget
      hyperfine
      tree
      asciinema
      lua
      go
      fh
      slides
      gotop
      fastfetch
      ripgrep
      yazi
      glow
      sendme
      biome
      harper
      docker-compose-language-service
      dockerfile-language-server-nodejs
      svelte-language-server
      nodePackages.aws-cdk
      nodejs
      ollama
      awscli2
      vscode-langservers-extracted
      uv
      google-cloud-sdk
      docker
      goose-cli
      gh
      poetry
      terraform
      bun
    ];

    sessionVariables.EDITOR = "nvim";
    file.".config/ghostty/config".source = ./configs/ghostty/config;
    shell.enableZshIntegration = true;
    sessionPath = [ "$HOME/.local/bin" ];
  };

  programs = {
    home-manager.enable = true;
    bat = {
      enable = true;
      config.theme = "Catppuccin Macchiato";
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      config = {
        global.hide_env_diff = true;
      };
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        find = "fd";
        cat = "bat";
        ls = "eza --icons=always";
        lsl = "ls -l";
        lsls = "lsl --total-size";
        bench = "hyperfine";
      };
      prezto = {
        enable = true;
        prompt.theme = "agnoster";
      };
    };
    git = {
      enable = true;
      userName = "alDuncanson";
      userEmail = "alDuncanson@proton.me";
    };
    lazygit = {
      enable = true;
      settings = {
        os = {
          editPreset = "nvim-remote";
        };
      };
    };
  };
}

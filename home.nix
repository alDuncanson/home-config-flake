{
  pkgs,
  username,
  ...
}: {
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
      rustup
      starship
    ];

    sessionVariables.EDITOR = "nvim";
    file.".config/ghostty/config".source = ./configs/ghostty/config;
    shell.enableZshIntegration = true;
    sessionPath = ["$HOME/.local/bin"];
  };

  programs = {
    home-manager.enable = true;
    bat = {
      enable = true;
      config.theme = "Catppuccin Mocha";
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
    };
    starship = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "alDuncanson";
      userEmail = "alDuncanson@proton.me";
    };
    nvf = {
      enable = true;
      settings = {
        vim = {
          assistant.codecompanion-nvim.enable = true;
          binds.whichKey = {
            enable = true;
          };
          git = {
            enable = true;
          };
          languages = {
            enableExtraDiagnostics = true;
            enableTreesitter = true;
            enableFormat = true;
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;
            yaml.enable = true;
          };
          hideSearchHighlight = true;
          ui = {
            breadcrumbs.enable = true;
          };
          lsp = {
            enable = true;
            formatOnSave = true;
            trouble.enable = true;
          };
          statusline.lualine.enable = true;
          telescope.enable = true;
          terminal.toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
          theme = {
            enable = true;
            name = "catppuccin";
            style = "macchiato";
            transparent = true;
          };
          utility = {
            yazi-nvim = {
              enable = true;
              setupOpts = {
                open_for_directories = true;
              };
            };
          };
        };
      };
    };
    zellij = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
        ui = {
          pane_frames = {
            rounded_corners = true;
            hide_session_name = true;
          };
        };
        on_force_close = "quit";
      };
    };
  };
}

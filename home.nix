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
      act
      pandoc
      tectonic
      just
    ];

    sessionVariables.EDITOR = "nvim";
    file.".config/ghostty/config".source = ./configs/ghostty/config;
    shell.enableZshIntegration = true;
  };

  programs = {
    home-manager.enable = true;
    bat = {
      enable = true;
      config.theme = "gruvbox-light";
    };
    starship.enable = true;
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
      initContent = ''
        export PATH="$HOME/.local/bin:$PATH"
      '';
      shellAliases = {
        find = "fd";
        cat = "bat";
        ls = "eza --icons=always";
        lsl = "ls -l";
        lsls = "lsl --total-size";
        bench = "hyperfine";
      };
    };
    git = {
      enable = true;
      settings.user = {
        name = "alDuncanson";
        email = "alDuncanson@proton.me";
      };
    };
    nvf = {
      enable = true;
      settings = {
        vim = {
          binds.whichKey.enable = true;
          git = {
            enable = true;
          };
          hideSearchHighlight = true;
          languages = {
            enableExtraDiagnostics = true;
            enableTreesitter = true;
            enableFormat = true;
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;
            rust.enable = true;
            yaml.enable = true;
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
            name = "gruvbox";
            style = "light";
            transparent = true;
          };
          ui = {
            borders.enable = true;
            breadcrumbs.enable = true;
            noice.enable = true;
          };
          utility = {
            motion.flash-nvim.enable = true;
            yazi-nvim = {
              enable = true;
              setupOpts.open_for_directories = true;
            };
          };
        };
      };
    };
  };
}

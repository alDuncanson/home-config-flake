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
    ];

    sessionVariables.EDITOR = "nvim";

    file.".config/ghostty/config".source = ./configs/ghostty/config;

    shell.enableZshIntegration = true;
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
      initContent = ''
        eval "$(zellij setup --generate-auto-start zsh)"
      '';
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
    nvf = {
      enable = true;
      settings = {
        vim = {
          enableLuaLoader = true;
          autocomplete = {
            enableSharedCmpSources = true;
            blink-cmp.enable = true;
          };
          autopairs.nvim-autopairs.enable = true;
          binds.whichKey.enable = true;
          formatter = {
            conform-nvim.enable = true;
          };
          git = {
            enable = true;
            gitsigns = {
              enable = true;
              codeActions.enable = true;
            };
          };
          hideSearchHighlight = true;
          languages = {
            enableExtraDiagnostics = true;
            enableLSP = true;
            enableTreesitter = true;
            enableFormat = true;
            bash.enable = true;
            css.enable = true;
            go.enable = true;
            html.enable = true;
            lua.enable = true;
            markdown.enable = true;
            nix = {
              enable = true;
              format.type = "nixfmt";
            };
            python.enable = true;
            tailwind = {
              enable = true;
              lsp.enable = true;
            };
            ts = {
              enable = true;
              format = {
                enable = true;
                type = "biome";
              };
            };
            yaml.enable = true;
            zig.enable = true;
          };
          lsp = {
            enable = true;
            formatOnSave = true;
            lspconfig = {
              enable = true;
              sources = {
                angular = ''require'lspconfig'.angularls.setup{}'';
                harper = ''require('lspconfig').harper_ls.setup {}'';
                dockercompose = ''
                  require'lspconfig'.docker_compose_language_service.setup{
                    filetypes = {
                      'yaml',
                      'yaml.docker-compose'
                    }
                  }
                '';
                docker = ''require'lspconfig'.dockerls.setup{}'';
                biome = ''require'lspconfig'.biome.setup{}'';
              };
            };
            trouble.enable = true;
          };
          options = {
            shiftwidth = 0;
            tabstop = 2;
            wrap = false;
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
          ui = {
            borders = {
              enable = true;
              globalStyle = "rounded";
            };
            breadcrumbs.enable = true;
            fastaction.enable = true;
            noice.enable = true;
            colorizer.enable = true;
          };
          utility = {
            preview.glow.enable = true;
            yanky-nvim.enable = true;
            yazi-nvim = {
              enable = true;
              setupOpts.open_for_directories = true;
            };
          };
          useSystemClipboard = true;
        };
      };
    };
    zellij = {
      enable = true;
      settings = {
        theme = "catppuccin-macchiato";
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

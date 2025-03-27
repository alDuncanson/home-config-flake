{ pkgs, username, ... }:
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
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    file = {
      ".config/ghostty/config".source = ./configs/ghostty/config;
    };

    shell = {
      enableZshIntegration = true;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    bat = {
      enable = true;
      config = {
        theme = "Catppuccin Macchiato";
      };
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
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
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
    nvf = {
      enable = true;
      settings = {
        vim = {
          enableLuaLoader = true;
          autocomplete.blink-cmp = {
            enable = true;
            sourcePlugins = {
              ripgrep.enable = true;
            };
          };
          autopairs.nvim-autopairs.enable = true;
          binds.whichKey = {
            enable = true;
          };
          formatter.conform-nvim.enable = true;
          git = {
            enable = true;
            gitsigns = {
              enable = true;
            };
          };
          hideSearchHighlight = true;
          languages = {
            enableLSP = true;
            enableTreesitter = true;
            enableFormat = true;
            bash = {
              enable = true;
            };
            css = {
              enable = true;
            };
            dart = {
              enable = true;
              flutter-tools = {
                enable = true;
                color.enable = true;
              };
            };
            go = {
              enable = true;
            };
            html = {
              enable = true;
            };
            kotlin = {
              enable = true;
            };
            lua = {
              enable = true;
            };
            markdown = {
              enable = true;
            };
            nix = {
              enable = true;
              format = {
                type = "nixfmt";
              };
              lsp = {
                server = "nixd";
              };
            };
            python = {
              enable = true;
            };
            ruby = {
              enable = true;
            };
            tailwind = {
              enable = true;
            };
            ts = {
              enable = true;
              format.type = "biome";
            };
            yaml = {
              enable = true;
            };
            zig = {
              enable = true;
            };
          };
          lsp = {
            formatOnSave = true;
            trouble.enable = true;
          };
          navigation = {
            harpoon.enable = true;
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
            borders.enable = true;
            breadcrumbs.enable = true;
            noice.enable = true;
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
      };
    };
  };
}

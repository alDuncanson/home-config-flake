{ pkgs, username, ... }:
{
  home = {
    username = username;
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
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    file = {
      ".config/ghostty/config".source = ./configs/ghostty/config;
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
      enableZshIntegration = true;
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
          filetree.nvimTree = {
            enable = true;
          };
          keymaps = [
            {
              mode = "n"; # Normal mode
              key = "<leader>wh";
              action = "<C-w>h";
            }
            {
              mode = "n";
              key = "<leader>wj";
              action = "<C-w>j";
            }
            {
              mode = "n";
              key = "<leader>wk";
              action = "<C-w>k";
            }
            {
              mode = "n";
              key = "<leader>wl";
              action = "<C-w>l";
            }
          ];
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
              flutter-tools.enable = true;
            };
            gleam = {
              enable = true;
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
            rust = {
              enable = true;
            };
            tailwind = {
              enable = true;
            };
            ts = {
              enable = true;
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
          };
          options = {
            tabstop = 4;
            shiftwidth = 4;
          };
          theme = {
            enable = true;
            name = "catppuccin";
            style = "macchiato";
          };
          ui = {
            breadcrumbs.enable = true;
            noice.enable = true;
          };
          utility = {
            motion.leap.enable = true;
            yanky-nvim.enable = true;
          };
          visuals = {
            cinnamon-nvim = {
              enable = true;
              setupOpts.keymaps = {
                basic = true;
                extra = true;
              };
            };
            fidget-nvim = {
              enable = true;
            };
          };

          useSystemClipboard = true;
          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;

          binds.whichKey = {
            enable = true;
          };
          terminal.toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };
      };
    };
    zellij = {
      enable = true;
      enableZshIntegration = true;
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

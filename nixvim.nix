{ ... }:

{
  # Configure Neovim with nixvim - zero-config IDE
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Color scheme
    colorschemes.onedark.enable = true;

    # Core plugins
    plugins = {
      # Syntax highlighting and parsing
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      # LSP configuration
      lsp = {
        enable = true;
        servers = {
          # Rust
          rust_analyzer = {
            enable = true;
            installCargo = false; # We have rustup
            installRustc = false;
          };

          # TypeScript/JavaScript
          ts_ls.enable = true;

          # Java
          jdtls.enable = true;

          # Terraform
          terraformls.enable = true;

          # Nix (since you're using it)
          nixd.enable = true;
        };
      };

      # Autocompletion
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          mapping = {
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
          };
          sources = [
            { name = "copilot"; }
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };

      # File explorer
      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
        window.width = 30;
      };

      # Fuzzy finder
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      # Status line
      lualine = {
        enable = true;
        settings.options.theme = "onedark";
      };

      # Git integration
      gitsigns.enable = true;

      # Icons (explicitly enabled to avoid deprecation warning)
      web-devicons.enable = true;

      # Integrated terminal (VS Code style)
      toggleterm = {
        enable = true;
        settings = {
          size = 20;
          open_mapping = "[[<C-\\>]]";
          hide_numbers = true;
          shade_filetypes = [];
          shade_terminals = true;
          shading_factor = 2;
          start_in_insert = true;
          insert_mappings = true;
          persist_size = true;
          direction = "horizontal";
          close_on_exit = true;
          shell = "fish";
          winbar = {
            enabled = false;
          };
        };
      };

      # Auto-pairs
      nvim-autopairs.enable = true;

      # Comment toggling
      comment.enable = true;

      # GitHub Copilot
      copilot-lua = {
        enable = true;
        settings = {
          suggestion.enabled = false;
          panel.enabled = false;
        };
      };

      # Copilot completion integration
      copilot-cmp.enable = true;

      # Copilot Chat
      copilot-chat = {
        enable = true;
        settings = {
          debug = false;
          show_help = true;
          question_header = "## User ";
          answer_header = "## Copilot ";
          error_header = "## Error ";
          separator = "───";
          show_folds = true;
          show_user_selection = true;
          auto_follow_cursor = true;
          auto_insert_mode = false;
          clear_chat_on_new_prompt = false;
          context = "buffers";
        };
      };

      # Formatting
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            rust = [ "rustfmt" ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            java = [ "google-java-format" ];
            terraform = [ "terraform_fmt" ];
            nix = [ "nixfmt-classic" ];
          };
        };
      };
    };

    # Key mappings
    globals.mapleader = " ";
    keymaps = [
      # File explorer
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree toggle<CR>";
        options.desc = "Toggle file explorer";
      }

      # Save file
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.desc = "Save file";
      }

      # Quit
      {
        mode = "n";
        key = "<leader>q";
        action = ":q<CR>";
        options.desc = "Quit";
      }

      # Terminal toggle
      {
        mode = "n";
        key = "<leader>t";
        action = ":ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }

      # Terminal toggle with Ctrl+` (like VS Code)
      {
        mode = "n";
        key = "<C-`>";
        action = ":ToggleTerm<CR>";
        options.desc = "Toggle terminal (VS Code style)";
      }

      # Terminal navigation in terminal mode
      {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal mode";
      }
      {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
        options.desc = "Move to left window";
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
        options.desc = "Move to bottom window";
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
        options.desc = "Move to top window";
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n><C-w>l";
        options.desc = "Move to right window";
      }

      # Copilot Chat
      {
        mode = "n";
        key = "<leader>cc";
        action = ":CopilotChat<CR>";
        options.desc = "Open Copilot Chat";
      }
      {
        mode = "n";
        key = "<leader>ce";
        action = ":CopilotChatExplain<CR>";
        options.desc = "Explain code with Copilot";
      }
      {
        mode = "n";
        key = "<leader>cr";
        action = ":CopilotChatReview<CR>";
        options.desc = "Review code with Copilot";
      }
      {
        mode = "n";
        key = "<leader>cf";
        action = ":CopilotChatFix<CR>";
        options.desc = "Fix code with Copilot";
      }
      {
        mode = "n";
        key = "<leader>co";
        action = ":CopilotChatOptimize<CR>";
        options.desc = "Optimize code with Copilot";
      }
      {
        mode = "v";
        key = "<leader>cc";
        action = ":CopilotChatVisual<CR>";
        options.desc = "Chat about selected code";
      }
    ];

    # Basic options
    opts = {
      number = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
    };
  };
}

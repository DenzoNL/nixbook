{ ... }:

{
  # Configure Neovim with nixvim - zero-config IDE
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Color scheme
    colorschemes.nord.enable = true;

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
        settings.options.theme = "nord";
      };

      # Git integration
      gitsigns.enable = true;

      # Icons (explicitly enabled to avoid deprecation warning)
      web-devicons.enable = true;

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
    ];

    # Basic options
    opts = {
      number = true;
      relativenumber = true;
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

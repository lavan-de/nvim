return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  -- Vim Illuminate plugin setup
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate")  -- Configure the illuminate plugin
    end,
  },

  -- Harpoon plugin setup
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    config = function()
      require("harpoon").setup()
    end,
  },

  -- clangd_extensions plugin setup 
  {
    "p00f/clangd_extensions.nvim",
    -- Remove the setup call here because it's already being handled in the mason-lspconfig handler
    config = function()
      -- Leave this empty or remove entirely, as setup is already handled elsewhere
    end,
  },

  -- lua/plugins/rainbow-delimiters.lua
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- Configure the plugin using vim.g
      vim.g.rainbow_delimiters = {
        highlight = {
          enable = true,
          colors = {
            "#ff6347",  -- Red for first level
            "#4682b4",  -- Blue for second level
            "#32cd32",  -- Green for third level
          },
        },
      }
    end,
  },

  -- In nvim/lua/plugins.lua
  {
    -- Other plugins
    {
      'windwp/nvim-autopairs',
      config = function()
        -- Configuration for nvim-autopairs
        local npairs = require('nvim-autopairs')

        npairs.setup({
          check_ts = true,  -- Enable tree-sitter integration (recommended)
          ts_config = {
            lua = {'string', 'source'},  -- Adjust for specific languages
          },
          disable_filetype = { "TelescopePrompt", "spectre_panel" },  -- Disable in certain filetypes
          fast_wrap = {
            map = "<M-e>",  -- Keymap for quick wrapping
            chars = { "{", "[", "(", '"', "'" },  -- Characters to wrap
            pattern = string.gsub([[ [%'%"%)%>%]%)%} ]],"%s+", ""),
            offset = 0,  -- Offset from the cursor position
            end_key = "$",  -- End key for wrapping
          }
        })
      end
    },
  },

  -- Lualine plugin setup
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'everforest';
          icons_enabled = true;
        }
      })
    end
  },

  -- Comment plugin setup 
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Floaterm plugin setup
  {
    "voldikss/vim-floaterm",
    config = function()
    end,
  },

  -- Unimpaired plugin setup
  {
    "tummetott/unimpaired.nvim",
    config = function()
      require("unimpaired").setup()
    end,
  },

  -- Neovim development
  {
    "folke/neodev.nvim",
  },

  -- Language support, mainly for indentation because it's more stable than treesitter in Dart
  -- "dart-lang/dart-vim-plugin",
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = false,
      })
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
    config = function()
    end,
  },

  -- Gitlinker  
  {
    "ruifm/gitlinker.nvim",
    config = function()
      -- default keybind is <leader>gy
      require("gitlinker").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}


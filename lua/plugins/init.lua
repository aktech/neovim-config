return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    }
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    'github/copilot.vim',
    lazy = false,
    config = function ()
      vim.cmd("Copilot setup")
    end,
  },

  {
    "mistweaverco/kulala.nvim",
  },

 require("plugins.configs.lspsaga"),
 require("plugins.configs.vim-visual-multi"),
 require("plugins.configs.nvim-treesitter"),
 require("plugins.configs.avante"),
 require("plugins.configs.snacks"),
 require("plugins.configs.dadbod"),
 require("plugins.configs.refactoring"),
 -- remove this if not fun to use
 require("plugins.configs.noice"),
}

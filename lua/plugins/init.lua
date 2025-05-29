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
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "mistweaverco/kulala.nvim",
  },

  {
    "hrsh7th/nvim-cmp",
  },

  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },

  require "plugins.configs.auto-session",
  require "plugins.configs.copilot",
  require "plugins.configs.lspsaga",
  require "plugins.configs.vim-visual-multi",
  require "plugins.configs.nvim-treesitter",
  require "plugins.configs.avante",
  require "plugins.configs.snacks",
  require "plugins.configs.dadbod",
  require "plugins.configs.refactoring",
  -- remove this if not fun to use
  require "plugins.configs.noice",
}

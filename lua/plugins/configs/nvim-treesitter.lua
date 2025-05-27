return   {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "javascript", "python", "html", "css" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-Up>",        -- Option + Up to start
          node_incremental = "<M-Up>",      -- Option + Up to expand
          node_decremental = "<M-Down>",    -- Option + Down to shrink
          scope_incremental = "<Tab>",      -- Keep Tab for scope
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "javascript", "python", "html", "css" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-Up>", -- Option + Up to start
          node_incremental = "<M-Up>", -- Option + Up to expand
          node_decremental = "<M-Down>", -- Option + Down to shrink
          scope_incremental = "<Tab>", -- Keep Tab for scope
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
    }

    -- Highlighting
    -- Define custom highlight groups for docstrings
    vim.api.nvim_set_hl(0, "@string.documentation", {
      fg = "#808080", -- Gray color for docstrings
      italic = true, -- Make docstrings italic
    })
  end,
}

require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "rust-analyzer", "ts_ls", "ruff", "bashls", "jsonls", "lua_ls" }

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      lint = {
        -- Ignores all isort rules (I001, I002, etc.)
        -- https://docs.astral.sh/ruff/editors/settings/#ignore
        ignore = {"I"}
      }
    }
  }
})

vim.lsp.config('pyright', {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
})

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

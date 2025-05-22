require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "rust-analyzer", "ts_ls", "ruff"}

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
      args = {
        '--ignore=I001'
      },
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

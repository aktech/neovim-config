require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html", "cssls", "pylsp", "rust-analyzer", "ts_ls", "ruff", "bashls", "jsonls", "lua_ls", "terraform_lsp",
  "yamlls", "dockerls", "gopls", "clangd", "sqls", "docker_compose_language_service", "graphql", "tailwindcss",
}

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

vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          mccabe = { enabled = false },
          pylsp_mypy = { enabled = false },
          pylsp_black = { enabled = false },
          pylsp_isort = { enabled = false },
      }
    }
  }
})
-- vim.lsp.config('pyright', {
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         ignore = { '*' },
--         -- Disable since very inefficient
--         -- diagnosticMode = "workspace",
--       },
--     },
--   },
-- })

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

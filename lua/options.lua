require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Configure diagnostics to be less overwhelming
vim.diagnostic.config {
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    spacing = 2,
    prefix = "●",
    format = function(diagnostic)
      -- Truncate long messages
      local message = diagnostic.message
      if #message > 60 then
        message = message:sub(1, 57) .. "..."
      end
      return message
    end,
  },
  signs = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  underline = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  severity_sort = true,
  update_in_insert = false,
}

-- Define lighter diagnostic highlight groups
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#d80e52", bg = "NONE", italic = true })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#B2BEB5", bg = "NONE", italic = true })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#89b4fa", bg = "NONE", italic = true })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a6e3a1", bg = "NONE", italic = true })

-- darker shades of the same hues (~75 % darker than the fg)
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#d80e52", bg = "#3b071c", italic = true })
-- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { fg = "#B2BEB5", bg = "#2c2f2d", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#B2BEB5", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#89b4fa", bg = "#222d3e", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a6e3a1", bg = "#22372a", italic = true })

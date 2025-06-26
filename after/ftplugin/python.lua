-- Python filetype specific settings
-- This file overrides default Python settings that cause auto-wrapping

-- Disable automatic text wrapping
vim.opt_local.textwidth = 0

-- Remove the 't' flag from formatoptions to prevent auto text wrapping
-- 'c' = auto-wrap comments, 'q' = allow formatting with gq, 'j' = remove comment leader when joining lines
vim.opt_local.formatoptions = "cqj"

-- Disable visual line wrapping (optional, but recommended for coding)
vim.opt_local.wrap = false

-- Ensure these settings stick by removing any conflicting autocmds
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.py",
  callback = function()
    vim.opt_local.textwidth = 0
    vim.opt_local.formatoptions = "cqj"
    vim.opt_local.wrap = false
  end,
  group = vim.api.nvim_create_augroup("PythonNoWrap", { clear = true })
})
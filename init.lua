vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


-- Autosave on focus lost, buffer switch, or when leaving insert mode
vim.api.nvim_create_autocmd({"FocusLost", "BufLeave", "InsertLeave"}, {
  pattern = "*",
  command = "silent! wa"
})

-- Autosave every few seconds (optional)
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  command = "silent! update"
})

-- Set the time delay for CursorHold (in milliseconds)
vim.opt.updatetime = 5000  -- 5 seconds


-- NOTE: Below is not working for some reason, REVSIT LATER
-- More aggressive file reloading
vim.opt.autoread = true

-- Force check for external changes on every buffer enter
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "CursorHold", "CursorMoved", "CursorMovedI"}, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= 'c' and vim.bo.buftype == '' then
      vim.cmd('silent! checktime')
    end
  end
})

-- Also check when switching windows
vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function()
    vim.cmd('silent! checktime')
  end
})

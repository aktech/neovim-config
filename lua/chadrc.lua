-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
M.base46 = {
	theme = "catppuccin",
  hl_override = {
    CursorLine = { bg = "#414559" },  -- bluish-gray, soft but visible
    Visual = { bg = "#414559" },  -- bluish-gray, soft but visible
  }
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

M.ui = {
  statusline = {
    theme = "minimal", -- "default", "minimal", "vscode", "lsp", "gruvbox", "catppuccin"
    separator_style = "default", -- "arrow", "block", "slant", "slant_double", "slant_thin", "slant_thick"
    modules = {
      -- to show full relative path of the file in the project
      file = function()
        local path = vim.fn.expand "%:."
        if path == "" then
          return "%#St_file_info# [No Name] "
        end
        local modified = vim.bo.modified and " +" or ""
        return "%#St_file_info# " .. path .. modified .. " "
      end,
    },
  },
}

return M

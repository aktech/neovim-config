require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Lspsaga keymap
-- Lspsaga keybindings
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

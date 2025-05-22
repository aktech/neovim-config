require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Find references" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

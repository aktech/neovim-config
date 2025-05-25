require "nvchad.mappings"
local wk = require("which-key")
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Lspsaga keymappings
wk.add({
  { "<leader>k", group = "Lspsaga" }, -- group
  { "<leader>kp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
  { "<leader>kd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to Definition" },
  { "<leader>kh", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" },
  { "<leader>kr", "<cmd>Lspsaga finder<CR>", desc = "Find references" },
})

-- map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
-- map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
-- map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
-- map("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Find references" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local function visual_cursors_with_delay()
  -- Execute the vm-visual-cursors command.
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd('sleep 200m')
  -- Press 'A' in normal mode after the delay.
  vim.cmd('silent! execute "normal! A"')
end

wk.add(
  {
    { "<leader>m", group = "Visual Multi" },
    { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All" },
    { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mapping" },
    { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Add Cursor At Pos" },
    { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search" },
    { "<leader>mv", visual_cursors_with_delay, desc = "Visual Cursors", mode = "v" },
  }
)

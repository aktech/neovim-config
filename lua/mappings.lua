require "nvchad.mappings"
local wk = require("which-key")
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Lspsaga keymappings
wk.add({
  { "<leader>k", group = "Lspsaga" }, -- group
  { "<leader>kp", "<cmd>Lspsaga peek_definition<CR>", desc = "LSP Peek Definition" },
  { "<leader>kd", "<cmd>Lspsaga goto_definition<CR>", desc = "LSP Go to Definition" },
  { "<leader>kh", "<cmd>Lspsaga hover_doc<CR>", desc = "LSP Hover Doc" },
  { "<leader>kr", "<cmd>Lspsaga finder<CR>", desc = "LSP Find references" },
  { "<leader>kn", "<cmd>Lspsaga rename<CR>", desc = "LSP Rename" },
  { "<leader>kc", "<cmd>Lspsaga code_action<CR>", desc = "LSP Code Actions" },
  { "<leader>ko", "<cmd>Lspsaga outline<CR>", desc = "LSP outline" },
})
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
    { "<leader>ma", "<Plug>(VM-Select-All)<Tab>", desc = "Select All", mode = "n" },
    { "<leader>mo", "<Plug>(VM-Toggle-Mappings)", desc = "Toggle Mapping", mode = "n" },
    { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", desc = "Add Cursor At Pos", mode = "n" },
    { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search", mode = "n" },
    { "<leader>mv", visual_cursors_with_delay, desc = "Visual Cursors", mode = "v" },
  }
)

wk.add(
  {
    { "<leader>l", group = "Lazy Git" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazy Git", mode = "n" },
    { "<leader>lf", function() Snacks.lazygit.log_file() end, desc = "File History", mode = "n" },
    { "<leader>ll", function() Snacks.lazygit.log() end, desc = "Git Log", mode = "n" },
    { "<leader>lb", "<cmd>Git blame<cr>", desc = "Git Blame" },
    { "<leader>lB", function()
        local file = vim.fn.expand("%")
        local line = vim.fn.line(".")
        Snacks.terminal({"git", "blame", "-L", line .. "," .. line, file}, {
          title = "Git Blame Line " .. line,
          size = { width = 0.9, height = 0.6 }
        })
      end, desc = "Blame Current Line", mode = "n"
    },
    { "<leader>lt", function()
        Snacks.terminal("git status", {
          title = "Git Status",
          size = { width = 0.7, height = 0.7 }
        })
      end, desc = "Git Status", mode = "n"
    },
  }
)

-- Debug statement mapping
wk.add({
  { "<leader>d", group = "Debug" },
  { "<leader>db", "oimport ipdb; ipdb.set_trace()<Esc>", desc = "Add ipdb breakpoint", mode = "n" },
})

wk.add({
    { "<leader>.",  function() Snacks.scratch({win = false, ft = "markdown"}) end, desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
})

wk.add({
    { "<leader>,",  function() require('conform').format() end, desc = "Format file" },
})

-- Terminal mappings
wk.add({
  { "<leader>t", group = "Terminal" },
  { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
  { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
  { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle vertical terminal" },
  { "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle all terminals" },
  { "<leader>ts", "<cmd>TermSelect<cr>", desc = "Select terminal" },
})

wk.add({
    { "<leader>h",  function() require('nvchad.themes').open() end, desc = "telescope nvchad themes" },
})

wk.add({
    { "<leader>e",  function() Snacks.explorer() end, desc = "Toggle Explorer" },
})

wk.add({
    { "<leader>rp", function() vim.cmd('normal! ggVG"+p') end, desc = "Replace buffer with clipboard" },
})

wk.add({
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
})

wk.add({
  -- Single mapping
  { "<leader>X", "<cmd>%bdelete<cr>", desc = "Close all buffers" },
  -- Group with prefix
  { "<leader>b", group = "Buffer" },
  { "<leader>bx", "<cmd>%bdelete<cr>", desc = "Close all buffers" },
   { "<leader>bc", function()
    local current = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
      if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
        local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
        local filetype = vim.api.nvim_buf_get_option(buf, 'filetype')

        -- Skip special buffers (file tree, terminals, etc.)
        if buftype == '' and filetype ~= 'NvimTree' and filetype ~= 'neo-tree' then
          vim.api.nvim_buf_delete(buf, { force = false })
        end
      end
    end
  end, desc = "Close all buffers but current" },
  { "<leader>bn", "<cmd>bnext<cr>", desc = "Next buffer" },
  { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous buffer" },
})

wk.add({
  { "<leader>cw", group = "Clean Whitespace" },
  { "<leader>cwt", "<cmd>%s/\\s\\+$//g<cr>", desc = "Remove trailing whitespace" },
})

return {
  "tpope/vim-dadbod",
  dependencies = {
      "kristijanhusak/vim-dadbod-completion",
      "kristijanhusak/vim-dadbod-ui",
  },
  lazy = false,
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_auto_execute_table_helpers = 1
  end,
}

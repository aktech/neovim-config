return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
      lsp = {
      signature = {
        enabled = false, -- This disables signature help completely, annoying things that pops up on pressing space inside functions
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
}

return {
    "mg979/vim-visual-multi",
    lazy = false, -- Load immediately
    init = function()
      -- Disable all default mappings
      vim.g.VM_default_mappings = 0
      -- Only keep the essential mappings
      vim.g.VM_maps = {
        ["Find Under"] = "",
      }
    end,
}

return {
    'nvimdev/lspsaga.nvim',
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
  }

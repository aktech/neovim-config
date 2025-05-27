-- lua/custom/plugins.lua  (or equivalent)
return {
  -- ①  Copilot engine (Lua)
  {
    "zbirenbaum/copilot.lua",
    cmd   = "Copilot",          -- lazy-load on first use
    build = ":Copilot auth",    -- run once to sign in
    opts  = {
      suggestion = { enabled = false },  -- ⬅ turn off ghost-text pop-ups
      panel      = { enabled = false },
    },
  },

  -- ②  Make Copilot a cmp source
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = "zbirenbaum/copilot.lua",
    config = function() require("copilot_cmp").setup() end,
  },
}

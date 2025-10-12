return {
  "sphamba/smear-cursor.nvim",
  enabled = false,
  event = "VeryLazy",
  cond = vim.g.neovide == nil,
  opts = { -- Default  Range
    stiffness = 0.9, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.3      [0, 1]
    distance_stop_animating = 0.7, -- 0.1      > 0
    hide_target_hack = false, -- true     boolean
  },
  specs = {
    -- disable mini.animate cursor
    {
      "echasnovski/mini.animate",
      optional = true,
      opts = { cursor = { enable = true } },
    },
  },
}

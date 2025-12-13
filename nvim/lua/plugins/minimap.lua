return {
  "nvim-mini/mini.map",
  version = "*",
  dependencies = { "lewis6991/gitsigns.nvim" },
  config = function()
    local map = require("mini.map")

    -- Configure mini.map
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),                          -- Highlight search results in the map
        map.gen_integration.diagnostic({ error = "DiagnosticError" }), -- Show diagnostics
        require("mini.map").gen_integration.gitsigns({                 -- Git integration
          add = "GitSignsAdd",                                         -- Highlight group for added lines
          change = "GitSignsChange",                                   -- Highlight group for changed lines
          delete = "GitSignsDelete",                                   -- Highlight group for deleted lines
        }),
      },
      symbols = {
        encode = map.gen_encode_symbols.dot("4x2"), -- Dot-based map
      },
      window = {
        side = "right", -- Show the map on the right
        width = 15,     -- Adjust width to your preference
        winblend = 25,  -- Transparency (0 is opaque, 100 is fully transparent)
      },
    })

    -- Key mappings
    vim.keymap.set("n", "<Leader>mm", map.toggle, { desc = "Toggle MiniMap" })
    vim.keymap.set("n", "<Leader>mc", map.close, { desc = "Close MiniMap" })
    vim.keymap.set("n", "<Leader>mo", map.open, { desc = "Open MiniMap" })
    vim.keymap.set("n", "<Leader>mp", map.toggle_focus, { desc = "Toggle MiniMap Focus" })
  end,
}

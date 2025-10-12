return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {

      sections = {
        lualine_x = {
          function()
            return require("apple-music")._current_track
          end,
        },
      },
    },
  },
}

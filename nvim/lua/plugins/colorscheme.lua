return {

  { "folke/tokyonight.nvim", lazy = true, opts = { style = "night" }, enable = false },
  {
    "polirritmico/monokai-nightasty.nvim",
    opts = {
      dark_style_background = "dark",
      lualine_style = "dark",
      lualine_bold = true,
      terminal_colors = function(colors)
        return { fg = colors.fg_dark }
      end,
    },
    lazy = true,
    enable = false,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}

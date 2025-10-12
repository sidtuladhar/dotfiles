-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd([[
  highlight GitSignsAdd guifg=Green
  highlight GitSignsChange guifg=#673AB7
]])

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 8

-- Optional: Create a toggle wrapping command
vim.api.nvim_create_user_command("ToggleWrap", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap -- Enable linebreak only if wrap is on
end, {})

vim.g.snacks_animate = false

vim.g.lazyvim_python_lsp = "pylsp"

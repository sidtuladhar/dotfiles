local _ts_start = vim.treesitter.start
vim.treesitter.start = function(...)
	pcall(_ts_start, ...)
end

require("config.lazy")

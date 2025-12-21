return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		},
	},

	{
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			lazy = false,
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			keys = {
				{ "<leader>e", "<cmd>Neotree action=show toggle=true<cr>", desc = "Toggle Neo-tree" },
			},
			opts = {
				window = {
					width = 25,
					mappings = {
						["<space>"] = "none",
					},
				},
			},
			init = function()
				vim.api.nvim_create_autocmd("VimEnter", {
					callback = function()
						vim.cmd("Neotree focus")
					end,
				})
			end,
		},
		{
			"antosha417/nvim-lsp-file-operations",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
			},
			config = function()
				require("lsp-file-operations").setup()
			end,
		},
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			win = {
				border = "rounded",
			},
		},
		config = function(_, opts)
			vim.api.nvim_set_hl(0, "WhichKeyNormal", { link = "Normal" })
			require("which-key").setup(opts)
		end,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}

return {
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "deep",
			})
			require("onedark").load()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local colors = {
				bg = "#272822",
				fg = "#f8f8f2",
				green = "#a6e22e",
				pink = "#f92672",
				blue = "#66d9ef",
				orange = "#fd971f",
				purple = "#ae81ff",
				grey = "#465457",
			}

			local molokai = {
				normal = {
					a = { fg = colors.bg, bg = colors.green, gui = "bold" },
					b = { fg = colors.fg, bg = colors.grey },
					c = { fg = colors.fg, bg = colors.bg },
				},
				insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
				visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
				replace = { a = { fg = colors.bg, bg = colors.pink, gui = "bold" } },
				command = { a = { fg = colors.bg, bg = colors.orange, gui = "bold" } },
				inactive = {
					a = { fg = colors.grey, bg = colors.bg },
					b = { fg = colors.grey, bg = colors.bg },
					c = { fg = colors.grey, bg = colors.bg },
				},
			}

			require("lualine").setup({
				options = {
					theme = molokai,
					component_separators = "",
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff" },
					lualine_c = {},
					lualine_x = {
						{
							function()
								return vim.fn.reg_recording() ~= "" and "recording @" .. vim.fn.reg_recording() or ""
							end,
						},
						"searchcount",
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
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
		"rcarriga/nvim-notify",
		opts = {
			top_down = true,
		},
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
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

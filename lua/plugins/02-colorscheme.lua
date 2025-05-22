return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- 立即加载
		priority = 1000, -- 高优先级
		-- enabled = false,
		opts = {
			integrations = { blink_cmp = true },
		},
		config = function()
			require("catppuccin").setup({
				transparent_background = true, -- 透明背景
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},

	{
		"craftzdog/solarized-osaka.nvim",
		enabled = false,
		-- lazy = true,
		-- priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
		config = function()
			-- 设置颜色主题
			vim.cmd("colorscheme solarized-osaka")
		end,
	},
}

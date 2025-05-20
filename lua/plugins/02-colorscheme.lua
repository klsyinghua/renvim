return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- 立即加载
		priority = 1000, -- 高优先级
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
}

-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = false,
		priority = 1000, -- 确保它最先加载
		opts = {
			flavour = "frappe",
			transparent_background = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		opts = {
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			inverse = true,
			contrast = "", -- "hard", "soft", or ""
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		},
	},

	{
		"uZer/pywal16.nvim",
		-- for local dev replace with:
		-- dir = '~/your/path/pywal16.nvim',
		config = function()
			vim.cmd.colorscheme("pywal16")
		end,
	},
}

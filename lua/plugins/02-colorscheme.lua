return {
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	-- enabled = false,
	-- 	-- lazy = true,
	-- 	-- priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			transparent = true,
	-- 		}
	-- 	end,
	-- 	config = function()
	-- 		-- 设置颜色主题
	-- 		vim.cmd("colorscheme solarized-osaka")
	-- 	end,
	-- },

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("tokyonight").setup({
				styles = {
					comments = { italic = false }, -- Disable italics in comments
				},
			})

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}

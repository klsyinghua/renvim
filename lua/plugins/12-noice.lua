return {
	"folke/noice.nvim",
	event = "VeryLazy",
	--	enabled = false,
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000", -- Fix for NotifyBackground error
					-- Optional: Additional nvim-notify configurations
					stages = "fade_in_slide_out", -- Animation style
					timeout = 3000, -- Notification duration (ms)
					fps = 60, -- Animation frame rate
				})
			end,
		},
	},
}

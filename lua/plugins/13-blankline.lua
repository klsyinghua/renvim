-- Configuring lukas-reineke/indent-blankline.nvim for LazyVim
return {
	"lukas-reineke/indent-blankline.nvim",
	enabled = false,
	event = { "BufReadPost", "BufNewFile" }, -- Load on buffer read or new file
	main = "ibl", -- Specify the main module for the plugin
	opts = {
		indent = {
			char = "│", -- Character for indent lines
			tab_char = "│", -- Character for tab indents
		},
		scope = {
			enabled = true, -- Enable scope highlighting
			show_start = true, -- Show scope start
			show_end = false, -- Don't show scope end
			highlight = { "Function", "Label" }, -- Highlight groups for scope
		},
		exclude = {
			filetypes = { -- Filetypes to exclude from indent guides
				"help",
				"terminal",
				"dashboard",
				"packer",
				"lazy",
				"mason",
				"notify",
				"TelescopePrompt",
			},
			buftypes = { "terminal", "nofile" }, -- Buffer types to exclude
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts) -- Setup the plugin with provided options
	end,
}

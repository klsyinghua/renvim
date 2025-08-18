-- ~/.config/nvim/lua/plugins/alpha.lua
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			[[  ^  ^  ^   ^☆ ★ ☆ ___I_☆ ★ ☆ ^  ^   ^  ^  ^   ^  ^ ]],
			[[ /|\/|\/|\ /|\ ★☆ /\-_--\ ☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
			[[ /|\/|\/|\ /|\ ★ /  \_-__\☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
			[[ /|\/|\/|\ /|\ 󰻀 |[]| [] | 󰻀 /|\/|\ /|\/|\/|\ /|\/|\ ]],
		}

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files()<CR>"),
			dashboard.button("t", "  Browse cwd", ":NvimTreeOpen<CR>"),
			dashboard.button("r", "  Browse src", ":e ~/.local/src/<CR>"),
			dashboard.button("s", "󰯂  Browse scripts", ":e ~/scripts/<CR>"),
			dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
			dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/config/mappings.lua<CR>"),
			dashboard.button("p", "  Plugins", ":PlugInstall<CR>"),
			dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
		}

		-- Footer
		dashboard.section.footer.val = function()
			return vim.g.startup_time_ms or "[[  ]]"
		end

		-- Highlight & setup
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.opts.opts.noautocmd = true

		alpha.setup(dashboard.opts)
	end,
}

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		-- fzf window apearance
		winopts = {
			width = 0.8,
			height = 0.8,
			row = 0.5,
			col = 0.5,
			-- You can change the border style here
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winblend = 20, -- Adjust this value (0-100) for transparency
			-- Preview window on the right
			preview = {
				border = "noborder",
				scrollbar = false,
				wrap = "nowrap",
				hidden = "hidden",
			},
		},
		-- keymaps inside fzf window
		keymap = {
			["fzf-prompt"] = {
				-- toggle preview
				["ctrl-p"] = "toggle-preview",
			},
			["fzf-lua"] = {
				-- close fzf window
				["ctrl-c"] = "close",
				["esc"] = "close",
			},
		},
		-- Use fd and ripgrep for faster search if they are installed
		files = {
			cmd = "fd --type f --hidden --strip-cwd-prefix --exclude .git",
		},
		grep = {
			cmd = "rg --vimgrep --no-heading --smart-case --line-number --column",
		},
		-- LSP related fzf-lua options
		lsp = {
			-- preview jump location
			preview_location = "preview",
			-- jump to definition in new tab
			def_new_item = "tabedit",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in project directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by grepping in project directory",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in neovim configuration",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[F]ind [B]uiltin FZF",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[F]ind current [W]ORD",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "[F]ind [O]ld Files",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "[,] Find existing buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "[/] Live grep the current buffer",
		},
	},
}

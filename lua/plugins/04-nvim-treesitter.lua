return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"go",
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"json",
				"yaml",
				"python",
			},
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true, -- 开启增量选择功能
			keymaps = {
				init_selection = "gnn", -- 初始化选择（光标所在位置）
				node_incremental = "grn", -- 扩展到下一个更大的语法节点
				scope_incremental = "grc", -- 扩展到当前作用域（如函数体）
				node_decremental = "grm", -- 缩小选区到更小的语法节点
			},
		},
	},
}

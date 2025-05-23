-- lazy.nvim 配置示例
return {
	-- ... 其他插件 ...

	-- nvim-autopairs 插件配置
	{
		"windwp/nvim-autopairs",
		-- 默认情况下，nvim-autopairs 已经足够智能，无需额外配置
		-- 如果你想启用一些高级功能，例如在特定文件类型中禁用，或者自定义配对规则，
		-- 才需要添加 config 函数
		config = function()
			require("nvim-autopairs").setup({
				-- 默认配置通常就很好用，以下是一些示例选项：
				-- disable_filetype = { "TelescopePrompt", "vim" }, -- 在这些文件类型中禁用
				-- check_ts = true, -- 检查treesitter节点，避免在注释或字符串中自动配对
				-- map_bs = true, -- 映射退格键，删除配对字符
				-- map_c_h = false, -- 禁用 Ctrl-h 映射
			})
		end,
	},
	-- ... 其他插件，包括你的 lspconfig 配置 ...
}

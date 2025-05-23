if true then
	return {}
end
local map = vim.keymap.set

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- 提供文件图标
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true, -- 如果是最后一个窗口，关闭 Neotree
				popup_border_style = "rounded", -- 浮动窗口边框样式
				enable_git_status = true, -- 启用 Git 状态显示
				enable_diagnostics = true, -- 启用诊断信息
				window = {
					position = "left", -- 设置为浮动窗口
					-- popup = {
					-- 	size = {
					-- 		height = 30, -- 窗口高度 80
					-- 		width = 60, -- 窗口宽度 80
					-- 	},
					-- 	position = "50%", -- 居中显示
					-- 	border = "single", -- 边框样式
					-- },
				},
				filesystem = {
					follow_current_file = {
						enabled = true, -- 自动聚焦到当前文件
					},
					use_libuv_file_watcher = true, -- 自动刷新文件树
					filtered_items = {
						hide_dotfiles = false, -- 显示隐藏文件
						hide_gitignored = true, -- 隐藏 .gitignore 中的文件
						hide_by_name = {
							".git",
							"node_modules",
						},
						never_show = {
							".DS_Store",
						},
					},
				},
			})

			-- 设置快捷键打开 Neotree
			map("n", "<leader>e", "<cmd>Neotree toggle filesystem reveal float<cr>", { desc = "Toggle Neotree" })
		end,
	},
}

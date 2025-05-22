return {
	"akinsho/bufferline.nvim",
	-- 确保依赖项已安装
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- 用于显示文件图标
	opts = {
		options = {
			-- 基本显示设置
			mode = "buffers", -- 显示缓冲区（而不是 tabs）
			numbers = "ordinal", -- 显示缓冲区序号（如 1, 2, 3），便于快捷切换
			number_style = "superscript", -- 序号样式（上标）
			show_buffer_icons = true, -- 显示文件图标（需要 nvim-web-devicons）
			show_buffer_close_icons = true, -- 显示关闭按钮
			show_close_icon = false, -- 不显示全局关闭按钮（避免误操作）
			color_icons = true, -- 图标使用主题颜色
			separator_style = "thin", -- 分隔符样式（可选：slant, thick, thin）

			-- 诊断信息（与 LSP 集成）
			diagnostics = "nvim_lsp", -- 显示 LSP 诊断信息（错误、警告等）
			diagnostics_update_in_insert = false, -- 不在插入模式下更新诊断
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				-- 自定义诊断图标
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. n .. sym
				end
				return s
			end,

			-- 缓冲区排序和过滤
			sort_by = "insert_after_current", -- 新缓冲区插入到当前缓冲区之后
			always_show_bufferline = true, -- 始终显示 bufferline（即使只有一个缓冲区）

			-- 鼠标支持
			right_mouse_command = "bdelete! %d", -- 右键点击关闭缓冲区
			left_mouse_command = "buffer %d", -- 左键点击切换到缓冲区
			middle_mouse_command = nil, -- 中键暂不设置

			-- 自定义偏移（与文件树插件如 nvim-tree 集成）
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},

			-- 自定义高亮（与主题集成）
			highlights = {
				-- 使用主题的配色（动态适配 tokyonight、catppuccin 等）
				fill = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "StatusLineNC" },
				},
				background = {
					fg = { attribute = "fg", highlight = "Comment" },
					bg = { attribute = "bg", highlight = "StatusLine" },
				},
				buffer_selected = {
					fg = { attribute = "fg", highlight = "Normal" },
					bg = { attribute = "bg", highlight = "Visual" },
					bold = true,
					italic = false,
				},
			},

			-- 快捷键绑定（在插件内部定义，简化外部配置）
			mappings = true, -- 启用默认快捷键（如 <leader>1, <leader>2 切换缓冲区）
		},
	},
	-- 事件触发，确保 bufferline 在启动时加载
	event = { "BufReadPost", "BufNewFile" },
	-- 配置初始化函数，添加自定义快捷键
	config = function(_, opts)
		require("bufferline").setup(opts)

		-- 自定义快捷键（可选，增强导航）
		-- local map = vim.keymap.set
		-- map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
		-- map("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
		-- map("n", "<leader>bc", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
	end,
}

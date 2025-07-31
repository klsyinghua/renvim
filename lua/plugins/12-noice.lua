return {
	"folke/noice.nvim",
	event = "VeryLazy",
	-- enabled = false, -- 如果你完全不想用 noice，可以启用这个
	opts = {
		-- 消息显示模式
		-- "cmdline" (默认): 消息显示在命令行区域
		-- "popup": 消息显示为浮动窗口
		-- "split": 消息显示在分割窗口中
		-- "notify": 消息通过 vim.notify 显示 (需要 nvim-notify)
		-- "messages": 消息显示在 :messages 缓冲区中
		-- "none": 不显示消息 (但仍然会记录)
		messages = {
			-- 默认情况下，所有消息都显示在 cmdline
			-- 你可以根据消息类型调整显示方式
			-- 例如，只将重要的消息显示为通知，而将其他消息显示在 cmdline
			view_kind = "cmdline", -- 默认视图，通常是命令行
			-- view_kind = "popup", -- 也可以尝试 popup 视图，更不干扰
			-- view_kind = "notify", -- 如果你希望所有消息都通过 nvim-notify 显示，可以设置为这个
			-- view_kind = "none", -- 如果你希望完全不显示消息，可以设置为这个

			-- 过滤消息：这是减少通知的关键
			-- 你可以根据消息的级别、来源或内容来过滤
			-- 示例：只显示 warn 和 error 级别的消息为通知
			-- filter = {
			-- 	event = "msg_show", -- 过滤消息显示事件
			-- 	kind = { "wmsg", "emsg" }, -- 只显示警告和错误消息
			-- 	-- 或者更细粒度地控制：
			-- 	-- min_level = vim.log.levels.WARN, -- 只显示 WARN 级别及以上的消息
			-- },
		},

		-- 视图配置：自定义 UI 元素的外观和位置
		views = {
			-- 将命令弹出窗口 (command palette) 移动到左下角并设置固定宽度
			cmdline_popup = {
				position = {
					row = "100%",
					col = "100%",
				},
				size = {
					width = 40,
				},
			},
		},

		-- 浮动窗口配置 (如果 messages.view_kind 设置为 "popup")
		popup_menu = {
			enabled = true, -- 启用弹出菜单
			-- enter = true, -- 自动进入弹出菜单
			-- size = { width = 0.8, height = 0.8 }, -- 弹出菜单大小
		},

		-- 路由规则：更精细地控制消息如何显示
		-- 这是减少通知最有效的方式之一
		routes = {
			-- 示例 1: 隐藏所有 "written" 消息 (例如 :w 后的 "written 10 lines")
			{
				filter = { event = "msg_show", kind = "wmsg", find = "written" },
				opts = { skip = true }, -- 跳过显示
			},
			-- 示例 2: 隐藏所有 "No information available" 消息 (常见于 LSP)
			{
				filter = { event = "msg_show", find = "No information available" },
				opts = { skip = true },
			},
			-- 示例 3: 将所有 LSP 相关的 "info" 消息显示在 cmdline，而不是 notify
			-- 假设你的 LSP 消息通常是 info 级别
			{
				filter = { event = "msg_show", kind = "info", find = "LSP" }, -- 假设 LSP 消息包含 "LSP"
				opts = { view_kind = "cmdline" },
			},
			-- 示例 4: 将所有 "Error" 消息强制显示为 notify
			{
				filter = { event = "msg_show", kind = "emsg" },
				opts = { view_kind = "notify" },
			},
			-- 示例 5: 减少通知的持续时间 (如果 view_kind 是 notify)
			{
				filter = { event = "notify" }, -- 针对 nvim-notify 的消息
				opts = { timeout = 1500 }, -- 将通知显示时间缩短到 1.5 秒
			},
			-- 示例 6: 隐藏所有来自特定插件的通知 (例如，如果某个插件很吵)
			-- {
			-- 	filter = { event = "notify", find = "some_noisy_plugin_name" },
			-- 	opts = { skip = true },
			-- },
		},

		-- 禁用某些 Neovim UI 元素，让 Noice 接管
		-- 这不是减少通知，而是改变通知的显示方式
		presets = {
			bottom_search = true, -- 搜索结果显示在底部
			command_palette = true, -- 命令面板
			long_message_to_split = true, -- 长消息显示在分割窗口
			inc_rename = false, -- 增量重命名
			lsp_doc_border = false, -- LSP 文档边框
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					background_colour = "#000000", -- Fix for NotifyBackground error
					stages = "fade_in_slide_out", -- 动画风格
					timeout = 2000, -- 默认通知持续时间 (ms)，可以比 Noice 的 route 更长，Noice 的 route 会覆盖它
					fps = 60, -- 动画帧率
					-- 如果你希望 nvim-notify 默认不显示任何通知，除非 Noice 明确路由过来，
					-- 可以在这里设置一个非常短的 timeout 或其他策略，但通常不建议。
				})
			end,
		},
	},
}

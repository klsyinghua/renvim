-- lua/plugins/lspconfig.lua
-- 这是一个示例文件路径，你可以根据你的项目结构调整

local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason 必须在它的依赖之前加载
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- LSP 状态更新
		{ "j-hui/fidget.nvim", opts = {} },
	},
}

-- 辅助函数：创建键映射
local function create_lsp_keymaps(bufnr)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	map("gd", require("fzf-lua").lsp_definitions, "[G]oto [D]efinition")
	map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")
	map("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")
	map("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")
	map("<leader>ws", require("fzf-lua").lsp_live_workspace_symbols, "[W]orkspace [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

-- 辅助函数：检查客户端是否支持某个方法
---@param client vim.lsp.Client
---@param method vim.lsp.protocol.Method
---@param bufnr? integer
---@return boolean
local function client_supports_method(client, method, bufnr)
	if vim.fn.has("nvim-0.11") == 1 then
		return client:supports_method(method, bufnr)
	else
		-- 兼容 Neovim 0.10
		return client.supports_method(method, { bufnr = bufnr })
	end
end

-- 配置文档高亮
local function setup_document_highlight(client, bufnr)
	if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
		local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			group = highlight_augroup,
			callback = vim.lsp.buf.clear_references,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
			callback = function(event2)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
			end,
		})
	end
end

-- 配置 Inlay Hints
local function setup_inlay_hints(client, bufnr)
	if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, bufnr) then
		vim.keymap.set("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
		end, { buffer = bufnr, desc = "LSP: [T]oggle Inlay [H]ints" })
	end
end -- <-- 在这里添加了 'end'

-- LSP 诊断配置
local function setup_diagnostic_config()
	vim.diagnostic.config({
		severity_sort = true,
		float = { border = "rounded", source = "if_many" },
		underline = { severity = vim.diagnostic.severity.ERROR },
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
			},
		},
		virtual_text = {
			source = "if_many",
			spacing = 2,
			format = function(diagnostic)
				return diagnostic.message
			end,
		},
	})
end

-- LSP 服务器配置
local lsp_servers = {
	bashls = {},
	marksman = {},
	gopls = {
		settings = {
			gopls = {
				gofumpt = true,
				buildFlags = {}, -- 可以添加构建标志，例如 {"-tags=integration"}
				analyses = {
					unusedparams = true,
				},
				staticcheck = true, -- 启用 staticcheck
				completeUnimported = true, -- 启用自动导入未导入的包
				ui = {
					completion = {
						usePlaceholders = true, -- 此处是 gopls settings 内部的正确位置
					},
				},
			},
		},
	},
	pyright = {},
	lua_ls = {},
}

-- Mason 工具安装列表
local mason_tools = {
	"stylua", -- Used to format Lua code
	"prettierd", -- Used to format javascript and typescript code
	-- gopls, pyright, bashls 已经包含在 lsp_servers 的键中，无需重复
}

M.config = function()
	-- 设置诊断配置
	setup_diagnostic_config()

	-- LspAttach 自动命令
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local bufnr = event.buf
			local client = vim.lsp.get_client_by_id(event.data.client_id)

			-- 创建 LSP 相关的键映射
			create_lsp_keymaps(bufnr)

			-- 设置文档高亮
			setup_document_highlight(client, bufnr)

			-- 设置 Inlay Hints
			setup_inlay_hints(client, bufnr)
		end,
	})

	-- 获取 LSP capabilities
	-- 假设 require("blink.cmp").get_lsp_capabilities() 已经包含了 make_client_capabilities() 的内容
	local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- Mason 工具安装
	-- 将 lsp_servers 的键和 mason_tools 合并，确保所有需要的工具都被安装
	local ensure_installed_tools = vim.tbl_keys(lsp_servers)
	vim.list_extend(ensure_installed_tools, mason_tools)
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed_tools })

	-- Mason LSP 配置
	require("mason-lspconfig").setup({
		ensure_installed = {}, -- 由 mason-tool-installer 处理安装
		automatic_installation = false,
		handlers = {
			function(server_name)
				local server_opts = lsp_servers[server_name] or {}
				-- 优化合并 capabilities 的方式
				-- 直接将 capabilities 合并到 server_opts 中，而不是单独合并 capabilities 字段
				-- 这样可以确保 server_opts 中定义的任何顶层配置（如 root_dir）也能被正确处理
				local final_opts = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_opts)
				require("lspconfig")[server_name].setup(final_opts)
			end,
		},
	})
end

return { M }

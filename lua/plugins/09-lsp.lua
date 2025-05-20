return {
  -- Mason: 管理和安装 LSP 服务器、DAP 适配器、Linters 和 Formatters
  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed 列表通常放在 mason-lspconfig 中，用于自动安装 LSP 服务器
      -- 如果你还需要安装其他非 LSP 工具（如 formatters, linters），可以在这里添加
      -- ensure_installed = {
      --   "stylua",
      --   "shfmt",
      --   "pyright",
      -- },
    },
  },

  -- Mason-LSPConfig: 将 Mason 与 nvim-lspconfig 集成
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim", -- 确保 Mason 在 Mason-LSPConfig 之前加载
      "neovim/nvim-lspconfig",   -- 确保 nvim-lspconfig 在 Mason-LSPConfig 之前加载
    },
    opts = {
      -- 在这里列出你希望 Mason 自动安装的 LSP 服务器
      ensure_installed = {
        "lua_ls",
        "bashls",
        "gopls",
        "html",
        "jsonls",
        "pylsp",
      },
      -- 自动设置 LSP 服务器的 handler
      -- 这部分通常由 LazyVim 的默认配置处理，但如果你需要自定义，可以在这里添加
      -- setup_handlers = {
      --   function(server_name)
      --     require('lspconfig')[server_name].setup {}
      --   end,
      -- },
    },
  },

  -- nvim-lspconfig: LSP 客户端核心
  {
    "neovim/nvim-lspconfig",
    -- LazyVim 通常会在这里配置 LSP 服务器的特定设置
    -- 例如：
    -- opts = {
    --   servers = {
    --     lua_ls = {
    --       settings = {
    --         Lua = {
    --           workspace = { checkThirdParty = false },
    --           telemetry = { enable = false },
    --         },
    --       },
    --     },
    --     gopls = {}, -- 可以添加 gopls 的特定配置
    --   },
    -- },
  },
}


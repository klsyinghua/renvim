-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local opt = vim.opt

-- Line numbers
opt.number = true -- 显示绝对行号
opt.relativenumber = true -- 显示相对行号

-- Indentation
opt.tabstop = 2 -- 制表符宽度为 2 空格
opt.shiftwidth = 2 -- 自动缩进宽度为 2 空格
opt.expandtab = true -- 使用空格替代制表符
opt.autoindent = true -- 自动缩进

-- Text wrapping
opt.wrap = false -- 禁用文本换行

-- Cursor highlighting
opt.cursorline = true -- 高亮当前行

-- Mouse support
opt.mouse = "a" -- 启用鼠标支持（所有模式）

-- Clipboard
-- opt.clipboard:append("unnamedplus")  -- 使用系统剪贴板
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Window splitting
opt.splitright = true -- 新窗口默认在右侧
opt.splitbelow = true -- 新窗口默认在下方

-- Search settings
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 如果搜索包含大写字母，则区分大小写

-- Appearance

opt.termguicolors = true -- 启用真彩色支持
opt.signcolumn = "yes" -- 始终显示符号列

-- Auto write
opt.autowrite = true -- 自动保存

--
opt.confirm = true -- Confirm to save changes before exiting modified buffer

--
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold

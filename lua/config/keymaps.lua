-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ---------- Insert Mode ---------- ---
-- Save file with Ctrl+s in multiple modes
keymap({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><esc>", { desc = "Save File" })

-- ---------- Window Navigation ---------- ---
-- Move to window using Ctrl + hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- ---------- Line Movement ---------- ---
-- Move line up/down in Normal and Visual modes
keymap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<CR>==", { desc = "Move Line Down" })
keymap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move Line Up" })
keymap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move Selection Down" })
keymap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move Selection Up" })

-- ---------- Buffer Navigation ---------- ---
-- Switch to previous/next buffer
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- ---------- Window Management ---------- ---
-- Split windows with leader key
keymap("n", "<leader>|", "<C-w>v", { desc = "Split Window Horizontally" })
keymap("n", "<leader>-", "<C-w>s", { desc = "Split Window Vertically" })

-- Commenting
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<CR>fxa<bs>", { desc = "Add Comment Above" })
keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<CR>fxa<bs>", { desc = "Add Comment Below" })

--
-- Quick comment/uncomment with <leader>/
keymap("n", "<leader>c", "gcc", { desc = "Toggle Comment (Line)", remap = true })

keymap("v", "<leader>c", "gc", { desc = "Toggle Comment (Selection)", remap = true })

-- New windows
keymap("n", "te", ":tabedit")

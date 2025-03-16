return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        -- 在这里可以根据需要配置 neo-tree
        filesystem = {
          filtered_items = {
            visible = true, -- 是否显示过滤项
            hide_dotfiles = false, -- 是否隐藏 dotfiles
            hide_gitignored = true, -- 是否隐藏 git 忽略的文件
          },
        },
        window = {
          width = 40, -- 设置窗口宽度
          height = 30,
        },
      })
      vim.api.nvim_set_keymap("n", "<Leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
  },
}

return {
  -- 插件名称
  "nvim-lualine/lualine.nvim",
  -- 依赖项（可选）
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- lualine 依赖图标支持
  -- 启用条件（可选）
  event = "VeryLazy", -- 延迟加载，推荐用于界面类插件
  -- 配置函数
  config = function()
    local lualine = require('lualine')

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = true,
      cond = function()
        return vim.bo.filetype ~= "markdown"
      end,
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local mode = {
      "mode",
      fmt = function(str)
        return "-- " .. str .. " --"
      end,
    }

    local branch = {
      "branch",
      icon = "",
    }

    local progress = function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "", "", "" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index] .. " " .. math.floor(line_ratio * 100) .. "%%"
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { branch },
        lualine_b = { mode },
        lualine_c = { diagnostics },
        lualine_x = { diff, "fileformat", "filetype" },
        lualine_y = { "location" },
        lualine_z = { progress },
      },
      extensions = { 'nvim-tree' },
    })

    -- 透明背景设置（如果需要）
    -- vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "lualine_x_normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "lualine_x_inactive", { bg = "none" })
  end,
}

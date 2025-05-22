return {
	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				trigger = {
					show_on_insert_on_trigger_character = false,
					show_on_accept_on_trigger_character = false,
					show_on_blocked_trigger_characters = { "{", "(", "}", ")" },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
				},
				menu = {
					scrollbar = false,
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "kind", gap = 1 },
							{ "label_description", gap = 1 },
							{ "source_name", gap = 1 },
						},
						components = {
							kind_icon = {
								ellipsis = false,
								width = { fill = true },
								text = function(ctx)
									local kind_icons = {
										Function = "λ", -- Lambda symbol for functions
										Method = "∂", -- Lambda symbol for methods
										Field = "󰀫", -- Lambda symbol for methods
										Variable = "󰀫", -- Lambda symbol for methods
										Property = "󰀫", -- Lambda symbol for methods
										Keyword = "k", -- Lambda symbol for methods
										Struct = "Π", -- Lambda symbol for methods
										Enum = "τ", -- Lambda symbol for methods
										EnumMember = "τ", -- Lambda symbol for methods
										Snippet = "⊂",
										Text = "τ",
										Module = "⌠",
										Constructor = "∑",
									}

									local icon = kind_icons[ctx.kind]
									if icon == nil then
										icon = ctx.kind_icon
									end
									return icon
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = "lua" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},
}

-- ~/.config/nvim/lua/plugins/luasnip-snippets.lua
return {
	"L3MON4D3/LuaSnip",
	opts = {
		loaders = {
			lua = {
				paths = { "~/.config/nvim/snippets" },
			},
		},
	},
	config = function(_, opts)
		require("luasnip.loaders.from_lua").lazy_load(opts.loaders.lua)
	end,
}

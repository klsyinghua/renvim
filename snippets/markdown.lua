local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("table3", {
		t({ "| 列1 | 列2 | 列3 |", "| ---- | ---- | ---- |", "| " }),
		i(1, "数据1"),
		t(" | "),
		i(2, "数据2"),
		t(" | "),
		i(3, "数据3"),
		t(" |"),
	}),
}

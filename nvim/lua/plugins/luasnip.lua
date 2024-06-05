local M = {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
  local luasnip = require('luasnip')
	require("luasnip/loaders/from_vscode").lazy_load()
  require("snippets/loader")
end

return M

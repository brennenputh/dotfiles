local ls = require "luasnip"

local languages = {
  "lua"
}

for _, lang in ipairs(languages) do
  ls.add_snippets(lang, require("snippets/" .. lang))
end

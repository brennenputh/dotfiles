local ls = require "luasnip"

local languages = {}

for _, lang in ipairs(languages) do
  ls.add_snippets(lang, require("snippets/" .. lang))
end

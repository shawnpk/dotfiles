local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("co", {
    t("Co-authored-by: "),
    i(1, "Name"),
    t(" <"),
    i(2, "email@company.com"),
    t(">"),
  }),
}

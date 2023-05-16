local status, col = pcall(require, "statuscol")
if (not status) then return end

local builtin = require("statuscol.builtin")
col.setup({
  segments = {
    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
    {
      text = { builtin.lnumfunc, " " },
      condition = { true, builtin.not_empty },
      click = "v:lua.ScLa",
    },
  },
})

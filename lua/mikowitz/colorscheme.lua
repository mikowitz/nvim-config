vim.cmd [[
  " set background=dark
  " colorscheme iceberg
  " colorscheme onedarker
]]

local nightfox = require("nightfox")

nightfox.setup({
  fox = "duskfox",
  transparent = true,
})

nightfox.load()

-- .load("duskfox")

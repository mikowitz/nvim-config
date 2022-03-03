local Terminal = require("toggleterm.terminal").Terminal
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function ToggleTermStrategy(cmd)
  Terminal:new({
    cmd = "clear && " .. cmd,
    size = 20,
    hidden = true,
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    close_on_exit = false
  }):toggle()
end

vim.g['test#custom_strategies'] = { toggle = ToggleTermStrategy }
vim.g['test#strategy'] = "toggle"

map("n", "<leader>tf", ":TestFile<CR>", opts)
map("n", "<leader>ts", ":TestSuite<CR>", opts)
map("n", "<leader>tl", ":TestLast<CR>", opts)
map("n", "<leader>tn", ":TestNearest<CR>", opts)


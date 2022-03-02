local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  direction = "float",
  close_on_exit = true,
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

local iex = Terminal:new({ cmd = "iex", hidden = true})
local mix_test = Terminal:new({
  cmd = "MIX_ENV=test mix test.watch",
  hidden = true,
  size = 40,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end
})

function _IEX_TOGGLE()
  iex:toggle()
end

function _MIX_TEST_TOGGLE()
  mix_test:toggle()
end

local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<leader>i", "<cmd>lua _IEX_TOGGLE()<CR>", opts)
map("n", "<leader>t", "<cmd>lua _MIX_TEST_TOGGLE()<CR>", opts)

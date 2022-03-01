local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<leader>w", ":HopWordMW<CR>", opts)
map("n", "<leader>l", ":HopLineMW<CR>", opts)

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-f>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)

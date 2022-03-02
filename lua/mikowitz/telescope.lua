local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('media_files')

telescope.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "pdf", "jpg", "jpeg"},
      find_cmd = "rg"
    }
  }
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-f>", "<cmd>Telescope git_files<CR>", opts)
map("n", "<C-F>", "<cmd>Telescope find_files<CR>", opts)
map("n", "<C-b>", "<cmd>Telescope buffers<CR>", opts)

vim.g.neoformat_only_msg_on_error = true

vim.cmd [[
  autocmd BufWritePre *.lua Neoformat
  autocmd BufWritePre *.ex,*.exs Neoformat

  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync fromstart
]]

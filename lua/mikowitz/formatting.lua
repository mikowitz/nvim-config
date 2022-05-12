vim.g.neoformat_only_msg_on_error = true

vim.cmd [[
  autocmd BufWritePre *.lua Neoformat
  autocmd BufWritePre *.ex,*.exs Format
  autocmd BufWritePre *.rs Neoformat

  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.eex,*.leex'
  let g:closetag_filetypes = 'html,xhtml,phtml,eelixir'
]]

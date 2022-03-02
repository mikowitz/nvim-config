vim.cmd [[
  hi InactiveWindow guibg=#181818
  hi ActiveWindow guibg=#000000

  function! Handle_Win_Enter()
    setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endfunction

  augroup WindowManagement
    autocmd!
    autocmd BufEnter,WinEnter * call Handle_Win_Enter()
  augroup END
]]

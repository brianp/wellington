" Toggle relative or absolute page line number
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

call AddMapping('numbertoggle', 'map', '<C-n>', ':call NumberToggle()<CR>')

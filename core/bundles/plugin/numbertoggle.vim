" Toggle relative or absolute page line number
function! NumberToggle()
  set relativenumber!
endfunc

call AddMapping('numbertoggle', 'map', '<C-n>', ':call NumberToggle()<CR>')

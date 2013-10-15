" Ack requires ack command
if executable("ack")
  " use default config
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
else
  " Do nothing
endif

" Define <C-F> to a dummy value to see if it would set <C-f> as well.
map <C-F> :dummy

if maparg("<C-f>") == ":dummy"
  " <leader>f on systems where <C-f> == <C-F>
  call AddMapping('ack', 'map', '<leader>f', ':Ack<space>')
else
  " <C-F> if we can still map <C-f> to <S-Down>
  call AddMapping('ack', 'map', '<C-F>', ':Ack<space>')
endif
map <C-f> <S-Down>

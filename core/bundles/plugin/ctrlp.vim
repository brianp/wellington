let g:ctrlp_map = '<c-p>'

" This doesn't have an effect when using ctrlp_user_command belore
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

" Used for faster searching, but ignores:
" - ctrlp_show_hidden
" - ctrlp_custom_ignore
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

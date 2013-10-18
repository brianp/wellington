execute pathogen#infect('bundle/{}', 'lang/{}', 'colors/{}', 'core/{}')

let s:corefile = $HOME . '/.vim/core/core.vim'
if filereadable(s:corefile)
  exec 'source' . s:corefile
endif

function! AddMapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    throw "The arguments to AddMapping() should be <name> <mapping_command> <mapping_keys> <mapping_action> [mapping_action]*"
  endif
  let mapping_command = join(a:000)
  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction

" Colors
set t_Co=256
colorscheme Lucius

" Disable arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" set dollar sign on change
set cpoptions+=$

set clipboard=unnamed

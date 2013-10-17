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

" Brians personal tricks
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set exrc
set secure

set t_Co=256
colorscheme Lucius

set tw=80
set cc=+1  " highlight column after 'textwidth'
set fo-=t " don't wrap
set nowrap
set showbreak=↪
"set sidescroll=5
"set listchars+=precedes:<,extends:>
"
hi ColorColumn ctermbg=0 guibg=Black

" disable arrow keys
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" use jj to exit insert mode
inoremap jj <ESC>

" user crtl direction to move windows
map <C-h> <C-w><C-h>
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-l> <C-w><C-l>

" remove it cause i hate it
"inoremap <S-k>

" auto save on exit insert mode
"au InsertLeave * up

" set dollar sign on change
set cpoptions+=$

set clipboard=unnamed

let g:Powerline_symbols = 'fancy'

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

execute pathogen#infect('bundle/{}', 'lang/{}', 'colors/{}', 'core/{}')

function! AddMapping(name, mapping_command, mapping_keys, ...)
  if len(a:000) < 1
    throw "The arguments to AddMapping() should be <name> <mapping_command> <mapping_keys> <mapping_action> [mapping_action]*"
  endif
  let mapping_command = join(a:000)
  let mapping_list = [a:mapping_command, a:mapping_keys, mapping_command]
  exe join(mapping_list)
endfunction

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

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" NerdTree
let NERDTreeHijackNetrw = 0
call AddMapping('nerdcommenter', 'map', '<leader>/', '<plug>NERDCommenterToggle<CR>')

" Ack
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

" crtlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

" Default mapping, <leader>n
call AddMapping('nerdtree', 'map', '<leader>n', ':NERDTreeToggle<CR> :NERDTreeMirror<CR>')

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

" Brians personal tricks

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

set exrc
set secure

set t_Co=256
colorscheme Lucius

set tw=80
"set cc=+1  " highlight column after 'textwidth'
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

" tips =====================
"
" cf(char) ex cf_ change to underscore
" block insert. crtl+V shift I
" crtl+w +shift HJKL will move to windows directionally
" crtl w + x swap windows

" Test mappings mappings
" nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
" nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
" nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
" nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
" nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
call AddMapping('TestNearest', 'nmap', '<silent> t <C-n>', ':TestNearest<CR>')
call AddMapping('TestFile', 'nmap', '<silent> t <C-f>', ':TestFile<CR>')
call AddMapping('TestSuite', 'nmap', '<silent> t <C-s>', ':TestSuite<CR>')
call AddMapping('TestLast', 'nmap', '<silent> t <C-l>', ':TestLast<CR>')
call AddMapping('TestVisit', 'nmap', '<silent> t <C-g>', ':TestVisit<CR>')

# Wellington
A VIM environment.

Clone the project into your `~/.vim` directory.

`git clone git@github.com:brianp/wellington.git ~/.vim/ -r`

Then symlink the `~/vimrc/` file in your home directory.
`ln -s ~/.vim/vimrc/ ~/.vimrc`

## Colours
The default is an older (Version: 3.1) of the [lucius](https://github.com/jonathanfilip/vim-lucius) colour scheme.
Lucius has been updated past version 3.1 but I like this version more. The colour scheme is set in `vimrc` to easily change the defaults.

## Custom Mappings

### Ale

`Ctrl+k` - Previous linter  
`Ctrl+j` - Next linter

### Line Number Toggle
`<ctrl>n` Toggle relative and absolute line numbers.

### NerdTree
`<leader>n` Toggles the NerdTree drawer.

### Rubocop

`<leader>ru`

### Vim Tests

nearest test - `t Ctrl+n`  
entire file - `t Ctrl+f`  
entire suite - `t Ctrl+s`  
last test - `t Ctrl+l`  

## Plugins
- Ale
- Ctrlp
- GitGutter
- NerdCommenter
- NerdTree
- SnipMate
- Supertab
- Syntastic
- Vim Test
- ZoomWin

## Syntax Highlighting
- CSV
- CoffeeScript
- Clojure
- Elixir
- Git
- GoLang
- HAML
- JavaScript
- LESS
- Markdown
- Minitest
- NodeJS
- Puppet
- RSpec
- Rails
- Ruby
- Rust
- SCSS
- Slim
- Phoenix
- Textile

## Special Thanks
To Carl Lerche and Yehuda Katz for the [janus](https://github.com/carlhuda/janus) bundle.
It is what helped me learn and make VIM my main editor and eventually inspired me to make this project.

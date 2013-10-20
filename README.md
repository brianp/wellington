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

### Line Number Toggle
`<ctrl>n` Toggle relative and absolute line numbers.

### NerdTree
`<leader>n` Toggles the NerdTree drawer.

## Plugins
- Ack
- Ctrlp
- NerdCommenter
- NerdTree
- Syntastic
- ZoomWin
- DetectIndent

## Syntax Highlighting
- CSV
- CoffeeScript
- JavaScript
- NodeJS
- Git
- GoLang
- Pupptet
- HAML
- Slim
- LESS
- SCSS
- Ruby
- Rails
- RSpec
- Minitest
- Markdown
- Textile

## Special Thanks
To Carl Lerche and Yehuda Katz for the [janus](https://github.com/carlhuda/janus) bundle.
It is what helped me learn and make VIM my main editor and eventually inspired me to make this project.

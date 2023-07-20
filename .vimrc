set number relativenumber
syntax on
set clipboard=unnamedplus

set tabstop=4
set shiftwidth=4

let &t_SI = "\e[5 q"
let &t_EI = "\e[0 q"

autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/ set filetype=markdown

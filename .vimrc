syntax on
colorscheme industry
let mapleader = ","

set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set rtp+=/usr/local/opt/fzf

map <Leader>p :Files<CR>
nmap ; :Buffers<CR>
map <Leader>f :Rg<CR>


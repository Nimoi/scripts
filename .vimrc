syntax on
colorscheme industry
let mapleader = ","

" === Plugins ===

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" === Configs ===

" FZF
set rtp+=/usr/local/opt/fzf
map <Leader>p :Files<CR>
nmap ; :Buffers<CR>
map <Leader>f :Rg<CR>

" Misc
set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//

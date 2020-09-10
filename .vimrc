syntax on
colorscheme industry
let mapleader = ","
set nu
set ruler

set smarttab
set expandtab
set shiftwidth=4
set tabstop=4
set listchars=tab:▸\ ,eol:¬
set backspace=indent,eol,start

set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//
set undodir=~/.vim/.undo//

" === Copy between panes ===
" copy to buffer
vmap <Leader>y :w! ~/.vimbuffer<CR>
nmap <Leader>y :.w! ~/.vimbuffer<CR>
" " paste from buffer
map <Leader>p :r ~/.vimbuffer<CR>

" === Plugins ===

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
" Formatting
Plug 'sbdchd/neoformat'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Language Server
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Commentary
Plug 'tpope/vim-commentary'
" Both these just to get JSX comments with Commentary
Plug 'mxw/vim-jsx'
Plug 'suy/vim-context-commentstring'
call plug#end()

" === Configs ===

" Prettier
map <Leader>= :Prettier<CR>

" FZF
set rtp+=/usr/local/opt/fzf
map <C-p> :Files<CR>

" RipGrep
map <C-f> :Rg<CR>

" Emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:jsx_ext_required = 0

autocmd FileType html,css,javascript.jsx EmmetInstall

" === LSP ===

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>rn <plug>(lsp-rename)
	nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

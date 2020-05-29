set  rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
set clipboard=unnamedplus
set number relativenumber
set tabstop=4
set noswapfile
let g:rainbow_active = 1

call plug#begin()
Plug 'preservim/nerdtree' 
"Plug 'wlangstroth/vim-racket'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'jpalardy/vim-slime'
Plug 'oblitum/rainbow'
Plug 'lilydjwg/colorizer'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'Shougo/deoplete.nvim'
	"Plug 'zchee/deoplete-clang'
	"Plug 'tweekmonster/deoplete-clang2'
	Plug 'Shougo/deoplete-clangx'
	Plug 'deoplete-plugins/deoplete-jedi' 
	Plug 'deoplete-plugins/deoplete-zsh'
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" let g:deoplete#enable_at_startup = 1

autocmd filetype python nnoremap <S-F10> :w <bar> exec '!clear && python3.8 '.shellescape('%')<CR>
autocmd filetype c nnoremap <S-F10> :w <bar> exec '!clear && gcc '.shellescape('%').' -o '.shellescape('%:r').' && echo Compilation complete && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <S-F10> :w <bar> exec '!clear && g++ '.shellescape('%').' -o '.shellescape('%:r').' && echo Compilation complete && ./'.shellescape('%:r')<CR>
autocmd filetype sh nnoremap <S-F10> :w <bar> exec '!clear && bash %' <CR>
autocmd filetype racket nnoremap <S-F10> :w <bar> exec '!clear && racket %' <CR>
autocmd filetype tex nnoremap <S-F10> :w <bar> exec '!clear && pdflatex %' <CR>



"binds"
" execute "set <A-1>=\e1"
" execute "set <A-2>=\e2"
" execute "set <A-3>=\e3"
" execute "set <A-4>=\e4"
" execute "set <A-5>=\e5"
" execute "set <A-6>=\e6"
" execute "set <A-7>=\e7"
" execute "set <A-8>=\e8"
" execute "set <A-9>=\e9"
nnoremap <silent> <A-1> :execute 'silent! 1tabn'<CR>
nnoremap <silent> <A-2> :execute 'silent! 2tabn'<CR>
nnoremap <silent> <A-3> :execute 'silent! 3tabn'<CR>
nnoremap <silent> <A-4> :execute 'silent! 4tabn'<CR>
nnoremap <silent> <A-5> :execute 'silent! 5tabn'<CR>
nnoremap <silent> <A-6> :execute 'silent! 6tabn'<CR>
nnoremap <silent> <A-7> :execute 'silent! 7tabn'<CR>
nnoremap <silent> <A-8> :execute 'silent! 8tabn'<CR>
nnoremap <silent> <A-9> :execute 'silent! 9tabn'<CR>

" execute "set <A-h>=\eh"
" execute "set <A-l>=\el"
nnoremap <silent> <A-h> :execute 'silent! tabp'<CR>
nnoremap <silent> <A-l> :execute 'silent! tabn'<CR>
nnoremap <silent> <C-T> :execute 'silent! tabe '<CR>
nnoremap <silent> <C-W> :execute 'silent! q! '<CR>

command Hwc :r ~/Documents/Templates/c

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

map <C-n> :NERDTreeToggle<CR>

syntax enable
set background=dark
colorscheme solarized

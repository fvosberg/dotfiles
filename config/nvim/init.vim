if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if filereadable(expand("~/.config/nvim/bundles.vim"))
	source ~/.config/nvim/bundles.vim
endif

if filereadable(expand("~/.config/nvim/functions.vim"))
	source ~/.config/nvim/functions.vim
endif

set shell=/bin/bash
set nocompatible

filetype plugin on
filetype indent plugin on
syntax on
au BufNewFile,BufRead *.less set filetype=css
au BufRead,BufNewFile *.ts2 set filetype=typoscript
au BufWritePost * silent DockSend
au BufWritePre * :%s/\s\+$//e "remove trailing white spaces on save
au BufWritePre * :%s#\($\n\s*\)\+\%$##e "remove empty lines at EOF
com! Dos2Unix keepjumps call Dos2unixFunction()
au BufReadPost !fugitive://* if &modifiable | keepjumps call Dos2unixFunction() | endif
au BufReadPost !fugitive://* if &modifiable | :%s/$//ge | endif
"au BufReadPost,BufWritePost *.php,*.js,*.css,*.scss Neomake

set cursorline
" status bar setup
set laststatus=2 "show always the status line
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"

command! DockSendPo call DockSendPo()
command! DockSendSass call DockSendSass()
command! Timestamp call InsertCurrentTimestamp()
com! PhpCsFixerFixDirectory call PhpCsFixerFixDirectory()
com! PhpCsFixerFixFile call PhpCsFixerFixFile()

set visualbell "DONT BEEP
set noerrorbells "DONT BEEP

set history=1000 "big brain for commands
set undolevels=1000 "big brain

set number "show line numbers
set hlsearch "highlight searches
set hidden "hide buffers with changes and do not quit them
set wrap "do not wrap lines
set noexpandtab "use tabs for indentation
set tabstop=4 "tabs are n spaces
set autoindent "always autoindent
set shiftwidth=4 "number of spaces used for autoindent
set shiftround "shift only in multiple of shiftwidth
set nolist "dont show whitespace characters
autocmd FileType yaml setlocal ts=4 sw=4 expandtab list
autocmd FileType ruby,slim setlocal ts=2 sw=2 expandtab list
autocmd FileType php setlocal ts=4 sw=4 expandtab list

set backspace=indent,eol,start "allow backspace in insert mode for all
set showmatch "show matching paranthesis
set ignorecase "ignore case when searching
set smartcase " ignore case only when all search letters are lower case
set incsearch "highlight search matches as you type
set wildmenu "show suggestions for command line auto completion
set diffopt+=iwhite "ignore whitespaces in diff
set diffexpr=DiffW()
set wildignore=*.swp "ignore your swps
set wildignorecase " autocomplete buffer names case insensitive
set noswapfile "dont write them at all
set nobackup "use git
set title "set terminals title


let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

""" Mappings
let mapleader=","

" disable highlighting of current search by pressing ,/
nmap <silent> ,/ :nohlsearch<CR>

" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

if has('nvim')
	nmap <BS> <C-W>h
	nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

if &compatible
	set nocompatible
end

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'brettbuddin/docksend-vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'powerline/fonts'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'shime/vim-livedown'
Plug 'pbrisbin/vim-mkdir'
Plug 'benekastah/neomake'
Plug 'tmhedberg/matchit'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc.vim' | Plug 'm2mdas/phpcomplete-extended'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'ervandew/supertab'
Plug 'danro/rename.vim'

" Add plugins to &runtimepath
call plug#end()

" ctrlp
let g:ctrlp_max_files=0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30'
let g:ctrlp_working_path_mode = 0

" powerline
set guifont=Inconsolata\ for\ Powerline:h13
let g:Powerline_symbols = 'fancy'

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" solarized
colorscheme solarized
set background=dark

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case=1

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>" " start on top
let g:SuperTabContextDefaultCompletionType = "<c-n>" " start on top

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" Neomake
let g:neomake_list_height=5
let g:neomake_logfile="/tmp/neomake.log"
let g:neomake_php_phpcs_args_standard='PSR2'

"{{{Auto Commands

" Bootstrap pathogen from bundle (instead of autoload) and active

" runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#infect()

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'pearofducks/ansible-vim'
Plug 'tomasr/molokai'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'google/vim-jsonnet'
Plug 'rodjek/vim-puppet'
Plug 'ervandew/supertab'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'hashivim/vim-terraform'
Plug 'neomake/neomake'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'tpope/vim-abolish'
Plug 'zchee/deoplete-jedi'

call plug#end()

"}}}

"{{{Misc Settings

" Necesary  for lots of cool vim things
set nocompatible

" vim-go mismatch annoyance
let g:go_version_warning = 0

" neovim in virtualenvs
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Set 4 character tab
set shiftwidth=4
set softtabstop=4

" Make backspace work like other apps
set backspace=2

" Enable line numbers
set number relativenumber

" Ignore case to assist with searches
set ignorecase

" Unless we're specifically searching for capital letters
set smartcase

" Search and highlight as we type
set incsearch
set hlsearch

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4

" NERDTree filtering
let NERDTreeIgnore = ['\.pyc$']

" Puppet and YAML files usually use two space indenting
autocmd FileType pp setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" deoplete me
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
call deoplete#custom#option('max_list', 10)

" T E R R A F O R M
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt-=preview

call deoplete#initialize()
let g:syntastic_terraform_tffilter_plan = 1
let g:terraform_completion_keys = 1
let g:terraform_align=1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

"{{{Look and Feel

" Favorite Color Scheme
colorscheme molokai
set background=dark

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Let's highlight undersirable nonsense
set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:- " show tabs and trailing whitespace

" Remove default mode indicator, airline already supplies one
set noshowmode
 

let g:airline_powerline_fonts = 1

" }}}

"{{{ Functions

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"}}}

"{{{ Mappings

" Map two j's to exit insert mode
inoremap jk <Esc>

" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>

" Paste Mode F10
"
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Indent with tab!
nnoremap <S-Tab> >>
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"}}}

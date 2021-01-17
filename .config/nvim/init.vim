set termguicolors
set showcmd
set showmatch
set ruler
set relativenumber
set formatoptions+=o
set textwidth=0
set number
set expandtab
set tabstop=2
set shiftwidth=2
set noerrorbells
set modeline
set nohlsearch
set linespace=0
set nojoinspaces
set guifont=mononoki\ Nerd\ Font\ Mono:h14
set background=dark
set hidden
filetype plugin on
filetype indent on

" More Natural splits
set splitbelow
set splitright

set ignorecase
set smartcase
set gdefault
set magic

set smartindent
set autoindent
set completeopt -=preview
set undodir=~/.nvim/undodir
set undofile

"Set system clipboard as default
set clipboard+=unnamedplus
"""""""""" Custom Keybindings
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"
nnoremap <leader>e :e $MYVIMRC<CR>   "Edit vimrc
nnoremap <leader>s :source $MYVIMRC<cr>
"Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Line navigation
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
"Use buffers instead of tabs
nmap <leader>n :enew<CR>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

let g:python3_host_prog='/usr/bin/python3'
"Terminal stuff
let g:split_term_default_shell = "zsh"
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

"Plugins
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jiangmiao/auto-pairs'
Plug 'vimlab/split-term.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'vlime/vlime'
Plug 'tpope/vim-fugitive'
"Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'dense-analysis/ale'
Plug 'clojure-vim/async-clj-omni'
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }
let g:LanguageClient_serverCommands = {
\ 'rust': ['rls'],
\ 'python': ['/usr/bin/pyls'],
\ 'sh': ['bash-language-server', 'start'],
\ 'ocaml': ['ocamllsp'],
\ }
"Theme Stuff
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Rust
Plug 'rust-lang/rust.vim',{ 'for': 'rust' }
call plug#end()
colorscheme dracula
"Plugin Settings
let g:deoplete#enable_at_startup = 1
let g:airline_powerline_fonts = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

nmap <Leader>gm <Plug>(lcn-menu)
nmap <Leader>gr <Plug>(lcn-rename)
nmap <Leader>gd <Plug>(lcn-definition)
let g:rustfmt_autosave = 1

"Plugin: FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>bl :Buffers<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h :History<CR>

"Plugin: nerdcommenter
let g:NERDCreateDefaultMappings = 1

"Plugin: Nerdtree
nnoremap <Leader>a :NERDTreeToggle<CR>

"Plugin: ale
nmap <silent> <C-e> <Plug>(ale_next_wrap)
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 0
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1

let g:ale_linters = {
\   'ocaml':      ['merlin'],
\}

let g:ale_fixers = {
\   'ocaml':      ['ocamlformat'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

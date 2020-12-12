set termguicolors
set showcmd
set showmatch
set ruler
set relativenumber
set formatoptions+=o
set textwidth=0
set expandtab
set tabstop=2
set shiftwidth=2
set noerrorbells
set modeline
set linespace=0
set nojoinspaces
set guifont=mononoki\ Nerd\ Font\ Mono:h14
set background=dark
set hidden

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

""""""""" Custom Keybindings
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"
nnoremap <leader>e :e $MYVIMRC<CR>   "Edit vimrc
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <esc><esc> :nohlsearch<CR> 
"Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Use buffers instead of tabs
nmap <leader>n :enew<CR>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>a :Fern %:h -drawer -toggle<CR>
let g:python3_host_prog='/usr/bin/python3'
"Terminal stuff
let g:split_term_default_shell = "fish"
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-workspace'
Plug 'lambdalisue/fern.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vimlab/split-term.vim'
"Web Development
Plug 'mattn/emmet-vim'
"Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }
let g:LanguageClient_serverCommands = {
\ 'rust': ['rls'],
\ 'python': ['/usr/bin/pyls']
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
"use TAB as the mapping
inoremap <silent><expr> <TAB>
      \ pumvisible() ?  "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort ""     
  let col = col(.) - 1
  return !col || getline(.)[col - 1]  =~ s
endfunction ""   
inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

nmap <F5> <Plug>(lcn-menu)
autocmd FileType rust nmap <silent>gr <Plug>(lcn-rename)
autocmd FileType rust nnoremap <F8> :Term cargo run<CR>
nmap <silent> gd <Plug>(lcn-definition)
let g:rustfmt_autosave = 1

autocmd FileType python nnoremap <F8> :Term python3 #<CR>

"Plugin: FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>bl :Buffers<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>h :History<CR>

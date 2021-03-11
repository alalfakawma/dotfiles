if has('nvim')
    runtime! plugin/python_setup.vim
endif

" Change settings
set nu rnu
set mouse=a
set encoding=UTF-8
syntax enable
" set cursorline
set noswapfile
set splitright
set splitbelow
set smartindent
set colorcolumn=80
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab 
set shiftround
set smarttab
set ignorecase smartcase
set hls
set backupcopy=yes
set so=5

" Don't show mode 
set noshowmode
set noshowcmd

" COC Vim Settings
" set cmdheight=2
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" CocCommand
noremap <Leader>cc <Esc>:CocCommand<CR>

" CocAction
noremap <Leader>ca <Esc>:CocAction<CR>

" Coc-snippets expand
" inoremap <silent><expr> <C-q> pumvisible() ? coc#_select_confirm() : 
"                                            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc-snippets
let g:coc_snippet_next = '<TAB>'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
noremap <Leader>cd <Esc>:CocDiagnostics<CR>

" Documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Close preview window after completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" COC Extensions
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-css',
    \ ]

" JSON stuff
set conceallevel=1

" Plugins ( Add plugins here )
call plug#begin('~/.vim/plugged')

Plug 'elzr/vim-json'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' 
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'jwalton512/vim-blade'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'vim-test/vim-test'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'

call plug#end()

let g:vim_json_syntax_conceal = 0

" Enable true color
set termguicolors

" Set colorscheme
colorscheme onedark

" Vim-vue fix for some error which can happen which I forgot
autocmd FileType vue syntax sync fromstart

" Save file
noremap <Leader>w <Esc>:w<CR>
inoremap <Leader>w <Esc>:w<CR>

" Quit file
nnoremap <Leader>q <Esc>:q<CR>

" Move line up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove search highlight
nnoremap <C-c> :noh<CR>

" Map C-c to ESC
inoremap <C-c> <Esc>

" Move back and forth buffers
nnoremap <A-h> :bp<return>
nnoremap <A-l> :bn<return>

" Disable Ex mode
map Q <Nop>

" Disable indentline in markdown
autocmd FileType markdown let g:indentLine_enabled=0

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <A-p> :GFiles<CR>
nnoremap <C-l> :GFiles?<CR>
nnoremap <A-k> :Buffer<CR>
nnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>bl :BLines<CR>

" Action maps
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

" Floating layout FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun

" nvimtree
nnoremap <Leader>e :NvimTreeToggle<CR>

" vim-test
let test#php#phpunit#executable = 'php artisan test' " Use artisan

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" fugitive maps
nmap <Leader>gd :Gdiffsplit<CR>
nmap <Leader>gac :Gcommit .<CR>
nmap <Leader>gcf :Gcommit %<CR>
nmap <Leader>gs :Gstatus<CR>

lua <<EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "blade" },
  },
  indent = {
    enable = true,
    disable = { "html" },
  },
}
EOF

" PHP file indent issue fix
au BufNewFile,BufRead,BufReadPost *.php set syntax=php

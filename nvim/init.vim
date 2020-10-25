if has('nvim')
    runtime! plugin/python_setup.vim
endif

" Change settings
set nu rnu
set mouse=a
set encoding=UTF-8
syntax enable
set cursorline
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

" Coc-snippets expand
inoremap <silent><expr> <C-q> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
    \ 'coc-phpls',
    \ 'coc-html',
    \ 'coc-css',
    \ ]

" JSON stuff
set conceallevel=1

" Plugins ( Add plugins here )
call plug#begin('~/.vim/plugged')

Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive' 
Plug 'mxw/vim-jsx'
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
Plug 'gruvbox-community/gruvbox'

call plug#end()
let g:vim_json_syntax_conceal = 0

" Enable true color
set termguicolors

" gruvbox settings
let g:gruvbox_italic = 1

" Set colorscheme
colorscheme gruvbox

" Emmet vim
let g:user_emmet_leader_key='<Leader>'

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
nnoremap <C-p> :GFiles<CR>
nnoremap <A-p> :Files<CR>
nnoremap <C-l> :GFiles?<CR>
nnoremap <A-k> :Buffer<CR>

" Action maps
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

" Floating layout FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Visual multi
let g:VM_quit_after_leaving_insert_mode = 1

fun! VM_Start()
  nmap <buffer> <C-C> <Esc>
  imap <buffer> <C-C> <Esc>
endfun

fun! VM_Exit()
  nunmap <buffer> <C-C>
  iunmap <buffer> <C-C>
endfun

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" for netrw Vertical split open
set equalalways

nnoremap <C-b> :Lexplore<CR>

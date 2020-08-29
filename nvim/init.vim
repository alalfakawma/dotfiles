if has('nvim')
    runtime! plugin/python_setup.vim
endif
" Change settings
set nu rnu
set mouse=a
set encoding=UTF-8
syntax enable
set cursorline
set splitright
set smartindent
set colorcolumn=80
set splitbelow
set tabstop=4 softtabstop=4
set expandtab 
set shiftround
set shiftwidth=4 
set smarttab
set ignorecase smartcase
set hls
set backupcopy=yes

" Don't show mode 
set noshowmode
set noshowcmd

" COC Vim Settings
set cmdheight=2
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
" Coc prettier run save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" JSON stuff
set conceallevel=1

" Plugins ( Add plugins here )
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-commentary'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'jwalton512/vim-blade'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'nanotech/jellybeans.vim'

call plug#end()
let g:vim_json_syntax_conceal = 0

set termguicolors

" Set italics for jellybeans
let g:jellybeans_use_term_italics = 1

" Set colorscheme
colorscheme jellybeans

" Set Airline Theme
let g:airline_powerline_fonts = 1

" Emmet vim
let g:user_emmet_leader_key='<Leader>'

" Vim-vue fix for some error which can happen which I forgot
autocmd FileType vue syntax sync fromstart

" Open Nerdtree automatically when opening vim without specifying a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close Nerdtree if it is the only one opened when you close a file
autocmd bufenter * nested if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open Nerdtree automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Let nerdtree show hidden files
let NERDTreeShowHidden=1

" Toggle Nerdtree
map <C-b> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 0x00151515)
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 0x00151515)
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 0x00151515)
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 0x00151515)
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 0x00151515)
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 0x00151515)
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 0x00151515)
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 0x00151515)

" Save file
noremap <Leader>w <Esc>:w<CR>
inoremap <Leader>w <Esc>:w<CR>

" Quit file
nnoremap <Leader>q <Esc>:q<CR>

" Open Definition in vertical split
map <Leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Move line up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove search highlight
nnoremap <C-c> :noh<return>

" Move back and forth buffers
nnoremap <A-h> :bp<return>
nnoremap <A-l> :bn<return>

" Disable Ex mode
map Q <Nop>

" Disable indentline in markdown
autocmd FileType markdown let g:indentLine_enabled=0
let NERDTreeHijackNetrw=1

" FZF
nnoremap <C-p> :GFiles<CR>
nnoremap <A-p> :Files<CR>
nnoremap <C-l> :GFiles?<CR>
nnoremap <A-k> :Buffer<CR>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

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

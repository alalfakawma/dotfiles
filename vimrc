" Change settings
set rnu
set mouse=a
set encoding=UTF-8
set t_Co=256
syntax enable
set splitright
set smartindent
set splitbelow
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab
set nuw=5
set tags=.tags,tags
set hls
set backupcopy=yes
highlight LineNr term=bold cterm=NONE ctermfg=255 ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr term=bold cterm=bold ctermbg=234 ctermfg=255 gui=bold guifg=DarkGrey guibg=red

" Match brackets
hi MatchParen cterm=bold ctermbg=white ctermfg=black

" Set leader key
" let mapleader = "<,>"

" Open Terminal
noremap <Leader>t <Esc>:terminal<CR>
inoremap <Leader>t <Esc>:terminal<CR>

" Cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE guibg=Grey20

" Plugins ( Add plugins here )
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
Plug 'terryma/vim-multiple-cursors'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'craigemery/vim-autotag'
Plug 'cakebaker/scss-syntax.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'jaredgorski/spacecamp'
Plug 'jwalton512/vim-blade'
Plug 'Yggdroot/indentLine'

call plug#end()

" Set colorscheme
colorscheme spacecamp

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

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" CtrlP Ignore files in gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Powerline
set rtp+=/home/aseem/.local/lib/python3.7/site-packages/powerline/bindings/vim/
set laststatus=2
set noshowmode

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-q>"

" PHP namespace Import files
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

let g:php_namespace_sort_after_insert = 1

" PHP namespace Expand class
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" Autotags
let g:autotagmaxTagsFileSize=10
let g:autotagTagsFile=".tags"

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
" Disabled insert mode for digraphs
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove search highlight
nnoremap <C-c> :noh<return><C-c>

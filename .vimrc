"----------------------------------------------------
" vim-plug
"----------------------------------------------------
" filetype off                  " required
" filetype plugin indent off    " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mileszs/ack.vim'
Plug 'jwalton512/vim-blade'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'tomlion/vim-solidity'
Plug 'digitaltoad/vim-pug'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'ruanyl/vim-gh-line'

" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim', {'commit': '6d3bb828acdeaea75e061a3a7579aaaa8f635f8c'}
Plug 'MaxMEllon/vim-jsx-pretty', {
  \ 'for': 'typescript',
  \ 'autoload': {
  \   'filetypes': ['typescriptreact', 'typescript', 'javascript']
  \ }}
" Plug 'jparise/vim-graphql'
Plug 'acro5piano/vim-graphql'
Plug 'flowtype/vim-flow'
" Plug 'styled-components/vim-styled-components', {
"   \ 'branch': 'main',
"   \ 'for': 'typescript',
"   \ 'autoload': {
"   \   'filetypes': ['javascript.jsx', 'javascript']
"   \ }}
Plug 'acro5piano/import-js-from-history'
Plug 'acro5piano/vim-jsx-replace-tag'
" Plug '~/ghq/github.com/acro5piano/learn-vim-rpc-node', { 'do': 'npm install' }
" Plug '~/ghq/github.com/acro5piano/jsx-autoedit'


if has('nvim')
    Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    Plug 'prettier/vim-prettier'
    Plug 'w0rp/ale'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'wokalski/autocomplete-flow'
  " Plug 'autozimu/LanguageClient-neovim', {
  "     \ 'branch': 'next',
  "     \ 'do': 'bash install.sh',
  "     \ }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0

" deoplete
let g:deoplete#enable_at_startup = 1

" Yggdroot/indentLine
let g:indentLine_color_term = 5

let g:jsx_ext_required = 0

" anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" set statusline=%{anzu#search_status()}

" source ~/.vim/neocomplete.config.vim

"----------------------------------------------------
" Asynchronous Lint Engine (ALE)
"----------------------------------------------------
if has('nvim')
    " Limit linters used for JavaScript.
    " let g:ale_linters = {
    " \  'javascript': ['flow', 'eslint'],
    " \  'typescript': ['typescript', 'tslint'],
    " \  'python': ['flake8', 'mypy'],
    " \  'ruby': ['ruby', 'rubocop', 'rails_best_practices', 'reek', 'brakeman']
    " \}
    let g:ale_linters = {
        \ 'go': ['govet', 'gofmt', 'gobuild'],
    \}

    " Not work with nvim-typescript.
    let g:nvim_typescript#diagnostics_enable = 0
    let g:ale_completion_enabled = 0
    let g:ale_linter_aliases = {'typescriptreact': 'typescript', 'typescript': 'typescript', 'tsx': 'typescript'}
    let g:ale_ruby_rubocop_executable = 'bundle'

    let g:ale_set_highlights = 0
    highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
    highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
    let g:ale_sign_error = 'X' " could use emoji
    let g:ale_sign_warning = '?' " could use emoji
    let g:ale_statusline_format = ['X %d', '? %d', '']
    " %linter% is the name of the linter that provided the message
    " %s is the error or warning message
    let g:ale_echo_msg_format = '%linter% says %s'
    let g:ale_lint_delay = 700
    " Map keys to navigate between lines with errors and warnings.

    let g:ale_python_flake8_executable = $PWD . 'bin/flake8'
endif

"----------------------------------------------------
" Flow
"----------------------------------------------------
if has('nvim')
    " Use locally installed flow
    let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
    if matchstr(local_flow, "^\/\\w") == ''
        let local_flow= getcwd() . "/" . local_flow
    endif
    if executable(local_flow)
      let g:flow#flowpath = getcwd() . "/node_modules/.bin/flow"
    endif
    let g:flow#showquickfix = 0
    let g:flow#enable = 0

    let g:javascript_plugin_flow = 1

    " autocomplete-flow does this feature
    let g:flow#omnifunc = 0
    let g:autocomplete_flow#insert_paren_after_function = 0
endif

"----------------------------------------------------
" Charcode
"----------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileformats=unix,dos,mac

"----------------------------------------------------
" Backup
"----------------------------------------------------
set nobackup
set writebackup
set directory=/tmp

"----------------------------------------------------
" Search
"----------------------------------------------------
set history=100
set ignorecase
set smartcase
set wrapscan

let g:ackprg = 'rg --vimgrep --smart-case'

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map z/ <Plug>(incsearch-stay)
vmap *  <Plug>(asterisk-g*)

"----------------------------------------------------
" Face
"----------------------------------------------------
autocmd FileType vue syntax sync fromstart
set title
set laststatus=2
set showmatch
set hlsearch
set wildmenu

syntax on
if expand('%') == '.flowconfig'
    set filetype=lisp
endif

set textwidth=0
set nowrap

" Show Full width
match Todo /　/

set t_Co=256

colorscheme elflord

" left のふたつ目が設定できないのできもいけどこれで。
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [
    \     [ 'readonly', 'filename', 'modified' ]
    \   ]
    \ },
    \ }

set breakindent

"----------------------------------------------------
" Indent
"----------------------------------------------------
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
filetype indent on


"----------------------------------------------------
" Using X11
"----------------------------------------------------

autocmd InsertLeave * call system('fcitx-remote -c')

" Clipboard paste
nnoremap <Space>pb :.!clp<CR>
map <C-c> :w !cl<CR><CR>

"----------------------------------------------------
" Code autocomplete
"----------------------------------------------------

inoremap {<CR> {<CR>}<Up><End><CR>
inoremap ({<CR> ({<CR>})<Up><End><CR>
inoremap z. =>
inoremap zc console.log()<Left>
inoremap zl ->
inoremap zp extract(\Psy\Shell::debug(get_defined_vars()));
" autocmd FileType xml,html inoremap </ </<C-x><C-o>
inoremap zd <C-r>=strftime("%Y-%m-%d")<CR><Space>
inoremap zt <C-r>=strftime("%H:%M")<CR><Space>
inoremap z[ from IPython import embed; embed()

"----------------------------------------------------
" Remap keys
"----------------------------------------------------

tnoremap <silent> <C-g> <C-\><C-n>

inoremap <S-TAB> <C-d>
inoremap <TAB> <C-t>

" Emacs-like key binding
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<CR>

" キーワード補完には <C-x> <C-n> を使う
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <Down> <C-n>
inoremap <Up> <C-p>

inoremap <C-k> <C-o>:call setline(line('.'), col('.') == 1 ? '' : getline('.')[:col('.') - 2])<CR>


" like Spacemacs
let mapleader = "\<Space>"
nnoremap j gj
nnoremap k gk
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
nnoremap <Leader><Leader> :<C-p><HOME>
nnoremap <Leader>aj :ALEGoToDefinition<CR>
nnoremap <Leader>aw :Ack <C-r><C-w>
nnoremap <Leader>aa :Ack<Space>
nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>ag :Rg <C-r><C-w><CR>
nnoremap <Leader>rt :JSXReplaceTag<CR>
nnoremap <Leader>tj :TSDef<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>
nnoremap <Leader>aj :ALEGoToDefinition<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bp\|bd #<CR>
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>bs :BLines <C-R><C-W><CR>
nnoremap <Leader>fr :FZFMru<CR>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>gb :GitBlame<CR>
nnoremap <Leader>mm :Marks<CR>
nnoremap <Leader>ij :ImportJs<CR>
nnoremap <Leader>q! :qa!<CR>
nnoremap <Leader>qq :qa<CR>
nnoremap <Leader>fj :FlowJumpToDef<CR>
nnoremap <Leader>gj :GoDef<CR>
nnoremap <Leader>rr :OverCommandLine<CR>%s/
nnoremap <Leader>rl :OverCommandLine<CR>s/
nnoremap <Leader>t- :new<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>tt :call fzf#vim#tags(expand('<cword>'))<CR><HOME>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>wm <C-w><C-w>:q<CR>
nnoremap <Leader>w- :new<CR><C-w><C-w>
nnoremap <Leader>w/ :vs<CR>
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wo <C-w><C-w>
nnoremap <Leader>jd :NERDTreeFind<CR>
nnoremap <Leader>/ :TComment<CR>

vnoremap <Leader>/ :TComment<CR>
vnoremap <Leader>jq :!jq --monochrome-output .<CR>


nnoremap <ESC><ESC> :nohl<CR>

nmap <F1> <ESC>
imap <F1> <ESC>
vmap <F1> <ESC>

" FZF customization
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>),
  \    1,
  \   { 'options': '--exact' })

"--------------
" Git
"--------------
function! s:git_blame()
    let fileName = '/tmp/__git_blame.'.expand('%:t')
    call system('git blame '.expand('%').' > '.fileName)
    :exe ':e '.fileName
endfunction
command! GitBlame call s:git_blame()

"---------------------------------------------------
" Others
"----------------------------------------------------
set nocompatible
set vb t_vb= " do not beep
set hidden " not discard undo after buffers were killed
" set ambiwidth=double " for full width problem
set ttimeoutlen=1 " fast move
set modeline

" set undofile
" set undodir=/tmp
" au BufWritePre /tmp/* setlocal noundofile

autocmd BufWritePre * :%s/\s\+$//e " remove trairing whitespace on save

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.graphql,*.md,*.vue Prettier

" remember cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

autocmd FileType vue syntax sync fromstart

set backspace=indent,eol,start

set showcmd

function! Yapf()
    let l:curPos = getpos('.')
    call cursor(1, 1)
    silent execute "0,$!yapf"
    if v:shell_error != 0
        silent undo
    end
    call cursor(l:curPos[1], l:curPos[2])
endfunction
autocmd BufWritePre *.py call Yapf()

" function! Rubocop()
"     let l:curPos = getpos('.')
"     call cursor(1, 1)
"     silent execute "0,$!bundle exec rubocop -a --stdin -"
"     " if v:shell_error != 0
"     "     silent undo
"     " end
"     call cursor(l:curPos[1], l:curPos[2])
" endfunction
" autocmd BufWritePre *.rb call Rubocop()
command! Rubocop !bundle exec rubocop -a %

command! TSLint !yarn tslint --fix %
command! ESLint !yarn eslint --fix %

command! VSCode !code %
command! VSCodeDir !code %:p:h
filetype plugin on

" for css completion
" we use omnifunc now
" nnoremap <Leader>cs :set ft=css<CR>
" nnoremap <Leader>ts :set ft=typescriptreact<CR>

autocmd FileType typescript,typescriptreact,javascript,javascript.jsx,jsx,tsx setlocal omnifunc=csscomplete#CompleteCSS

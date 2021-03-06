"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif


let g:rc_dir = expand('~/.vim/rc')
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:toml = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" Add or remove your plugins here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


"-------------------------
"基本設定
"-------------------------
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['typescript']}

"Disable Swap, Backup
set nowritebackup
set nobackup
set noswapfile

"編集モード時にコロンとセミコロンを逆に
nnoremap ; :
nnoremap : ;

"Escapeのマッピング
inoremap <silent> jj <esc>
inoremap <silent> kk <esc>

"表示上の行移動と実際の行移動を入れ替え
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap ZQ <Nop>

"ステータスラインを表示
set laststatus=2

"クリップボード
set clipboard=unnamed,autoselect

"検索時のハイライトなし
set nohlsearch

"行番号のハイライト
set cursorline

"色関係
colorscheme hybrid
autocmd ColorScheme * highlight LineNr ctermfg=242
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight Number ctermfg=134
highlight StatusLine term=bold,reverse cterm=reverse ctermfg=gray ctermbg=blue
"highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

"行数表示 
set number

"コマンドラインでTABで補完できるようにする
set wildchar=<Tab>

"タグジャンプ"
set tags=./tags
"------Search------
"インクリメンタルサーチを有効にする
set incsearch

"大文字小文字を区別しない
set ignorecase

"大文字で検索されたら対象を大文字限定にする
set smartcase

"------Edit--------
"挿入モードでのカーソル移動
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

"オートインデントの切り替え"
map <F1> <nop>
set pastetoggle=<F1>

" タブ入力を複数の空白入力に置き換える
set expandtab

"タブの幅指定
set tabstop=2

"自動インデントの幅
set shiftwidth=2

"連続する空白に対してタブやバックスペースでカーソルが動く幅
set softtabstop=2

"改行時にインデント継続
set autoindent

"バックスペースに対して行頭と行末を連結"
set backspace=indent,eol,start

" 色の設定 "
"-----------------------------
" 全角スペースの表示
"-----------------------------
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
 augroup ZenkakuSpace
   autocmd!
     autocmd ColorScheme * call ZenkakuSpace()
     autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
   augroup END
   call ZenkakuSpace()
endif
"""""""""""""""""""""""""""""""

"------------------------------
" 挿入モード時、ステータスラインの色を変更
"------------------------------
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""""

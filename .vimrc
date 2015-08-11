filetype plugin indent off
"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
" set runtimepath+=~/.vim/bundle/neobundle.vim/
if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"-------------------
" 追加のプラグイン
"-------------------
" 自動で括弧を閉じる
NeoBundle 'Townk/vim-autoclose'
"式の評価
NeoBundle 'thinca/vim-quickrun'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
 
"\cでコメントアウトと解除
NeoBundle 'tyru/caw.vim.git'
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

"補完の強化"
NeoBundle "Shougo/neocomplete.vim"
let g:neocomplete#enable_at_startup=1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Pythonの補完"
NeoBundleLazy "davidhalter/jedi-vim"
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = "<leader>R"
let g:jedi#popup_on_dot = 1

"CPP関連"
NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }

"HTML"
NeoBundle 'mattn/emmet-vim'
"JavaScript"
NeoBundleLazy 'jiangmiao/simple-javascript-indenter',{
  \ 'autoload' : {'filetypes' : 'js'}
  \ }
  " この設定入れるとshiftwidthを1にしてインデントしてくれる
  let g:SimpleJsIndenter_BriefMode = 2
  " この設定入れるとswitchのインデントがいくらかマシに
  let g:SimpleJsIndenter_CaseIndentLevel = -1
NeoBundleLazy 'jelera/vim-javascript-syntax',{
  \ 'autoload' : {'filetypes': 'js'}
  \ }
"-------------------
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、設定は任意。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

"-------------------------
"基本設定
"-------------------------
"編集モード時にコロンとセミコロンを逆に
nnoremap ; :
nnoremap : ;

inoremap jk <esc>
inoremap kj <esc>

"ステータスラインを表示
set laststatus=2

"検索時のハイライトなし
set nohlsearch

"行番号のハイライト
set cursorline

"色関係
autocmd ColorScheme * highlight LineNr ctermfg=242
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on
highlight Normal ctermbg=black ctermfg=grey
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

"色の設定 "
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

"-------------------------
"基本設定
"-------------------------

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

"ステータスラインを表示
set laststatus=2

"行数表示 
set number

"コマンドラインでTABで補完できるようにする
set wildchar=<Tab>

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

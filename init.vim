"" dein.vim
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shogo/neosnippet.vim')
  call dein#add('Shogo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('Yggdroot/indentLine')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
" if dein#check_install()
"   call dein#install()
" endif

"" defx.nvim
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>      defx#do_action('open')
  nnoremap <silent><buffer><expr> c         defx#do_action('copy')
  nnoremap <silent><buffer><expr> m         defx#do_action('move')
  nnoremap <silent><buffer><expr> p         defx#do_action('paste')
  nnoremap <silent><buffer><expr> l         defx#do_action('open')
  nnoremap <silent><buffer><expr> E         defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P         defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o         defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K         defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N         defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M         defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C         defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S         defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d         defx#do_action('remove')
  nnoremap <silent><buffer><expr> r         defx#do_action('rename')
  nnoremap <silent><buffer><expr> !         defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x         defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy        defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .         defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;         defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h         defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~         defx#do_action('cd')
  nnoremap <silent><buffer><expr> q         defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>   defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *         defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j         line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k         line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>     defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>     defx#do_action('print')
  nnoremap <silent><buffer><expr> cd        defx#do_action('change_vim_cwd')
endfunction

"" denite.nvim
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>      denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d         denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p         denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q         denite#do_map('quit')
  nnoremap <silent><buffer><expr> i         denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>   denite#do_map('toggle_select').'j'
endfunction

"" vim-airline
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab       " 左にタブ移動する
nmap <C-n> <Plug>AirlineSelectNextTab       " 右にタブ移動する
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {'0': '0 ', '1': '1 ', '2': '2 ', '3': '3 ', '4': '4 ', '5': '5 ', '6': '6 ', '7': '7 ', '8': '8 ', '9': '9 '}

"" Python
let g:python_host_prog  = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

"" キーマップ
inoremap <silent> jj <ESC>             " <ESC>でノーマルモードに変更する
nnoremap j gj                          " 表示行単位で上下移動する
nnoremap k gk
nmap <Esc><Esc> :nohlsearch<CR><Esc>   " <ESC><ESC>で検索を解除する

"" 設定
syntax enable                          " 構文をハイライトする
set fenc=utf-8                         " デフォルトエンコードをUTF-8とする
set nobackup                           " バックアップファイルを作成しない
set noswapfile                         " スワップファイルを作成しない
set autoread                           " ファイルの変更を自動で読み込む
set hidden                             " 編集中に別のファイルを開くことができる
set showcmd                            " 入力中のコマンドを表示する
set number                             " 行番号を表示する
set cursorline                         " カーソル行をハイライトする
" set cursorcolumn                       " カーソル列をハイライトする
set virtualedit=onemore                " カーソルを行末の一つ先まで移動させることができる
set smartindent                        " C言語ライクにインデントする
set visualbell                         " ビープ音を視覚化する
set showmatch                          " 対応する括弧をハイライトする
set laststatus=2                       " 常にステータスラインを表示する
set wildmode=list:longest              " 補完でマッチした全てを表示する
set list listchars=tab:\▸\-            " <TAB>を視覚化する
set expandtab                          " <TAB>の代わりに<SPACE>を挿入する
set tabstop=2                          " <TAB>幅を<SPACE>2文字とする
set shiftwidth=2                       "インデント幅を<SPACE>2文字とする
set ignorecase                         " 検索で大文字と小文字を区別しない
set smartcase                          " 検索で大文字と小文字が混在している場合に区別する
set incsearch                          " インクリメンタルサーチする
set wrapscan                           " 検索で最後尾に到達した場合に先頭に戻る
set hlsearch                           " 検索文字列をハイライトする

syntax on
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
Bundle 'octave.vim'
Bundle 'matchit.zip'
Bundle 'python.vim'
"autoclose
Bundle 'Townk/vim-autoclose'
"autocomplete
Bundle 'Shougo/neocomplcache.vim'
"commenter
Bundle 'scrooloose/nerdcommenter'
" The bundles you install will be listed ere
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'jistr/vim-nerdtree-tabs'
filetype plugin indent on

filetype plugin on

" The rest of your config follows here

" NerdTree

" Python Mode
" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
"run python
let g:pymode_run_key = '<F5>'

let g:pymode_rope = 0
" " Documentation
 let g:pymode_doc = 1
 let g:pymode_doc_key = '<S-k>'
"
" "Linting
 let g:pymode_lint = 1
 let g:pymode_lint_checker = "pyflakes,pep8"
 let g:pymode_lint_ignore = "E501,E401,E111,E302,W0401"
 let g:pymode_lint_message = 0
" " Auto check on save
 let g:pymode_lint_write = 1
"
" " Support virtualenv
 let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
 let g:pymode_breakpoint = 1
 let g:pymode_breakpoint_key = '<C-b>'
"
" " syntax highlighting
 let g:pymode_syntax = 1
 let g:pymode_syntax_all = 1
 let g:pymode_syntax_indent_errors = g:pymode_syntax_all
 let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code
 let g:pymode_folding = 0

"powerline的设置
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'


 "其他设置
 autocmd FileType python setlocal et sta sw=4 sts=4
 autocmd FileType python setlocal foldmethod=indent
 "默认展开所有代码
set foldlevel=99
set ruler
"在状态栏显示正在输入的命令
set showcmd
"显示行号：
set number 
"鼠标可用
set mouse=a
"高亮搜索
set hlsearch
"折行显示
highlight Search ctermbg=19
highlight Pmenu ctermbg=00
highlight PmenuSel ctermbg=10
"auto change dir
set acd

set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F12>

nmap <F2> <esc>:q<cr>
nmap <F3> <esc>:w<cr>
imap <F3> <esc>:w<cr>
imap <F2> <esc>:q<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"tag文件
map <F9> :!ctags -R<cr>
imap <F9> <esc>:ctags -R<cr>
"进入vim启动NerdTree
let g:nerdtree_tabs_open_on_console_startup=1 
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=22

"taglist
let Tlist_Show_One_File = 1            "只显示当前文件的tag
let Tlist_Exit_OnlyWindow = 1     "如果taglist窗口是最后一个窗口，则退出
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open = 1            "自动打开
let Tlist_WinWidth = 20            "设定宽度
nmap <leader>t :Tlist<cr>

"octave
autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

"matchit
runtime macros/matchit.vim
let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
autocmd FileType octave let b:match_words = '\<if\>\|\<while\>\|\<for\>\|\<switch\>:' .
       \ s:conditionalEnd . ',\<if\>:\<elseif\>:\<else\>:' . s:conditionalEnd




"""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动补全
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

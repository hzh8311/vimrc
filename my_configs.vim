" vim: foldmethod=marker
filetype plugin on
syntax enable
" => functions{{{1

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

"C,C++的调试
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
"}}}

" => configuration{{{1

set textwidth=120
set clipboard+=unnamed 
set nobackup
set nu
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set mouse=a 
set selection=exclusive
set selectmode=mouse,key
let NERDTreeWinPos="left"
set foldmethod=syntax
set nofoldenable
" session配置
let g:session_autosave="yes"
let g:session_autoload="yes"
" airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = '%{strftime("%m/%d/%Y %a %H:%M")}'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let airline_theme = 'base16_monokai'
" set bg=dark
colorscheme monokai
set guifont=Source\ Code\ Pro\ 13
" gitgutter是一款git插件

"vim-latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='pdflatex'
" Commentary
vmap <C-\> :Commentary<cr>
map <C-\> :Commentary<cr>

" }}}

" => keybings{{{1
" map ; :
" 解决ultisnips和ycm的冲突
" 使用supertab来解决snippet和youcompleteMe按键冲突问题。snippet改为使用ctrl + n选择，使用tab展开
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ycm 全局配置
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_cpp.py'
"保留原来的ctags
let g:ycm_collect_identifiers_from_tag_files = 1  
" F-keybings
" C，C++ 按F5编译运行
map <silent><F2> :NERDTreeToggle<CR>
map <silent><F3> :TagbarToggle<CR>
map <silent><F5> :call CompileRunGcc()<CR>
map <silent><F8> :call Rungdb()<CR>
" cscope
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<cr><cr> 
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>i :cs find i <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<cr><cr>
" 括号自动补全
:inoremap <silent> } <c-r>=ClosePair('}')<CR>
:inoremap <silent> ] <c-r>=ClosePair(']')<CR>
:inoremap <silent> > <c-r>=ClosePair('>')<CR>
:inoremap <silent> ) <c-r>=ClosePair(')')<CR>

inoremap <C-s> <ESC>:w!<cr>i
" 行首行末
map <C-a> <Home>
map! <C-a> <Home>
map <C-e> <End>
map! <C-e> <End>
" leader
map <silent><leader>bn :bn<CR>
map <slient><leader>bp :bp<cr>
map <leader>bd :bdelete<CR>
map <silent><leader>tg :!ctags -R .<CR>
map <silent><leader>so :source ~/.vimrc<CR>
map <silent><leader>tt :tabnext<CR>
map <silent><leader>ycm :YcmGenerateConfig
" 有道词典
vnoremap <silent> <leader>oy :<C-u>Ydv<CR>
nnoremap <silent> <leader>oy :<C-u>Ydc<CR>
"noremap <leader>oy :<C-u>Yde<CR>

" <leader> t + .. means toggle
map <leader>ts :SyntasticToggleMode<cr>
map <slient><leader><enter> :noh<cr>

if exists('$TMUX')
    set term=screen-256color
endif

set relativenumber

"C，C++ 按F5编译运行

map <F5> :call CompileRunGcc()<CR>
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
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

" 设置每行的字符数不超过80,否则自动换行   古老传统
set textwidth=120

set clipboard+=unnamed 
set nobackup
set nu
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set mouse=a 
set selection=exclusive
set selectmode=mouse,key
nmap <silent><F3> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <slient> <leader>bn :bn<CR>
let NERDTreeWinPos="left"
nmap <silent><leader>t :!ctags -R .<CR>
nmap <silent><leader>s :source %<CR>

" 代码折叠
set foldmethod=syntax
set nofoldenable

"session配置
let g:session_autosave="yes"
let g:session_autoload="yes"

"tab"
nmap <silent> <leader>tt :tabnext<CR>

let g:airline_extensions_tabline_enabled = 1
let g:airline_extensions_tabline_left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

nmap <silent> <leader>bn :bn<CR>

" 括号自动不全
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap C-s <ESC>:w!
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
syntax enable

""set bg=dark
""colorscheme solarized
set guifont=Source\ Code\ Pro\ 12

" gitgutter是一款git插件

"vim-latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

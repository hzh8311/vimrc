"C，C++ 按F5编译运行
filetype plugin on
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = '%{strftime("%c")}'
let g:airline_section_b = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let airline_theme = 'base16_monokai'

nmap <silent> <leader>bn :bn<CR>

" 括号自动不全
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap <C-s> <ESC>:w!<cr>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
syntax enable

""set bg=dark
colorscheme monokai
set guifont=Source\ Code\ Pro\ 13

" gitgutter是一款git插件

"vim-latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

noremap <leader>bd :bdelete<CR>
noremap <C-a> 0
map ; :
map! <C-a> <C-o>0
map! <C-e> <C-o>$
map <C-e> $
map <leader>ycm :YcmGenerateConfig
" NerdCommenter
" leader c + '-'

""""""""""""""""""""""""""""""""""""""""
" cscope setting
" """"""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
""""""""""""""""""""""""""""""""""""""""""""
"key binding"
"s C语言符号
"g ctags
"d 调用的函数
"c 调用自己的函数
"t 字符串
"e egrep
"f 文件
"i 包含此文件的文
"s C语言符号
"g ctags
"d 调用的函数
"c 调用自己的函数
"t 字符串
"e egrep
"f 文件
"i 包含此文件的文
"s C语言符号
"g ctags
"d 调用的函数
"c 调用自己的函数
"t 字符串
"e egrep
"f 文件
"i 包含此文件的文件件件
""""""""""""""""""""""""""""""""""""""""""""
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<cr><cr> 
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>i :cs find i <C-R>=expand("<cword>")<cr><cr>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<cr><cr>

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

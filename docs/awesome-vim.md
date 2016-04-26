# 与插件有关的快捷键

## 打开buffer窗口管理当前buffer窗口:
map <leader>o :BufExplorer<cr>

## 打开MRU.vim查看最近文件:
map <leader>f :MRU<CR>

## 打开ctrlp.vim插件:
let g:ctrlp_map = '<c-f>'

## 打开PeepOpen插件:
map <leader>j :PeepOpen<cr>

## 打开NERD Tree插件:
map <F2> :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

## goyo.vim and vim-zenroom2打造一个纯净模式.. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping.
map <leader>z :Goyo<cr>

# Normal模式快捷键

## 快速保存一个buffer:
nmap <leader>w :w!<cr>

## Treat long lines as break lines (useful when moving around in them):
map j gj
map k gk

## Map <Space> to / (search) and <Ctrl>+<Space> to ? (backwards search):
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

## 取消高亮<leader><cr>:
map <silent> <leader><cr> :noh<cr>

## 窗口间移动:
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

## 关闭当前buffer:
map <leader>bd :Bclose<cr>

## Close all buffers
map <leader>ba :1,1000 bd!<cr>

## 管理tabs:
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>关闭除当前tab外的所有tab
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <silent> <leader>tt :tabnext<CR>

## 打开一个与当前buffer路径一致的新tab
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

## 将当前路径改为与buffer路径一致:
map <leader>cd :cd %:p:h<cr>:pwd<cr>

## 打开vimgrep以及把光标放在正确的位置:
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

## 在当前文件Vimgreps:
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

## Remove the Windows ^M - when the encodings gets messed up:
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

## 打开一个草稿buffer:
map <leader>q :e ~/buffer<cr>

## Toggle paste mode on and off:(粘贴模式)
map <leader>pp :setlocal paste!<cr>

# Insert模式快捷键

## 快速插入各种括号(如果想输入$1,按下$后等待一小会再按1):
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

## 输入xdate按回车插入当前时间:
iab 20/04/16 09:05:14 <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
 
# Visual模式快捷键
     
## Visual mode pressing * or # searches for the current selection:
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
     
## 选定文本后按下gv you vimgrep:
vnoremap <silent> gv :call VisualSelection('gv')<CR>
     
## 按下<leader>r 可以查找并替换选中的文本(全局):
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
     
## 在选中的文本两边加上各种括号:
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
     
# 命令行快捷键
     
## is super useful when browsing on the command line. It deletes everything until the last slash:
cno ' <C-\>eDeleteTillSlash()<cr>
     
## Bash like keys for the command line:
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
     
## sudo方式写文件 (only on Unix). Super useful when you open a file and you don't have permissions to save your changes. Vim tip:
:W 

# 拼写检查(开关)

## <leader>ss
map <leader>ss :setlocal spell!<cr>
     
## Shortcuts using <leader> instead of special chars
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
     
# Cope
     
Do :help cope if you are unsure what cope is. It's super useful!
When you search with vimgrep, display your results in cope by doing: <leader>cc
To go to the next search result do: `<leader>n`
To go to the previous search result do: `<leader>p`

## vimsrcipt快捷键

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:  tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

gf : go to file under cursor


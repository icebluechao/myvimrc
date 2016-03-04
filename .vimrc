"================================================================
"如果去掉这一行,默认值set mouse=a就生效了,这时不能用鼠标选中复制.
"================================================================
set mouse=v

"================================================================
"Line number
"================================================================
set number

"================================================================
"tab indent
"================================================================
set shiftwidth =4
set softtabstop=4
set tabstop=4

"================================================================
"将Tab替换为空格
"================================================================
"set expandtab
"set smarttab
"retab

"================================================================
"与系统剪贴板共享
"================================================================
set clipboard+=unnamed

"================================================================
"不在单词中间断行
"================================================================
set linebreak

"================================================================
"允许汉字断行
"================================================================
set fo+=mB
 
"================================================================
"显示括号配对情况
"================================================================
set showmatch
 
"================================================================
"使用VIM不兼容模式
"================================================================
set nocompatible

"================================================================
"不使用 selectmode。
"================================================================
set selectmode=
 
"================================================================
"使用“Shift + 方向键”选择文本
"================================================================
set keymodel=startsel,stopsel

"================================================================
"自动折行
"================================================================
set wrap

"================================================================
"Encoding setting
"================================================================
language message en_US.UTF-8
set helplang=cn
set ambiwidth=double
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"================================================================
"Autoindent
"打开普通文件类型的自动缩进。 该自动缩进不如 cindent 智能， 但它可以为你编辑非C/C++ 文件提供一定帮助。
"================================================================
set autoindent 
set cindent

"================================================================
"Foldmethod
"================================================================
set fdm=marker
"set fdm=syntax
 
set foldenable
set foldmethod=manual
set foldlevel=1

"================================================================
"Highlight search string
"搜索时高亮显示被找到的文本
"================================================================
set hlsearch

"================================================================
"Highlight
"================================================================
syntax enable
syntax on

"colorscheme molokai
colorscheme desert

"================================================================
"光标到底部和顶部时保持5行距离
"================================================================
set scrolloff=5
 
"================================================================
" keep 1500 lines of command line history
"================================================================
set history=1500

"================================================================
"命令行高度为2
"================================================================
set      cmdheight=2
 
"================================================================
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来。
"================================================================
set      wildmenu

"================================================================
" ctags在当前目录找不到tags文件就向父目录找
"================================================================
set      tags=tags;

"================================================================
"打开文件时自动到达上次浏览时的位置
"================================================================
set      viminfo='1000,f1,<500
autocmd  BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"git commit添加注释时设置最大宽度和自动换行
autocmd  Filetype gitcommit setlocal spell textwidth=72

"===============================================================
"Highlight All Math Operator
"===============================================================
"C math operators
syn match	cMathOperator		display "[-+\*/%=]"

"C pointer operators
syn match	cPointerOperator	display "->\|."

"C logical	operators - boolean results
syn match	cLogicalOperator	display "[!<>]=\="
syn match	cLogicalOperator	display "=="

"C bit operators
syn match	cBinaryOperator		display "\(&\||\|\^\|<<\|>>\)=\="
syn match	cBinaryOperator		display "\~"
syn match	cBinaryOperatorError	display "\~="

"More C logical operators - highlight in preference to binary
syn match	cLogicalOperator	display "&&\|||"
syn match	cLogicalOperatorError	display "\(&&\|||\)="

"Math Operator
hi cMathOperator            guifg=#3EFFE2
hi cPointerOperator         guifg=#3EFFE2
hi cLogicalOperator         guifg=#3EFFE2
hi cBinaryOperator          guifg=#3EFFE2
hi cBinaryOperatorError     guifg=#3EFFE2
hi cLogicalOperator         guifg=#3EFFE2
hi cLogicalOperatorError    guifg=#3EFFE2

"========================================================
" My Own DataType
"========================================================
syn keyword cType       My_Type_1 My_Type_2 My_Type_3	

"========================================================
" Targlist
"========================================================
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

"========================================================
"minibuffer setting
"========================================================
let g:miniBufExplMapWindowNavVim           = 1
let g:miniBufExplMapWindowNavArrows        = 1
let g:miniBufExplMapCTabSwitchBufs         = 1
let g:miniBufExplModSelTarget              = 1
let g:miniBufExplTabWrap                   = 1
let g:miniBufExplUseSingleClick            = 1

filetype plugin indent on
"========================================================
"去掉预览窗口preview和设置longest
"========================================================
set completeopt=longest,menu

"========================================================
"搜索时及时匹配且忽略大小写
"========================================================
set incsearch
set ignorecase

"========================================================
"neocomplete settings
"========================================================
let g:neocomplete#enable_at_startup        = 1

"========================================================
"NerdTree setting
"========================================================
let NERDChristmasTree=1
" 关闭文件时同时关闭文件浏览器
let g:NERDTreeQuitOnOpen                   = 1
let g:NERDTreeWinSize                      = 20

"========================================================
" doxygen setting
"========================================================
let g:DoxygenToolkit_briefTag_funcName     = "yes"
let g:doxygen_enhanced_color               = 1
let g:DoxygenToolkit_authorName            = "zhaozhanxu@jd.com"
let s:licenseTag                           = "  \<enter>"

"========================================================
" key map
"========================================================
noremap <silent><C-a> :DoxAuthor<CR>
noremap <silent><C-f> :Dox<CR>
noremap <silent><C-b> :DoxBlock<CR>
noremap <silent><C-l> :DoxLic<CR>
noremap <silent> <F3> :Grep<CR>
noremap <silent><F6> :PlugInstall<CR> 
"用空格键来打开/关闭折叠
nnoremap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 
"开关文件浏览器
noremap <silent><C-z> :NERDTreeToggle <CR>
"设置a.vim插件的快捷键
set pastetoggle=<F11>
"在文件浏览器中定位当前文件
noremap <silent><F2>f :NERDTreeFind <CR>
noremap <silent><C-x> :TagbarToggle<CR>
" toggle between vim mouse
noremap <silent><C-m> :let &mouse=(&mouse == "a"?"v":"a")<CR>

"go setting below

"========================================================
"go-vim settings
"========================================================
let g:go_highlight_functions               = 1
let g:go_highlight_methods                 = 1
let g:go_highlight_structs                 = 1
let g:go_fmt_fail_silently                 = 1
let g:go_disable_autoinstall               = 1
let g:go_fmt_autosave                      = 1
" let g:go_fmt_command                       = "goimports"

"========================================================
" tagbar setting
"========================================================
let g:tagbar_width                         = 20
let g:tagbar_type_go                       = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"========================================================
" plug settings
"========================================================
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'techlivezheng/vim-plugin-minibufexpl'
Plug 'bling/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'fatih/vim-go'

call plug#end()

"================================================================
"使用VIM不兼容模式
"================================================================
set nocompatible

"================================================================
"高亮模式
"================================================================
syntax enable

"================================================================
"颜色模式
"================================================================
colorscheme desert

"================================================================
"文件类型探测
"================================================================
filetype on
filetype plugin on

"set background=light
set background=dark

"================================================================
"打开文件时自动到达上次浏览时的位置
"================================================================
set      viminfo='1000,f1,<500
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
filetype plugin indent on
endif

"========================================================
"搜索时及时匹配且不忽略大小写
"========================================================
set incsearch
set smartcase

"================================================================
"Autoindent
"打开普通文件类型的自动缩进。 该自动缩进不如 cindent 智能， 但它可以为你编辑非C/C++ 文件提供一定帮助。
"================================================================
set autoindent 
set smartindent

"================================================================
"tab indent
"================================================================
set shiftwidth =4
set softtabstop=4
set tabstop=4
set textwidth=79
set cinoptions={0,1s,t0,p2s,(03s,=.5s,>1s,=1s,:1s

"================================================================
"将Tab替换为空格
"================================================================
set expandtab
set smarttab
retab

"================================================================
"显示括号配对情况
"================================================================
set showmatch

"================================================================
"不在单词中间断行
"================================================================
set linebreak

"================================================================
"如果去掉这一行,默认值set mouse=a就生效了,这时不能用鼠标选中复制.
"================================================================
set mouse=v

"================================================================
"Line number
"================================================================
set number

"================================================================
" keep 1500 lines of command line history
"================================================================
set history=1500
 
"================================================================
"总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
"================================================================
set laststatus=1

"================================================================
"标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
"================================================================
set ruler

"================================================================
"命令行显示输入的命令
"命令行显示vim当前模式
"================================================================
set showcmd
set showmode

"================================================================
"搜索时高亮显示被找到的文本
"================================================================
set hlsearch

"================================================================
"与系统剪贴板共享
"================================================================
set clipboard+=unnamed

"================================================================
"允许汉字断行
"================================================================
set fo+=mB
 
"================================================================
"使用“Shift + 方向键”选择文本
"================================================================
"set keymodel=startsel,stopsel

"================================================================
"显示中文帮助
"================================================================
language message en_US.UTF-8
set helplang=cn
set ambiwidth=double
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"================================================================
"自动切换当前目录为当前文件所在的目录
"================================================================
"set autochdir

"================================================================
"突出显示当前行
"================================================================
"set cursorline

"================================================================
"覆盖文件时不备份
"================================================================
set nobackup

"================================================================
"试试看
"================================================================
set statusline=%F%m%r,\ %Y,\ %{&fileformat}\ \ \ ASCII=\%b,HEX=\0x\%B\ \ \ %l,%c%V\ \ %p%%

"================================================================
"光标到底部和顶部时保持5行距离
"================================================================
set scrolloff=5

"================================================================
"命令行高度为2
"================================================================
set cmdheight=2
 
"================================================================
"在命令模式下使用 Tab 自动补全的时候，将补全内容使用一个漂亮的单行菜单形式显示出来。
"================================================================
set wildmenu
 
"================================================================
"让Vim的补全菜单行为与一般IDE一致
"================================================================
set completeopt=longest,menu

"================================================================
"Foldmethod
"================================================================
set fdm=marker
"set fdm=syntax
 
set foldenable
set foldmethod=manual
set foldlevel=1

"===============================================================
"Highlight All Math Operator
"===============================================================
"C math operators
syn match	cMathOperator			display "[-+\*/%=]"

"C pointer operators
syn match	cPointerOperator		display "->\|."

"C logical	operators - boolean results
syn match	cLogicalOperator		display "[!<>]=\="
syn match	cLogicalOperator		display "=="

"C bit operators
syn match	cBinaryOperator			display "\(&\||\|\^\|<<\|>>\)=\="
syn match	cBinaryOperator			display "\~"
syn match	cBinaryOperatorError	display "\~="

"More C logical operators - highlight in preference to binary
syn match	cLogicalOperator		display "&&\|||"
syn match	cLogicalOperatorError	display "\(&&\|||\)="

"Math Operator
hi cMathOperator            guifg=#3EFFE2
hi cPointerOperator         guifg=#3EFFE2
hi cLogicalOperator         guifg=#3EFFE2
hi cBinaryOperator          guifg=#3EFFE2
hi cBinaryOperatorError     guifg=#3EFFE2
hi cLogicalOperator         guifg=#3EFFE2
hi cLogicalOperatorError    guifg=#3EFFE2

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

"========================================================
"NerdTree setting 左侧文件列表
"========================================================
let NERDChristmasTree=1
" 关闭文件时同时关闭文件浏览器
let g:NERDTreeQuitOnOpen                   = 1
let g:NERDTreeWinSize                      = 20

"========================================================
" Targlist右侧函数列表
"========================================================
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"========================================================
"airline
"========================================================
let g:airline#extensions#tabline#enabled	= 1
let g:airline#extensions#tabline#buffer_nr_show	= 1
let g:airline_powerline_fonts				= 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol	= '!'
set t_Co=256
"let g:airline_section_b						= '%{strftime("%c")}'
"let g:airline_section_y						= 'BN: %{bufnr("%")}'

"========================================================
"ycm setting
"========================================================
let g:ycm_warning_symbol			= '>*'
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_start_csharp_server = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf		= '~/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf = 0
"从第2个键入字符就开始罗列
let g:ycm_min_num_of_chars_for_completion = 2
"禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

"================================================================
" ctags在当前目录找不到tags文件就向父目录找
"================================================================
set tags=tags;

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
"go-vim settings
"========================================================
let g:go_highlight_functions               = 1
let g:go_highlight_methods                 = 1
let g:go_highlight_structs                 = 1
let g:go_fmt_fail_silently                 = 1
let g:go_disable_autoinstall               = 1
let g:go_fmt_autosave                      = 1
" let g:go_fmt_command                     = "goimports"

"========================================================
" key map
"========================================================
noremap <silent><F6> :BundleInstall<CR> 
"用空格键来打开/关闭折叠
"nnoremap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 
"开关文件浏览器
noremap <silent><C-z> :NERDTreeToggle<CR>
"在文件浏览器中定位当前文件
noremap <silent><F2>f :NERDTreeFind<CR>
noremap <silent><C-x> :TagbarToggle<CR>
" toggle between vim mouse
noremap <silent><C-m> :let &mouse=(&mouse == "a"?"v":"a")<CR>
nmap ga <Plug>(EasyAlign)
noremap <silent><C-n> :bn<CR>
"ycm jumper
noremap <silent><F4> :YcmDiags<CR>
"noremap <silent><C-[> :YcmCompleter GoToDeclaration<CR>
noremap <silent><C-p> :YcmCompleter GoToDefinition<CR>
"noremap <silent><C-p> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <slient><space> :za<CR>
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

"markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_folding_disabled=1


"========================================================
" plug settings
"========================================================
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
"目录
Bundle 'scrooloose/nerdtree'
"函数列表
Bundle 'majutsushi/tagbar'
"自动对齐
Bundle 'junegunn/vim-easy-align'
"轻量级的powerline
Bundle 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'
Bundle 'w0rp/ale'
Bundle 'google/yapf'
"Bundle 'fatih/vim-go'
"markdown
Bundle 'plasticboy/vim-markdown'
Bundle 'vim-scripts/indentpython.vim'

filetype plugin indent on

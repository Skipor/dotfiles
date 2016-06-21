"" Last update: 21.09.2012 19:33

"vim-latexНАСТРОЙКИ VUNDLE
"filetype off " обязательно!
set nocompatible
filetype off

let iCanHazVundle=1  "0 if first install
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.." 
  echo "" 
  silent !mkdir -p ~/.vim/bundle 
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
  "that is for nvim 
  silent mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  silent ln -s ~/.vim $XDG_CONFIG_HOME/nvim
  silent ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"Plugin 'c.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter' 
"Plugin 'bufexplorer.zip'
Plugin 'scrooloose/syntastic'


"Haskell
"Plugin 'haskell.vim'
Plugin 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1 
let g:haskell_enable_recursivedo = 1 
let g:haskell_enable_arrowsyntax = 1 
let g:haskell_enable_pattern_synonyms = 1 
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

"Plugin 'bitc/vim-hdevtools'
"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

function! FindCabalSandboxRoot()
    return finddir('.cabal-sandbox', './;')
endfunction

function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction

"let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf() 

"GO
Plugin 'fatih/vim-go'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'vim-jp/vim-go-extra'
Plugin 'dgryski/vim-godef'

"matlab
"Plugin 'elmanuelito/vim-matlab-behave'
Plugin 'WolfgangMehner/vim-plugins'



"LaTeX
Plugin 'gerw/vim-latex-suite'
"Plugin 'vim-latex/vim-latex'
"vim-snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

"Extra syntax: flex, Bison
Plugin 'justinmk/vim-syntax-extra'

Plugin 'neilagabriel/vim-geeknote'
noremap <F8> :Geeknote<cr>


" Optional:
" ultinips
" Track the engine.
"Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-k>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"Plugin "honza/vim-snippets"
"Plugin "OmniCppComplete"
Plugin 'Valloric/YouCompleteMe'
"Plugin 'taglist.vim'
"Plugin 'grep.vim'
call vundle#end() "required

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
  echo "Installing YouCompleteMe"
  echo ""
  cd ~/.vim/bundle/YouCompleteMe
  !./install.sh --clang-completer --gocode-completer
  echo "Geting mac keymap"
  echo ""
  !mkdir ~/.vim/keymap
  !wget https://raw.githubusercontent.com/Skipor/vim-keymap-russian-jcukenmac/master/keymap/russian-jcukenmac.vim -O ~/.vim/keymap/russian-jcukenmac.vim

endif




filetype plugin indent on " обязательно!
syntax on " включить подсветку синтаксиса
set clipboard=unnamed "copy-paste in os


"НАСТРОЙКИ ПЛАГИНОВ 
"Plugin 'scrooloose/syntastic'
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Plugin 'rjohnsondev/vim-compiler-go'
autocmd FileType go compiler golang

"Plugin "gerw/vim-latex-suite"
autocmd Filetype tex setl updatetime=1
"ycm settings
let g:ycm_global_ycm_extra_conf = '/Users/vladimirskipor/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm'
"let g:LatexBox_latexmk_options = "-pvc -pdfps"
"let g:LatexBox_latexmk_preview_continuously=1 
"let g:LatexBox_latexmk_async=1

set omnifunc=syntaxcomplete#Complete "omni compeletion


let g:tex_flavor='latex'

let NERDTreeShowHidden=1




" C-e - комментировать/раскомментировать (при помощи NERD_Comment)
map <C-e> \ci
nmap <C-e> \ci
imap <C-e> <ESC>\cii



"НАСТРОЙКИ ГОРЯЧИХ КЛАВИШ
" F2 - сохранить файл
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
" F3 - рекурсивный поиск по файлам (плагин grep.vim)
"nnoremap <silent> <F3> :Rgrep<cr>
" Shift-F<F3> - добавление найденного к прошлым результатам поиска
"nnoremap <silent> <S-F<F3>> :RgrepAdd<cr>
" Ctrl-F<F3> - поиск в открытых буферах
"nnoremap <silent> <C-F<F3>> :GrepBuffer<cr>
" F5 - просмотр списка буферов
nmap <F5> <Esc>:buffers<cr>
vmap <F5> <esc>:buffers<cr>
imap <F5> <esc><esc>:buffers<cr>a
" при включенном плагине можно использовать его
nmap <S-F5> :BufExplorer<CR>
" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i
" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i
" F9 - сохранение файла и запуск компиляции (make)
map <F9> :w<cr>\rr<cr>
vmap <F9> <esc>:w<cr>\rr<cr>i
imap <F9> <esc>:w<cr><\rr<cr>i
" F10 - включить-выключить браузер структуры документа (TagList)
map <F10> :TlistToggle<cr>
vmap <F10> <esc>:TlistToggle<cr>
imap <F10> <esc>:TlistToggle<cr>
" F11 - включить-выключить нумерацию строк
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
" F12 - обозреватель файлов (:Ex для стандартного обозревателя,
" плагин NERDTree - дерево каталогов)
"map <F12> :NERDTreeToggle<cr>
"vmap <F12> <esc>:NERDTreeToggle<cr>i
imap <F12> <esc>:NERDTreeToggle<cr>i


"" Переключение табов (вкладок) (rxvt-style)
map <S-left> :tabprevious<cr>
nmap <S-left> :tabprevious<cr>
imap <S-left> <ESC>:tabprevious<cr>i
map <S-right> :tabnext<cr>
nmap <S-right> :tabnext<cr>
imap <S-right> <ESC>:tabnext<cr>i
"nmap <C-t> :tabnew<cr>
"imap <C-t> <ESC>:tabnew<cr>
nmap <S-down> :tabnew<cr>
imap <S-down> <ESC>:tabnew<cr>
"nmap <C-w> :tabclose<cr>
"imap <C-w> <ESC>:tabclose<cr>



" C(trl)+s - дублирование текущей строки
imap <C-s> <esc>yypi
" imap <C-k> \lambda 
" noremap <C-k> :s/\([^\\]\)\s/\1\\ /g <bar> :s/lambda\\\s/lambda /g <CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/





"" Last update: 25.06.2012 10:03
"" .vimrc  файл конфирурации для текстового редактора VIM
"" dimio (http://dimio.org)
"" Подробности по адресу:
"" http://dimio.org/fajl-nastrojki-vim-vimrc-dlya-linux-i-windows.html
"=====================================================================
"НАСТРОЙКИ ВНЕШНЕГО ВИДА И БАЗОВЫЕ НАСТРОЙКИ РЕДАКТОРА
set nocompatible " отключить режим совместимости с классическим Vi
set scrolloff=3 " сколько строк внизу и вверху экрана показывать при скроллинге
"set background=dark " установить цвет фона
"цветовая схема по умолчанию (при вводе в режиме команд
"по табуляции доступно автодополнение имён схем). af, desert
colorscheme desert
set wrap " (no)wrap - динамический (не)перенос длинных строк
set linebreak " переносить целые слова
set hidden " не выгружать буфер когда переключаешься на другой
set mouse=a " включает поддержку мыши при работе в терминале (без GUI)
set mousehide " скрывать мышь в режиме ввода текста
set showcmd " показывать незавершенные команды в статусбаре (автодополнение ввода)
set matchpairs+=<:> " показывать совпадающие скобки для HTML-тегов
set showmatch " показывать первую парную скобку после ввода второй
set autoread " перечитывать изменённые файлы автоматически
set t_Co=256 " использовать больше цветов в терминале
set confirm " использовать диалоги вместо сообщений об ошибках
"" Автоматически перечитывать конфигурацию VIM после сохранения
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
"" Формат строки состояния
" fileformat - формат файла (unix, dos); fileencoding - кодировка файла;
" encoding - кодировка терминала; TYPE - тип файла, затем коды символа под курсором;
" позиция курсора (строка, символ в строке); процент прочитанного в файле;
" кол-во строк в файле;
set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"Изменяет шрифт строки статуса (делает его не жирным)
hi StatusLine gui=reverse cterm=reverse
set laststatus=2 " всегда показывать строку состояния
set noruler "Отключить линейку
"" Подсвечивать табы и пробелы в конце строки
set list " включить подсветку
set listchars=tab:>-,trail:- " установить символы, которыми будет осуществляться подсветка
"Проблема красного на красном при spellchecking-е решается такой строкой в .vimrc
highlight SpellBad ctermfg=Black ctermbg=Red
au BufWinLeave *.* silent mkview " при закрытии файла сохранить 'вид'
au BufWinEnter *.* silent loadview " при открытии - восстановить сохранённый
set backspace=indent,eol,start " backspace обрабатывает отступы, концы строк
set sessionoptions=curdir,buffers,tabpages " опции сессий - перейти в текущую директорию, использовать буферы и табы
set noswapfile " не использовать своп-файл (в него скидываются открытые буферы)
set visualbell " вместо писка бипером мигать курсором при ошибках ввода
set clipboard=unnamed " во избежание лишней путаницы использовать системный буфер обмена вместо буфера Vim
set backup " включить сохранение резервных копий
set title " показывать имя буфера в заголовке терминала
set history=128 " хранить больше истории команд
set undolevels=2048 " хранить историю изменений числом N
set whichwrap=b,<,>,[,],l,h " перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
"set virtualedit=all " позволяет курсору выходить за пределы строки
let c_syntax_for_h="" " необходимо установить для того, чтобы *.h файлам присваивался тип c, а не cpp
" При вставке фрагмента сохраняет отступ
set pastetoggle=
"подсвечивает все слова, которые совпадают со словом под курсором.
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

"НАСТРОЙКИ ПОИСКА ТЕКСТА В ОТКРЫТЫХ ФАЙЛАХ
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без учёта
set nohlsearch " (не)подсветка результатов поиска (после того, как поиск закончен и закрыт)
set incsearch " поиск фрагмента по мере его набора
" поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>


"НАСТРОЙКИ РАБОТЫ С ФАЙЛАМИ

" формат файла по умолчанию (влияет на окончания строк) - будет перебираться в указанном порядке
set fileformat=unix
" варианты кодировки файла по умолчанию (все файлы по умолчанию сохраняются в этой кодировке)
set fencs=utf-8,cp1251,koi8-r,cp866

"НАСТРОЙКИ ОТСТУПА
set shiftwidth=2 " размер отступов (нажатие на << или >>)
set tabstop=2 " ширина табуляции
set softtabstop=2 " ширина 'мягкого' таба
set autoindent " ai - включить автоотступы (копируется отступ предыдущей строки)
set cindent " ci - отступы в стиле С
set expandtab " преобразовать табуляцию в пробелы
set smartindent " Умные отступы (например, автоотступ после {)
" Для указанных типов файлов отключает замену табов пробелами и меняет ширину отступа
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8


"НАСТРОЙКИ ВНЕШНЕГО ВИДА
" Установка шрифта (для Windows и Linux)
" настройка внешнего вида для GUI
if has('gui')
    " отключаем графические табы (останутся текстовые,
    " занимают меньше места на экране)
    "set guioptions-=e
    " отключить показ иконок в окне GUI (файл, сохранить и т.д.)
    set guioptions-=T

endif


"НАСТРОЙКИ ПЕРЕКЛЮЧЕНИЯ РАСКЛАДОК КЛАВИАТУРЫ
"" Взято у konishchevdmitry
set keymap=russian-jcukenmac " настраиваем переключение раскладок клавиатуры по <C-^>
set iminsert=0 " раскладка по умолчанию - английская
set imsearch=0 " аналогично для строки поиска и ввода команд
function! MyKeyMapHighlight()
   if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
      hi StatusLine ctermfg=green guifg=green
   else " а при русской - зеленого.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
" использовать Ctrl+^ для переключения раскладок
cmap <silent> <C-^> <C-^>
imap <silent> <C-^> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-^> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-^> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv




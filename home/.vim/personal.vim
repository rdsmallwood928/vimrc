"""""""""""""""""""""""""""""
" => Bundles
""""""""""""""""""""""""""""""
" Use `make` to install bundles in a new repo
source ~/.vim/bundle.vim


""""""""""""""""""""""""""""""
" => The Basics
""""""""""""""""""""""""""""""
"follow the leader
let mapleader=";"
let vimDir = '$HOME/.vim'

set mouse=a
set modeline
set showmatch " when a bracket is inserted, briefly jump to the matching one
set nowrap " don't wrap long test
set number " line numbers
set title
set showmode " show current mode
set showcmd " show command characters
set history=1000 "let's have a litle more of it
set cursorline "highlight the current line
set backspace=2
set noswapfile
set clipboard=unnamed

" Don't auto format comments when hitting <enter> in insert mode
" or <o>/<O> in normal mode
set fo=tcq

"avoid escape key
imap jj <esc>

"have command-line completion <Tab> (for filenames, help topics, option names)
"first list the available options and complete the longest common part, then
"have further <Tab>s cycle through the possibilities:
set wildmode=list:longest

"allow Ctrl-A and Ctrl-X to work on all variants
set nrformats=octal,hex,alpha

"always change the working dir to that of the file in the buffer
set autochdir

"give three lines of context when moving the cursor around
set scrolloff=3

"if you :q with changes it asks you if you want to continue or not
set confirm

" have Y behave analogously to D rather than to dd
nmap Y y$

" mapping timeouts
" timeout on mapping after 500ms - should be slower than you usually type
" timeout on key codes after 100ms - should be faster than you can type
set timeout
set timeoutlen=500
set ttimeoutlen=100

filetype plugin on
filetype indent on
syntax on
set diffopt=vertical

""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""
set t_Co=256 " enable 256 color mode (which supports transparency)
set background=dark
colorscheme solarized

if has('gui_running')
  "set guifont=Source\ Code\ Pro:h14
endif

""""""""""""""""""""""""""""""
" =>Tabbing and indenting
""""""""""""""""""""""""""""""
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2 " if it looks like a tab, we can delete it like a tab
set shiftround " < and > will hit indentation levels
set expandtab
let g:sh_indent_case_labels=1

"Some handy tab width goodness
map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=8<cr>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Search and replace word under cursor
nnoremap <leader>sr :%s/\<<c-r><c-w>\>//<left>

""""""""""""""""""""""""""""""
" => Splits
""""""""""""""""""""""""""""""
nnoremap <leader>- :sp<CR>
nnoremap <leader>= :vsp<CR>


""""""""""""""""""""""""""""""
" => Plugin Mappings
""""""""""""""""""""""""""""""
nnoremap <leader>. :NERDTreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>gu :GundoToggle<CR>

"Git Plugin Mappings
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>cc :CoffeeCompile<CR>
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>s :Gstatus<CR>
nnoremap <leader>c :Gcommit<CR>
nnoremap <leader>g :GundoToggle<CR>

"Silver Searcher
nnoremap <leader>ag :Rack<space>

"Eclim
nnoremap <leader>vi :JavaImportOrganize<CR>
nnoremap <leader>vr :Java %<CR>

"Vim Plug
nnoremap <leader>pi :call PluginReloadAndRun("PlugInstall")<CR>
nnoremap <leader>pu :call PluginReloadAndRun("PlugUpdate")<CR>
nnoremap <leader>pc :call PluginReloadAndRun("PlugClean")<CR>

""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['jshint']


""""""""""""""""""""""""""""""
" => vim-json
""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal=0 "disable auto conceal of quotes, etc in json files

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1

""""""""""""""""""""""""""""""
" => Super Tab plugin
""""""""""""""""""""""""""""""
"let omnifunc=syntaxcomplete#Complete
"let g:omni_syntax_use_iskeyword = 0
let g:SuperTabDefaultCompletion="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-p>"

""""""""""""""""""""""""""""""
" => Rainbow
""""""""""""""""""""""""""""""
let g:rainbow_active=1

""""""""""""""""""""""""""""""
" => TagBar
""""""""""""""""""""""""""""""
"tags - directory of current file, then search up from working dir
set tags=./tags,tags;
let g:tagbar_compact=1
let g:tagbar_autoclose=1


""""""""""""""""""""""""""""""
" => Eclim
""""""""""""""""""""""""""""""
let g:EclimCompletionMethod = 'omnifunc'

""""""""""""""""""""""""""""""
" => ack.vim
""""""""""""""""""""""""""""""
if executable('ag')
	let g:ackprg='ag –nocolor –nogroup –column'
endif

function! Rack(args)
  let l:gitDir = system('git rev-parse –show-toplevel')
  if l:gitDir =~ 'Not a git repository'
    execute 'Ack ' . a:args
    return
  endif
  execute 'Ack ' . a:args  . ' ' . l:gitDir
endfunction

""""""""""""""""""""""""""""""
" => vim-plug
""""""""""""""""""""""""""""""
command! ReloadVimPlug source ~/.vim/vim-plug.vim
function! PluginReloadAndRun(command)
  :ReloadVimPlug
  execute a:command
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""""""""""""""""""""""""""""""
" => Searching
""""""""""""""""""""""""""""""
set hlsearch " highlight as you search
set incsearch " scroll as you search
set ignorecase " searches are case-insensitive
set smartcase " unless they contain upper-case letters


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2
function! GitBranchStatus()
  let git_branch = GitBranch()
  if strlen(git_branch)
    return '[Git (' . git_branch . ')]'
  endif
  return ''
endfunction
au BufNewFile,BufRead * set statusline=%f%m%r%h%w\ [BUFFER\ #%n]\ [TYPE=%Y]\ %(\%{GitBranchStatus()}\ %)[ASCII=%03.3b\ HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""
au FileType python set nocindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako


""""""""""""""""""""""""""""""
" => Buffers
""""""""""""""""""""""""""""""
"allow hidden buffers (modified buffers in background)
set hidden

"Quickly open a buffer for scribble
map <leader>n :e ~/notes<cr>

"Quickly open a buffer for the VimRC
map <leader>.. :e ~/.vim/personal.vim<cr>
"and reload it when edited
autocmd! bufwritepost personal.vim source ~/.vim/personal.vim

":q screws me up, so need a macro to kill buffer
function! SmartQuit ()
  redir @b | silent ls | redir END
  if len(split(@b,"\n")) > 1
    execute ":bw"
  else
    execute ":q"
  endif
endfunction

"write and quit buffers
map <leader>w :w<cr>
map <leader>q :call SmartQuit()<cr>
map <leader>wq :w<cr><esc>:call SmartQuit()<cr>
"write a buffer when we forgot to sudoedit
map <leader>fw :w !sudo tee %<cr><cr>:e<cr>

"Setup a cmd to edit a file in the pwd
map <leader>e :e <c-r>=expand('%:p:h')<cr>/

"Buffer naviation
nnoremap <C-A> :bprevious<CR>
nnoremap <C-S> :bnext<CR>

"Buffer Explorer
nnoremap <F5> :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
"paste toggle
function! TogglePaste()
  if &mouse == 'a'
    set mouse=
    set paste
    set nonumber
    echo "Paste mode on"
  else
    set mouse=a
    set nopaste
    set number
    echo "Paste mode off"
  endif
endfunction
nnoremap <F8> :call TogglePaste()<cr>
inoremap <F8> <esc>:call TogglePaste()<cr>a

" Use CTRL-C to copy visual selection
map <C-c> "+y<CR>

"wrap toggle
nnoremap <F9> :set wrap!<cr>

" Easier moving in tabs and windows
nnoremap <C-J> <C-W>j<CR>
nnoremap <C-K> <C-W>k<CR>
nnoremap <C-L> <C-W>l<CR>
nnoremap <C-H> <C-W>h<CR>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" file.
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d :",
        \ &filetype, &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <leader>ml :call AppendModeline()<CR>


""""""""""""""""""""""""""""""
" => Omni Completion
""""""""""""""""""""""""""""""
"let omnifunc=syntaxcomplete#Complete
"let g:omni_syntax_use_iskeyword = 0
set completeopt=menu,longest,preview

" some convenient mappings
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
"inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

""""""""""""""""""""""""""""""
" => Auto Commands
""""""""""""""""""""""""""""""
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when in a git/svn commit message.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && expand('%Y') != "COMMIT_EDITMSG" |
    \   exe "normal g`\"" |
    \ endif
endif


""""""""""""""""""""""""""""""
" => Grep & Search
""""""""""""""""""""""""""""""
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>

" ---------------
" Ag.vim
" ---------------
let g:ag_highlight = 1

""""""""""""""""""""""""""""""
" => Powerline / Airline
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
set guifont=Liberation\ Mono\ for\ Powerline\ 10
set encoding=utf-8

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
  \'a' : [ promptline#slices#host() ],
  \'b' : [ promptline#slices#user() ],
  \'c' : [ promptline#slices#cwd() ],
  \'x' : [ promptline#slices#python_virtualenv() ],
  \'y' : [ "$(echo '\n')", promptline#slices#vcs_branch() ],
  \'warn' : [ promptline#slices#last_exit_code() ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host()
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" let g:promptline_powerline_symbols = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""
" => Security
""""""""""""""""""""""""""""""
set secure

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set              " be iMproved, required
syntax enable
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/desertEx'
Plugin 'majutsushi/tagbar'
Plugin 'amiorin/vim-project'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rking/ag.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'jszakmeister/vim-textobj-rst'
Plugin 'scrooloose/syntastic.git'
Plugin 'jtriley/vim-rst-headings'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'chriskempson/base16-vim'
Plugin 'fatih/vim-go'

nmap <Leader><Leader>t :TagbarToggle<CR>
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'bufmru.vim'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype plugin indent on
set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set backspace=2 " Fix broken backspace in some setups
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab " expand tabs to spaces
set ignorecase " case-insensitive search
set incsearch " search as you type
set laststatus=2 " always show statusline
set list " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number " show line numbers
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set showcmd
set smartcase " case-sensitive search if any caps
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=8 " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion
set wildmode=longest,list,full
" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
set ttymouse=xterm2
endif
" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make Y work the way I expect it to: yank to the end of the line.
nnoremap Y y$

" Shortcut for clearing CtrlP caches
nnoremap <Leader><Leader>r :<C-U>CtrlPClearAllCaches<CR>

" Allow . to work over visual ranges.
vnoremap . :normal .<CR>

" Make splits appear on the right.
set splitright

"Toggle relative and normal numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<cr>

nmap <leader>a :Ag 

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag -f --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --follow --nocolor -g ""'
endif

" Ag defaults + follow symlinks
let g:agprg="ag --column --follow"

" keyboard shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let base16colorspace=256
set background=dark
colorscheme base16-eighties

nmap <leader><leader>t :TagbarToggle<CR>

if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ Light
elseif has("gui_gtk")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
endif

nnoremap zj o<Esc>
nnoremap zk O<Esc>

" -------------------------------------------------------------
" CtrlP
" -------------------------------------------------------------

" No default mappings.
let g:ctrlp_map = ''

" Directory mode for launching ':CtrlP' with no directory argument:
"   0 - Don't manage the working directory (Vim's CWD will be used).
"       Same as ':CtrlP $PWD'.
let g:ctrlp_working_path_mode = 0

" Set to list of marker directories used for ':CtrlPRoot'.
" A marker signifies that the containing parent directory is a "root".  Each
" marker is probed from current working directory all the way up, and if
" the marker is not found, then the next marker is checked.
let g:ctrlp_root_markers = []

" Don't open multiple files in vertical splits.  Just open them, and re-use the
" buffer already at the front.
let g:ctrlp_open_multiple_files = '1vr'

" :C [path]  ==> :CtrlP [path]
command! -n=? -com=dir C CtrlP <args>

" Follow symlinks
let g:ctrlp_follow_symlinks = 1
" :CD [path]  ==> :CtrlPDir [path]
command! -n=? -com=dir CD CtrlPDir <args>

" Define prefix mapping for CtrlP plugin so that buffer-local mappings
" for CTRL-P (such as in Tagbar) will override all CtrlP plugin mappings.
nmap <C-P> <SNR>CtrlP.....

" An incomplete mapping should do nothing.
nnoremap <SNR>CtrlP.....      <Nop>

nnoremap <SNR>CtrlP.....<C-B> :<C-U>CtrlPBookmarkDir<CR>
nnoremap <SNR>CtrlP.....c     :<C-U>CtrlPChange<CR>
nnoremap <SNR>CtrlP.....C     :<C-U>CtrlPChangeAll<CR>
nnoremap <SNR>CtrlP.....<C-D> :<C-U>CtrlPDir<CR>
nnoremap <SNR>CtrlP.....<C-F> :<C-U>CtrlPCurFile<CR>
nnoremap <SNR>CtrlP.....<C-L> :<C-U>CtrlPLine<CR>
nnoremap <SNR>CtrlP.....<C-M> :<C-U>CtrlPMRU<CR>
nnoremap <SNR>CtrlP.....m     :<C-U>CtrlPMixed<CR>

" Mnemonic: "open files"
nnoremap <SNR>CtrlP.....<C-O> :<C-U>CtrlPBuffer<CR>
nnoremap <SNR>CtrlP.....<C-P> :<C-U>CtrlP<CR>
nnoremap <SNR>CtrlP.....<C-Q> :<C-U>CtrlPQuickfix<CR>
nnoremap <SNR>CtrlP.....<C-R> :<C-U>CtrlPRoot<CR>
nnoremap <SNR>CtrlP.....<C-T> :<C-U>CtrlPTag<CR>
nnoremap <SNR>CtrlP.....t     :<C-U>CtrlPBufTag<CR>
nnoremap <SNR>CtrlP.....T     :<C-U>CtrlPBufTagAll<CR>
nnoremap <SNR>CtrlP.....<C-U> :<C-U>CtrlPUndo<CR>

" Reverse move and history binding pairs:
" - For consistency with other plugins that use <C-N>/<C-P> for moving around.
" - Because <C-J> is bound to the tmux prefix key, so it's best to map
"   that key to a less-used function.
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<C-N>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<C-P>', '<up>'],
    \ 'PrtHistory(-1)':       ['<C-J>'],
    \ 'PrtHistory(1)':        ['<C-K>'],
    \ }

" Maximum height of filename window.
let g:ctrlp_max_height = 50

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Yank to system clipboard by default
set clipboard=unnamed

" Setup command-line completion (inside of Vim's ':' command line).
" Controlled by two options, 'wildmode' and 'wildmenu'.
" `wildmode=full` completes the full word
" `wildmode=longest` completes the longest unambiguous substring
" `wildmode=list` lists all matches when ambiguous
" When more than one mode is given, tries first mode on first keypress,
" and subsequent modes thereafter.
" `wildmode=longest,list` matches longest unambiguous, then shows list
"   of matches on next keypress if match didn't grow longer.
" If wildmenu is set, it will be used only when wildmode=full.

set wildmode=longest,list

" List of extensions to ignore when using wildcard matching.
set wildignore=*.o,*.obj,*.a,*.lib,*.so,*~,*.bak,*.swp,tags,*.opt,*.ncb
            \,*.plg,*.elf,cscope.out,*.ecc,*.exe,*.ilk
            \,export,build,_build

" Ignore some Python artifacts.
set wildignore+=*.pyc,*.egg-info

" Ignore some Linux-kernel artifacts.
set wildignore+=*.ko,*.mod.c,*.order,modules.builtin

" Ignore some java-related files.
set wildignore+=*.class,classes/**,*.jar

" Ignore debug symbols on Mac OS X.
set wildignore+=*.dSYM

set tabstop=4
set shiftwidth=4

" Bells are bad
set noerrorbells

" Copy full path to clipboard
nnoremap <Leader><Leader>c :let @+=expand("%:p")<CR>

nnoremap <Leader><Leader>t :TagbarToggle <CR>

" Toggle quickfix / locationlist
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

set nonumber
set relativenumber

set t_Co=256

set hlsearch

" Neocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" This will allow switching buffers without saving changes first.
set hidden

" The :tjump command is more convenient than :tag because it will pop up a
" menu if and only if multiple tags match.  Exchange the default meaning
" of CTRL-] and friends to use :tjump for the more convenient keystrokes,
" and to allow the old behavior via tha "g"-prefixed less-convenient keystrokes.
" Additionally, map the mouse to use the :tjump variants.

nnoremap g<C-]>   <C-]>
xnoremap g<C-]>   <C-]>
nnoremap  <C-]>  g<C-]>
xnoremap  <C-]>  g<C-]>

nnoremap g<LeftMouse>   g<C-]>
xnoremap g<LeftMouse>   g<C-]>
nnoremap <C-LeftMouse>  g<C-]>
xnoremap <C-LeftMouse>  g<C-]>

" Get rid of all the annoying window borders in gvim
set guioptions=

nnoremap / /\v
cnoremap %s/ %s/\v

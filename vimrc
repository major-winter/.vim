filetype off
syntax enable
set nocompatible
set showcmd
set wildmenu "enhanced completion in command-mode
set nu
set hls
set incsearch
set relativenumber
set timeoutlen=500
let mapleader=','
set backspace=2
set autoindent
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set foldmethod=indent
set nofoldenable
set cursorline "highlight current line
set omnifunc=syntaxcomplete#Complete
set clipboard=unnamed,unnamedplus " Copy into *, + registers"
set scrolloff=6
set completeopt-=preview
set ignorecase
set smartcase
set encoding=utf-8
set noshowmode
set laststatus=2
set wildignore+=*/package_lock.json
set wildignore+=package_lock.json
set wildignore+=*/*.scss/
set wildignore+=*/node_modules/*
set wildignore+=*/logs/*
"set wildmode=longest,list
"set backspace=indent,eol,start

packloadall
silent! helptags ALL

set rtp+=~/.vim/bundle/Vundle.vim
"===== Plugins ======"
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
"Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'prettier/vim-prettier', {'do': 'npm install'}
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'APZelos/blamer.nvim'
Plugin 'morhetz/gruvbox'
Plugin 'posva/vim-vue'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'tpope/vim-commentary'
Plugin 'tomtom/tcomment_vim'
"Plugin 'mattn/vim-lsp-settings'
"Plugin 'prabirshrestha/vim-lsp'
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'dense-analysis/ale'
"Plugin 'fatih/vim-go'
"===https://github.com/airblade/vim-gitgutter
"==="
"Plugin 'puremourning/vimspector'
"Plugin 'mattn/emmet-vim'

call vundle#end()

"===== Disable arrow keys ====="
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

"===== Remap navigation keys ====="
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"===== Remap keys ====="
inoremap ,, <esc>
vnoremap <leader><leader> <esc>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>vi :edit ~/.vim/vimrc<CR>
map <Del> :w <CR> :!clear && g++ -g % -o %< && ./%< <CR>
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <expr> <leader>f :vimgrep .input() \|<CR>

"===== resize windows ====="
"nnoremap L :vertical res +10<CR>
"nnoremap H :vertical res -10<CR>

"===== remap terminal keybindings ====="
tnoremap <Esc> <C-\><C-n>

"===== fzf mapping ====="
nnoremap <C-p> :<C-u>FZF<CR>

"===== Turn off swap files ====="
set noswapfile
set nobackup
set nowb

"===== Nerdtree ====="
nnoremap <leader>no :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"===== Vim-fugitive ====="
"nnoremap <leader>gd :G diff %<CR>

" Show hidden file by default
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

"===== gruvbox ====="
colorscheme gruvbox
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
hi LineNr term=bold cterm=bold ctermfg=8 guifg=Grey guibg=grey9
hi MatchParen term=bold cterm=bold ctermfg=Cyan ctermbg=DarkGrey 
"hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkred guifg=white

"===== emmet-vim ====="
"let g:user_emmet_leader_key='.'

"===== YCM ====="
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/start/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
nnoremap <silent> <leader>go :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <leader>re :YcmCompleter GoToReferences<CR>
nnoremap <silent> <leader>fi :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>ge :YcmCompleter GetDoc<CR>
"nnoremap <silent> <leader>fo :YcmCompleter Format<CR>
nmap <leader>D <Plug>(YCMHover)
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.', '#'],
  \   'cpp,cuda,objcpp': ['->', '.', '::', '#'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby,rust': ['.', '::'],
  \   'lua': ['.', ':'],
  \ }

augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END

"===== ALE ====="
let g:ale_linters = {'cpp': ['clang', 'clangd'], "*": ["remove_trailing_lines"],
\ 'typescript': ['tslint', 'eslint', 'tsserver'],
\ 'typescriptreact': ['tslint', 'tsserver', 'eslint'],
\ 'javascript': ['tsserver', 'prettier', 'eslint'],
\ 'python': ['flake8']
\}
let g:ale_fixers = {"*": ['prettier', 'eslint', 'trim_whitespace'],
\ "cpp": ['clang-format','clangtidy', 'astyle'],
\ "go":['gofmt', 'goimports'],
\ 'typescript': ['prettier', 'eslint'],
\ 'javascript': ['prettier', 'eslint', 'tsserver'],
\ 'python': ['autopep8']
\}
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_completion_enabled=1
let g:ale_completion_autoimport=1
let g:ale_floating_preview=1
let g:ale_hover_to_preview=1
let g:ale_detail_to_floating_preview=1
let g:ale_hover_to_floating_preview=1
let g:ale_c_parse_compile_commands=1
"nmap e[ <Plug>(ale_previous)
"nmap e] <Plug>(ale_next)
"nmap ]f <Plug>(ale_fix)
"nmap <leader>h <Plug>(ale_hover)
"nnoremap <leader>fre :ALEFindReferences -vsplit<CR>
"imap <C-space> <Plug>(ale_complete)
"inoremap <silent> <C-a> <C-\><C-O>:ALEComplete<CR>

"Display signature help when calling a function
augroup HoverAfterComplete
        autocmd!
        "" display argument list of the selected completion candidate using ALEHover
        autocmd User ALECompletePost ALEHover
        autocmd User ALECompletePost ALEFix
augroup END

"===== SNIPPETS ====="
nnoremap ,html :-1read $HOME/.vim/snippets/html:5.html<CR>5jwf>a
nnoremap ,vue :-1read $HOME/.vim/snippets/base.vue<CR>1jwf>a

"===== Vim airline ====="
let g:airline_theme="base16"
"theme options: badwolf, base16
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#show_buffers = 1

"===== Vimspector ====="
let g:vimspector_enable_mappings="HUMAN"
packadd! vimspector
nnoremap <leader>dl :call vimspector#Launch()<CR>
nmap <leader>di <Plug>VimspectorStepInto
nmap <leader>do <Plug>VimspectorStepOver
nmap <leader>du <Plug>VimspectorStepOut
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

"===== Custom command for vimgrep ====="
"command! -nargs=1 S execute 'vimgrep /<args>/g % | :cope'
""ignore case /pattern\c/
"command! -nargs=1 Si execute 'vimgrep /<args>\c/g % | :cope'
"command! -nargs=1 Si execute 'vimgrep /<args>\c/g ** | :cope'

"===== Coc code navigation ====="
"nmap <buffer> <C-j>d <Plug>(coc-definition)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
vmap <leader>fo <Plug>(coc-format-selected)
nmap <leader>fo <Plug>(coc-format-selected)

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"===== vim-lsp ====="
let g:lsp_log_file = expand('~/lsp-log.log')
nmap <buffer> <leader>z <plug>(lsp-definition)

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

"if executable('typescript-language-server')
  "autocmd User lsp_setup call lsp#register_server({
    "\ 'name': 'typescript-language-server',
    "\'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']}
    "\ 'allowlist': ['javascript', 'typescript'],
    "\  })
"endif

"===== Vim-go ====="
"let g:go_bin_path = "/home/jason/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/bin
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType vue setlocal commentstring={/*\ %s\ */}

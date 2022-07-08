filetype off
syntax enable
set nocompatible
set showcmd
set wildmenu "enhanced completion in command-mode
set nu
set hls
set incsearch
set relativenumber
set timeoutlen=800
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
set clipboard=unnamed,unnamedplus " Copy into *, + registers"
set scrolloff=10
set completeopt-=preview
set ignorecase
set smartcase
set encoding=utf-8
set noshowmode
set laststatus=2
set showtabline=2
set wildignore+=*/package_lock.json
set wildignore+=package_lock.json
set wildignore+=*/*.scss/
set wildignore+=*/node_modules/*
set wildignore+=*/logs/*
set omnifunc=syntaxcomplete#Complete
"set wildmode=longest,list
"set backspace=indent,eol,start

packloadall
silent! helptags ALL

set rtp+=~/.vim/bundle/Vundle.vim
"===== Plugins ======"
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'prettier/vim-prettier', {'do': 'npm install'}
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'APZelos/blamer.nvim'
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/everforest'
Plugin 'posva/vim-vue'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tomtom/tcomment_vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mileszs/ack.vim'
Plugin 'neovim/nvim-lspconfig'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'
" Plugin 'jose-elias-alvarez/null-ls.nvim'
" Plugin 'jose-elias-alvarez/nvim-lsp-ts-utils'
"Plugin 'preservim/nerdcommenter'
" Plugin 'tpope/vim-commentary'
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
inoremap <leader><leader> <esc>
vnoremap <leader><leader> <esc>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gu :diffget //2<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>vi :edit ~/.vim/vimrc<CR>
map <Del> :w <CR> :!clear && g++ -g % -o %< && ./%< <CR>
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <leader>w <C-w>

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

" Show hidden file by default
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

"===== gruvbox ====="
colorscheme everforest
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
hi LineNr term=bold cterm=bold ctermfg=8 guifg=Grey guibg=grey9
hi MatchParen term=bold cterm=bold ctermfg=LightCyan ctermbg=Grey
hi Visual term=bold cterm=bold ctermfg=LightMagenta ctermbg=DarkGrey
"hi CursorLine   cterm=NONE ctermbg=darkgrey ctermfg=white guibg=darkred guifg=white

""""""""""""""""""""""""""""""""
"         vim-airline          "
""""""""""""""""""""""""""""""""
let g:airline_theme="everforest"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr = ' Col:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y=''
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
" let g:airline_symbols.branch = '⎇'

""""""""""""""""""""""""""""""""
"      Coc code navigation     "
""""""""""""""""""""""""""""""""
" nmap <buffer> <C-j>d <Plug>(coc-definition)
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>di <Plug>(coc-implementation)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dt <Plug>(coc-type-definition)
" vmap <leader>fo <Plug>(coc-format-selected)
" nmap <leader>fo <Plug>(coc-format-selected)
"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> K :call ShowDocumentation()<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

try
    nmap <silent> ]e :call CocAction('diagnosticNext')<cr>
    nmap <silent> [e :call CocAction('diagnosticPrevious')<cr>
endtry

" hi CocErrorSign ctermfg=DarkRed guibg=#d1666a
" hi CocInfoSign guibg=#353b45
" hi CocWarningSign guifg=#d1cd66 guibg=#d1cd66
" hi CocErrorHighlight ctermfg=DarkRed  guifg=#ff0000
" hi CocErrorLine ctermfg=DarkRed  guifg=#d1666a
hi CocErrorVirtualText ctermfg=203 ctermbg=237
" hi CocWarningVirtualText ctermfg=DarkRed  guifg=#ff0000

""""""""""""""""""""""""""""""""
"           vim-lsp            "
""""""""""""""""""""""""""""""""
let g:lsp_log_file = expand('~/lsp-log.log')
let g:lsp_settings_filetype_javascript=['typescript-language-server']
let g:lsp_settings_filetype_typescript=['typescript-language-server']
" let g:lsp_settings_filetype_vue=['volar-server']
autocmd BufRead,BufNewFile *.vue let b:asyncomplete_enable=0
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

" if executable('typescript-language-server')
"   autocmd User lsp_setup call lsp#register_server({
"     \ 'name': 'typescript-language-server',
"     \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']}
"     \ 'allowlist': ['javascript', 'typescript'],
"     \  })
" endif

""""""""""""""""""""""""""""""""
"    vim-lsp keybindings       "
""""""""""""""""""""""""""""""""
" nnoremap <leader>dd :LspDefinition<cr>
" nnoremap <leader>dn :LspNextDiagnostic<cr>
" nnoremap <leader>dp :LspPreviousDiagnostic<cr>
" nnoremap <leader>df :LspReferences<cr>
" nnoremap <leader>ds :LspSignatureHelp<cr>
" nnoremap <leader>dp :LspPeekDefinition<cr>
" nnoremap <leader>da :LspCodeAction<cr>
" nnoremap <leader>dh :LspHover<cr>
" inoremap <expr> <Tab>   pumvisible() ? '\<C-n>' : '\<Tab>'
" inoremap <expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : '\<cr>'

""""""""""""""""""""""""""""""""
"             FZF              "
""""""""""""""""""""""""""""""""
" set FZF respect .gitignore
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'

"""""""""""""""""""""""""""""""""
"             YCM               "
"""""""""""""""""""""""""""""""""
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/start/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" nnoremap <silent> <leader>go :YcmCompleter GoToDefinition<CR>
" nnoremap <silent> <leader>re :YcmCompleter GoToReferences<CR>
" nnoremap <silent> <leader>fi :YcmCompleter FixIt<CR>
" nnoremap <silent> <leader>ge :YcmCompleter GetDoc<CR>
" "nnoremap <silent> <leader>fo :YcmCompleter Format<CR>
" nmap <leader>D <Plug>(YCMHover)
" let g:ycm_semantic_triggers =  {
"   \   'c': ['->', '.', '#'],
"   \   'cpp,cuda,objcpp': ['->', '.', '::', '#'],
"   \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
"   \   'ruby,rust': ['.', '::'],
"   \   'lua': ['.', ':'],
"   \ }
"
" augroup MyYCMCustom
"   autocmd!
"   autocmd FileType c,cpp let b:ycm_hover = {
"     \ 'command': 'GetDoc',
"     \ 'syntax': &filetype
"     \ }
" augroup END

"===== Vimspector ====="
" let g:vimspector_enable_mappings="HUMAN"
" packadd! vimspector
" nnoremap <leader>dl :call vimspector#Launch()<CR>
" nmap <leader>di <Plug>VimspectorStepInto
" nmap <leader>do <Plug>VimspectorStepOver
" nmap <leader>du <Plug>VimspectorStepOut
" nnoremap <leader>dr :call vimspector#Reset()<CR>
" nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

""""""""""""""""""""""""""""""""
"           vim-go             "
""""""""""""""""""""""""""""""""

"let g:go_bin_path = "/home/jason/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/go/bin

"===== Custom command for vimgrep ====="
"command! -nargs=1 S execute 'vimgrep /<args>/g % | :cope'
""ignore case /pattern\c/
"command! -nargs=1 Si execute 'vimgrep /<args>\c/g % | :cope'
"command! -nargs=1 Si execute 'vimgrep /<args>\c/g ** | :cope'

"===== emmet-vim ====="
"let g:user_emmet_leader_key='.'

"===== ALE ====="
" let g:ale_linters = {'cpp': ['clang', 'clangd'], "*": ["remove_trailing_lines"],
" \ 'typescript': ['tslint', 'eslint', 'tsserver'],
" \ 'typescriptreact': ['tslint', 'tsserver', 'eslint'],
" \ 'javascript': ['tsserver', 'prettier', 'eslint'],
" \ 'python': ['flake8']
" \}
" let g:ale_fixers = {"*": ['prettier', 'eslint', 'trim_whitespace'],
" \ "cpp": ['clang-format','clangtidy', 'astyle'],
" \ "go":['gofmt', 'goimports'],
" \ 'typescript': ['prettier', 'eslint'],
" \ 'javascript': ['prettier', 'eslint', 'tsserver'],
" \ 'python': ['autopep8']
" \}
" let g:ale_echo_msg_error_str = 'Error'
" let g:ale_echo_msg_warning_str = 'Warning'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_completion_enabled=1
" let g:ale_completion_autoimport=1
" let g:ale_floating_preview=1
" let g:ale_hover_to_preview=1
" let g:ale_detail_to_floating_preview=1
" let g:ale_hover_to_floating_preview=1
" let g:ale_c_parse_compile_commands=1
"nmap e[ <Plug>(ale_previous)
"nmap e] <Plug>(ale_next)
"nmap ]f <Plug>(ale_fix)
"nmap <leader>h <Plug>(ale_hover)
"nnoremap <leader>fre :ALEFindReferences -vsplit<CR>
"imap <C-space> <Plug>(ale_complete)
"inoremap <silent> <C-a> <C-\><C-O>:ALEComplete<CR>

"Display signature help when calling a function
" augroup HoverAfterComplete
"         autocmd!
"         "" display argument list of the selected completion candidate using ALEHover
"         autocmd User ALECompletePost ALEHover
"         autocmd User ALECompletePost ALEFix
" augroup END

"===== SNIPPETS ====="
" nnoremap ,html :-1read $HOME/.vim/snippets/html:5.html<CR>5jwf>a
" nnoremap ,vue :-1read $HOME/.vim/snippets/base.vue<CR>1jwf>a


"""""""""""""""""""""""""""""""""
"         vim-fugitive          "
"""""""""""""""""""""""""""""""""
"nnoremap <leader>gd :G diff %<CR>

lua <<EOF
-- print("Hello Lua")
EOF

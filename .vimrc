execute pathogen#infect()
syntax on
filetype plugin indent on
set textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set wrap
set scrolloff=5
set dir=/tmp//
set background=dark
set backspace=indent,eol,start
set number

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
set t_Co=16
colorscheme solarized

" ===============    Commands    ===============
command -nargs=1 Ggrep :Git grep <args>
command -nargs=0 Gblame :Git blame

augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup end

" =============== Plugin Options ===============
set rtp+=/usr/local/opt/fzf
let g:CommandTMaxHeight = 15
let g:CommandTMatchWindowAtTop = 1
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
let g:CommandTFileScanner = 'git'
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 1
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:vimux_ruby_file_relative_paths = 1
let g:vimux_ruby_cmd_unit_test = "halo test authentication"
let test#strategy = 'vimux'

" =============== Shortcuts ====================
" NerdTree
map <silent> <leader>nt :NERDTreeToggle<CR>
map <silent> <leader>nr :NERDTree<CR>
map <silent> <leader>nf :NERDTreeFind<CR>

" FZF
map <silent> <leader>ff :FZF<CR>

" Vimux
map <silent> <leader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <leader>rb :wa<CR> :TestFile<CR>
map <silent> <leader>rf :wa<CR> :TestNearest<CR>

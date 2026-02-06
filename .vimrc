execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd FileType ruby setlocal textwidth=0 tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType typescript,typescriptreact setlocal noexpandtab shiftwidth=4 tabstop=4
set wrap
set scrolloff=5
set dir=/tmp//
set background=dark
set backspace=indent,eol,start
set number


set t_Co=256
colorscheme dracula

source ~/.vim/bundle/fzf.vim/plugin/fzf.vim

" ===============    Commands    ===============
command -nargs=1 Ggrep :Git grep <args>
command -nargs=0 Gblame :Git blame

augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup end

" =============== Plugin Options ===============
set rtp+=/opt/homebrew/bin/fzf
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
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint', 'prettier']
\ }
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint', 'tsserver']
\ }
let g:ale_typescript_eslint_use_global = 0
let g:ale_typescript_eslint_executable = 'eslint'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:vimux_ruby_file_relative_paths = 1
let g:vimux_ruby_cmd_unit_test = "halo test authentication"
let test#strategy = 'vimux'
set cursorline    " enable the horizontal line
set cursorcolumn  " enable the vertical line

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

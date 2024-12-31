" dir settings
let g:python3_host_prog = expand('~/.pyenv/versions/anaconda3-4.4.0/envs/py35/bin/python')
let g:python_host_prog = expand('~/.pyenv/versions/anaconda3-4.4.0/envs/py27/bin/python')
if &compatible
  set nocompatible
endif

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" シンタックスプラグインの設定
" -----------------------------------------------------
let g:jsx_ext_required = 0
let g:vim_json_syntax_conceal = 0
" -----------------------------------------------------

" モード切替
" -----------------------------------------------------
inoremap <silent> jj <ESC> 
" -----------------------------------------------------

" filetype設定
" -----------------------------------------------------
autocmd BufRead,BufNewFile *.rs setfiletype rust
autocmd BufRead,BufNewFile *.vue setfiletype html

autocmd FileType php :setlocal expandtab
autocmd FileType php :setlocal softtabstop=4
autocmd FileType php :setlocal shiftwidth=4
" -----------------------------------------------------

" dein設定
" -----------------------------------------------------
let g:base_dir = expand('~/.config/nvim')

let s:dein_dir = g:base_dir . '/plugins'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" execute 'set runtimepath+=' . g:base_dir . '/myplugins'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.config/nvim')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" -----------------------------------------------------

" 汎用設定
" -----------------------------------------------------
filetype plugin indent on
syntax enable
set expandtab tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.scss setlocal noexpandtab
autocmd BufRead,BufNewFile *.css setlocal noexpandtab
autocmd BufRead,BufNewFile *.php setlocal noexpandtab

set noswapfile nobackup undofile
execute 'set undodir=' . g:base_dir . '/tmp'
let mapleader = "\<Space>"

inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap (; ();<Left><Left>
inoremap () ()
inoremap (<CR> (<CR><CR>)<Up><ESC>S
inoremap { {}<Left>
inoremap {; {};<Left><Left>
inoremap {} {}
inoremap {<CR> {<CR><CR>}<Up><ESC>S
inoremap [ []<Left>
inoremap [; [];<Left><Left>
inoremap [] []
inoremap [<CR> [<CR><CR>]<Up><ESC>S

nnoremap <Tab>l :tabnext<Return>
nnoremap <Tab>h :tabprev<Return>
for n in range(1, 9)
  execute 'nnoremap <Tab>'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
nnoremap H gT
nnoremap L gt
nnoremap <Space><Return> :QuickRun make<Return>
tnoremap <C-]> <C-\><C-n>

let g:quickrun_config = {
\   "make" : {
\       "command" : "make",
\       "exec" : "%c run",
\   },
\}

let g:tex_flavor='latex'
" -----------------------------------------------------

" colorscheme
" -----------------------------------------------------
set background=dark
colorscheme hybrid
highlight Normal ctermbg=none

set relativenumber number cursorline
highlight LineNr ctermfg=69
highlight CursorLineNr ctermfg=81
" -----------------------------------------------------

" 前回カーソル位置
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

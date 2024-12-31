if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/Users/ctare/.config/nvim/plugins/repos/github.com/Shougo/dein.vim/,/Users/ctare/.config/nvim,/etc/xdg/nvim,/Users/ctare/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/ctare/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/ctare/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/ctare/.vim/init.vim', '/Users/ctare/.config/nvim/dein.toml', '/Users/ctare/.config/nvim/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/ctare/.config/nvim/plugins'
let g:dein#_runtime_path = '/Users/ctare/.config/nvim/plugins/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/ctare/.config/nvim/plugins/.cache/init.vim'
let &runtimepath = '/Users/ctare/.config/nvim/plugins/repos/github.com/Shougo/dein.vim/,/Users/ctare/.config/nvim,/etc/xdg/nvim,/Users/ctare/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/ctare/.config/nvim/plugins/repos/github.com/Shougo/dein.vim,/Users/ctare/.config/nvim/plugins/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.4.4_2/share/nvim/runtime,/Users/ctare/.config/nvim/plugins/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/ctare/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/ctare/.config/nvim/after'
filetype off
  map <C-n> :NERDTreeToggle<CR>
 let g:auto_save = 1

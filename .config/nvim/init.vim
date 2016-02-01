" --- {{{ NeoBundle 
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible
endif

set runtimepath^=~/.config/nvim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'bling/vim-airline'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer',  { 'build' : { 'unix': 'cargo build --release' } }

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" }}}


" --- {{{ Bundle configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set hidden " Needed by racer

let $RUST_SRC_PATH = "/usr/src/rust/src"
let g:racer_cmd = "/usr/bin/racer"
" }}}


" --- {{{ NVim configuration
if has('gui_running')
	set gfn=Inconsolata\ for\ Powerline\ 9
	set lsp=-2
endif

syntax on

set is hls sm wmnu

set nowrap nu rnu 
set sw=4 ts=4 sts=4 noet tw=80 cino=g0,N-s fmr={{{,}}} fdm=marker " spell
" }}}

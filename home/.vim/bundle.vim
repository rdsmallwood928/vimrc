set nocompatible
filetype off

call plug#begin('~/.vim/bundle')

"Colorschemes
Plug 'altercation/vim-colors-solarized'

"Git stuff
Plug 'motemen/git-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'mhinz/vim-signify'

"Syntax etc.
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/bash-support.vim'
Plug 'tpope/vim-markdown'
Plug 'puppetlabs/puppet-syntax-vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'groenewege/vim-less'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'

"Other tools
Plug 'vim-scripts/bufexplorer.zip'
Plug 'tmatilai/gitolite.vim'
Plug 'ervandew/supertab'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
if executable('ctags')
  Plug 'majutsushi/tagbar'
endif
Plug 'edsono/vim-matchit'
Plug 'bronson/vim-trailing-whitespace'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'szw/vim-tags'
Plug 'rking/ag.vim', { 'on': 'Ag' }

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/neocomplcache.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dansomething/vim-eclim'

if v:version > 703 || (v:version == 703 && has('patch584'))
	function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
	  " - status: 'installed', 'updated', or 'unchanged'
	  " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
	  	!./install.py
	  endif
  endfunction
	Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif
call plug#end()

filetype plugin indent on

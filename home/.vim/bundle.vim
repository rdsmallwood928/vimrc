set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"Colorschemes
Bundle 'altercation/vim-colors-solarized'

"Git stuff
Bundle 'motemen/git-vim'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'
Bundle 'mhinz/vim-signify'

"Syntax etc.
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/bash-support.vim'
Bundle 'tpope/vim-markdown'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'fatih/vim-go'

"Other tools
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'tmatilai/gitolite.vim'
Bundle 'ervandew/supertab'
Bundle 'sickill/vim-pasta'
Bundle 'sjl/gundo.vim'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'edsono/vim-matchit'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'edkolev/promptline.vim'
Bundle 'rking/ag.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'tpope/vim-surround'
Bundle 'editorconfig/editorconfig-vim'

filetype plugin indent on

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
Bundle 'airblade/vim-gitgutter'

"Syntax etc.
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/bash-support.vim'
Bundle 'tpope/vim-markdown'
Bundle 'puppetlabs/puppet-syntax-vim'

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

filetype plugin indent on

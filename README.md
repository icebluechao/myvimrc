# myvimrc
1. cp .vimrc .vim ~ -rf
2. mkdir ~/.vim/bundle
3. git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
4. push button F6 to install plugins in vim
5. sudo apt-get install cmake python-dev build-essential
6. git clone https://github.com/powerline/fonts.git
7. cd fonts
8. ./install.sh
9. cd ~/.vim/bundle/YouCompleteMe
10. ./install.py --clang-completer --gocode-completer
11. cd ~/.vim/bundle/YCM-Generator/
12. ./config_gen.py {work_dir}

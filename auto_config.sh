#! /bin/bash
vimrc=~/.vimrc
vimrcbak=~/.vimrc-`date +%Y-%m-%d-%H-%m-%s`
vimplugin=~/.vim/bundle 
# current_time= $(`date +%Y-%m-%d-%H-%m-%s`)
if [ -e ${vimrc} ];
then
    echo "$vimrc is already exist，bakup to $vimrcbak !"
    cp $vimrc $vimrcbak
    rm $vimrc;
#else
#    echo "$vimrc isn't exist!";
fi
echo "copy .vimrc to ~/.vimrc"
cp -p ./.vimrc $vimrc

echo "create plugin directory"
mkdir -p $vimplugin
echo "copy .vimrc.plugins to ~/.vimrc.plugins"
# cp ./.vimrc.plugins $vimrc

echo "download molokai colorscheme"
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
git clone https://github.com/tomasr/molokai ~/.vim/molokai
cp -r ~/.vim/molokai/colors ~/.vim/

echo "start downloading vundle..."
echo "downloading vundle..."
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "finish downloading vundle"

echo "install plugins"
vim +PluginInstall +qall
echo "install plugins over"
echo -e "\033[33mif you force to abort the install plugins process,\nThose plugins probaley was’t installed completely! \033[0m"
echo "please execute following command reinstall plugins"
echo -e "\033[31m vim +PluginInstall +qall \033[0m"

echo "vim config over！"

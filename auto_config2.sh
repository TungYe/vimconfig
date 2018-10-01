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
echo "copy .vimrc2 to ~/.vimrc"
if [ -e $vimplugin/vundle ];
then
    echo "remove direcotry: ${vimplugin}/vundle"
    rm -rdf $vimplugin/vundle;
fi
cp -p ./.vimrc2 $vimrc
vim
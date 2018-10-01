# vimconfig
#### vim 配置
clone本项目到本地，执行脚本[auto_config.sh](https://github.com/TungYe/vimconfig/blob/master/auto_config.sh)可以自动配置，配置之前可以修改 .vimrc.plugins文件，配置自己想安装插件
##### 执行脚本[auto_config2.sh](https://github.com/TungYe/vimconfig/blob/master/auto_config2.sh)自动配置更加方便
#### 插件管理 [Vundle](https://github.com/VundleVim/Vundle.vim)介绍
#### 在用户目录下创建vim的配置文件 ~/.vimrc,具体内容查看文件[.vimrc](https://github.com/TungYe/vimconfig/blob/master/.vimrc)
```
# touch ~/.vimrc
```

#### 创建vim插件目录 ~/.vim/plugins
```
# mkdir ~/.vim/plugins
```

####  创建要安装的vim插件列表文件 ~/.vimrc.plugins,具体内容查看文件[.vimrc.plugins](https://github.com/TungYe/vimconfig/blob/master/.vimrc.plugins)
```
# touch ~/.vimrc.plugins
```
##### 在~/.vimrc文件加入以下代码片段以支持将插件配置放在一个分离的 ~/.vimrc.plugins 文件中
```
if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif
```
#### 安装vim的插件管理工具vundle,它能够搜索、安装、更新和移除vim插件
```
git clone https://github.com/gmarik/vundle.git ~/.vim/plugins/vundle
or
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
##### 在.vimrc.plugins配置文件中添加vundle支持
```
filetype off
set rtp+=~/.vim/plugins/vundle/
call vundle#rc()
```
#### 安装vim插件
打开vim，运行:PluginInstall 或在shell中直接运行vim +PluginInstall +qall

注意:Plugin 'gmarik/vundle'中 Plugin 后面的是单引号，双引号会报错</br>
参考项目了项目 [ConfigurationFiles](https://github.com/samlaudev/ConfigurationFiles/)

vimwork.vim
===========
設定ファイル

Windowsの環境構築

1. chocolatey
```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```
cinst google-chrome-x64
cinst SakuraEditor
cinst gitextensions
cinst winmerge-jp
```

2. not chocolatey
https://www.apachefriends.org/jp/index.html
http://www.kaoriya.net/
http://www.geocities.co.jp/SiliconValley-SanJose/8165/winmerge.html
http://rei.to/carotdav.html

2. neobundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone git://github.com/yamaakikenta/vimwork.vim ~/.vim/bundle/vomwork.vim

3. vimrc
set rtp+=~/dropbox/vim/vomwork.vim
so ~/dropbox/vim/vomwork.vim/local/win7.vim
call vimwork#neobundle#init()



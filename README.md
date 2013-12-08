vimwork.vim
===========
設定ファイル

1. install
http://sakura.qp.land.to/?Install%2FSakuraDown
http://www.kaoriya.net/
http://www.mozilla.jp/firefox/
https://code.google.com/p/gitextensions/
https://www.google.com/intl/ja/chrome/browser/
http://www.seleniumhq.org/download/
http://www.geocities.co.jp/SiliconValley-SanJose/8165/winmerge.html
http://ccleaner.softonic.jp/
http://rei.to/carotdav.html

2. neobundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone git://github.com/yamaakikenta/vimwork.vim ~/.vim/bundle/vomwork.vim

3. vimrc
set rtp+=~/dropbox/vim/vomwork.vim
so ~/dropbox/vim/vomwork.vim/local/win7.vim
call vimwork#neobundle#init()


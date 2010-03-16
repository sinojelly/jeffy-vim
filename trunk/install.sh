#!/bin/bash

echo "This install bash will not backup your old vim files."
echo "Please backup your old vim files manually."
echo -n "Did you backup your old vim files? (y|n)"
read ret
if test $ret = n ; then
	echo "Install exit."
	exit
fi

### install new files
echo -n "Install new vim files..."
# remove old files
rm -rf ~/.vim ~/.vimrc
# copy new files
cp -r ./vim ~/.vim
cp ./vimrc ~/.vimrc
# remove all hidden files, such as .svn ...
find ~/.vim -type d -name '.svn' | xargs rm -rf
echo "done!" 

### install getscript.vba
echo -n "Install getscript.vba..."
vim -c "so %" -c "q" getscript.vba
echo "done!"

### update scripts
echo -n "Do you update scripts now? (y|n)"
read ret
if test $ret = n ; then
	echo "Install exit."
	exit
fi
echo -n "Update scripts..."
vim "+GetScripts" "+q"
echo "done!"

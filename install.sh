#/bin/bash
echo "Installing wpsql-cli on bin directory to make avaiable globally, at any directory at the system"
rm -rf ~/bin/wpsql-cli-folder
rm -rf ~/bin/wpsql-cli
mkdir ~/bin/wpsql-cli-folder
cp -r * ~/bin/wpsql-cli-folder/
ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli
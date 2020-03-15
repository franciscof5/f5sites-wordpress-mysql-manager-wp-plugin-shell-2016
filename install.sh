#/bin/bash
echo "Installing wpsql-cli on current user's bin directory to make avaiable globally, at any directory at the system"

file="config.sh"
if [ -f "$file" ]
then
	echo "$file found."
	echo "removing old install if exists"
	rm -rf /bin/wpsql-cli-folder
	rm -rf /bin/wpsql-cli
	echo "creating dir in /bin"
	mkdir /bin/wpsql-cli-folder
	echo "copying files"
	cp -r * /bin/wpsql-cli-folder/
	echo "(cd /bin/wpsql-cli-folder/ && exec /bin/wpsql-cli-folder/wpsql-cli.sh \$1 \$2 \$3)" > /bin/wpsql
	#ln -s ~/bin/wpsql-cli-folder/wpsql-cli.sh ~/bin/wpsql-cli
	sudo chmod +x /bin/wpsql
	echo "Installation successfully"
	echo "You can run 'wpsql' command from any directory for the current user"
else
	echo "$file not found."
	echo "You must create a config.sh file before install, please check README on root folder"
fi

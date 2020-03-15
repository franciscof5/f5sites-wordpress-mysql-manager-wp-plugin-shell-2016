# Configuration file
echo "Load configuration file... (to change it open config.sh)"
file="config.sh"
if [ -f "$file" ]
then
	echo "$file found."
	source config.sh
else
	echo "$file not found."
	echo "You must create a config.sh file before install, please check README on root folder"
fi

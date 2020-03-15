# Configuration file
echo "Load configuration file... (to change it open config.sh)"
file="config.sh"
if [ -f "$file" ]
then
	echo "$file found."
	source config.sh
else
	echo "Create a config.sh file, not foud"
fi

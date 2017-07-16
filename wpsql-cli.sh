#!/bin/bash
case "$1" in
   -a | --auto) echo "Selected 1 - Auto Sync" 
   	OPERATION="auto-sync"
   ;;
   -m | --manual) echo "Selected - Manual Sync"
	while [ "$2" != "" ]; do
	    case $2 in
	        -e | --export )           shift
	            filename=$1
	        ;;
	        -i | --import )    
				interactive=1
	        ;;
	    esac
	    shift
	done
   	#source mysql-prompts/get-tables-complement.sh
   ;;
   -b | --backup) echo "Selected - Backup" 
   	OPERATION="auto-sync"
   ;;
   -w | --wizard) echo "Wizard" 
   	source wizard.sh
   ;;
   -h | --help) echo "HELP"
	echo "Commands lists:"
	echo "-a | --auto   : auto sync between servers instances by highest wp post_id on selected table"
	echo "-m | --manual : manual select SQL sync direction (-e for exporting, -i for importing)"
	echo "-b | --backup : just perfom a backup (-l local backup, -r remote backup)"
   	echo "-w | --wizard : to run a step-by-step wizard"
   	echo "-h | --help   : help text"
   	echo "Don't forget to config it, for detailed instructions see readme.MD"
   	source mysql-saudations/end.sh
   ;;
esac
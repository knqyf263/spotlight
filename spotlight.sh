#!/bin/sh

########################################
# Name:spotlight script
#
# about:
#
# Usage:spotlight utilities
#
# Author:Teppei Fukuda
# Date:6 12 10:41:54 JST 2013
########################################

 
cmd=$1
 
usage() {
	echo "Usage: `basename $0` <start|stop|reconst|check [volume]>"
}

if [ $# -ge 3 ]; then
	usage
	exit 1
fi
     
case $cmd in
	'start')
		if [ $# -eq 1 ]; then
			sudo mdutil -a -i on
		elif [ $# -eq 2]; then
			sudo mdutil  -i on $2
		fi
		;;
	'stop')
		if [ $# -eq 1 ]; then
			sudo mdutil -a -i off 
		elif [ $# -eq 2]; then
			sudo mdutil  -i off $2
		fi
		;;
	'reconst')
		if [ $# -eq 1 ]; then
			sudo mdutil -E /
		elif [ $# -eq 2]; then
			sudo mdutil -E $2
		fi
		;;
	'check')
		if [ $# -ne 2 ]; then
			usage
			exit 1
		fi
		mdutil -s $2
		;;
	*)
		usage
		exit 1
		;;
esac

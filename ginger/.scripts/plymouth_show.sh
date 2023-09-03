#!/bin/bash

R='\033[1;31m'
check_root () {
	if [ ! $( id -u ) -eq 0 ]; then
		echo -e $R"Must be run as root"
		exit
	fi
}
check_root

duration=$1
if [ $# -ne 1 ]; then
	duration=5
fi

plymouthd; plymouth --show-splash; for ((I=0; I<$duration; I++)); do plymouth --update=test$I; sleep 1; done; plymouth quit

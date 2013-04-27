#!/bin/bash
#
# execute remote command that needs sudo 
#
#
#ssh		=> $1
#command	=> $2

if [[ $# -eq 2 ]]; then
	
	echo -n "sudo pour $1 > "
	read -s pass
	
	if [ -n "$pass" ]; then 
		
		echo ""
		ssh $1 "echo $pass  | sudo -S $2"
		echo ""
	
	else echo "missing password for sudo on $1"
	fi
else
	echo ""
	echo "missing argument(s) : ssh name from ssh config file or command to execute"
	echo ""
fi

exit 0

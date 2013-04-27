#!/bin/sh


# Remove messages from a pop server
# Usage example :
# ./pop_del_all.sh MAX_NB_MSG | telnet HOST PORT 

username="username";
password="password";
max=$1
[ $# -eq 0 ] && exit 1 || :
sleep 2
echo USER $username
sleep 2 
echo PASS $password
sleep 2
for (( j = 1 ; j <= $max; j++ ))
do
echo DELE $j
sleep 2 
done
echo QUIT

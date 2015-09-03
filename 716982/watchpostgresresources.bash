#!/bin/bash

bouncerpid=`cat /var/run/postgresql/pgbouncer.pid`

while :
do
	timestamp=`date +%Y%m%d%H%M%S`
	nnetcons=`netstat -anp | grep -i postgres | grep ESTAB | grep tcp | wc -l`
	nbouncerfds=`ls -al /proc/$bouncerpid/fd | wc -l`
	filenr=`sysctl fs.file-nr | awk '{print $3" "$5}'`
	echo -n "$timestamp "
	echo -n "n_established_postgres_cons=$nnetcons "
	echo -n "n_pgbouncer_fds=$nbouncerfds "
	echo -n "fs.file-nr=$filenr"
	echo
	sleep 1
done

	

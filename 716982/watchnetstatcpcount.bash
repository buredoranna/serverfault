#!/bin/bash

pgbouncerpid=`cat /var/run/postgresql/pgbouncer.pid`

while :
do
	pgbouncerpid=`cat /var/run/postgresql/pgbouncer.pid`

	ntcpconns=`netstat -ant | wc -l`
	nesttcpconns=`netstat -ant | grep ESTABLISHED | wc -l`
	nwaittcpconns=`netstat -ant | grep WAIT | wc -l`
        filenr=`sysctl fs.file-nr | awk '{print $3":"$5}'`
	npgbouncerfd=`ls -al /proc/$pgbouncerpid/fd | wc -l`
        timestamp=`date +%Y%m%d%H%M%S`
	
	echo -n "$timestamp "
	echo -n "n_tcp_conns=$ntcpconns "
	echo -n "n_est_tcp_conns=$nesttcpconns "
	echo -n "n_wait_tcp_conns=$nwaittcpconns "
	echo -n "filenr=$filenr "
	echo -n "n_pgbouncer_fd=$npgbouncerfd"
	echo

	sleep 1
done


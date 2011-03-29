#!/bin/bash

if [ $# -ne 1 ] ; then
	echo 'Need one parameter'
	exit
fi

tmp_file='/tmp/a_s'
tmp_file2='/tmp/a_s2'

if [ -e $tmp_file ]; then
	rm $tmp_file
fi

if [ -e $tmp_file2 ]; then
	rm $tmp_file2
fi

touch $tmp_file

strings -e s $1 >> $tmp_file
#strings -e S $1 >> $tmp_file
strings -e l $1 >> $tmp_file
strings -e L $1 >> $tmp_file
strings -e b $1 >> $tmp_file
strings -e B $1 >> $tmp_file

IP_re='^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$'
URL_re='www\|http\|\/\/\|\.com'
path_re=\\\\

cat $tmp_file | sort | uniq | cat - > $tmp_file2
mv $tmp_file2 $tmp_file

echo '---> ### URLs & IPs ### <---'
echo
cat $tmp_file | grep $URL_re'\|'$IP_re
echo

echo '---> ### Paths ### <---'
echo
cat $tmp_file | grep $path_re
echo

echo '---> ### Other strings  ### <---'
echo
cat $tmp_file | grep -v $URL_re'\|'$IP_re'\|'$path_re

rm $tmp_file


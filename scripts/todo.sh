#!/usr/bin/env bash

DATE_TODAY=$(date +'%A, %d %B %Y')

touch -a ~/todo.txt

if ! cat ~/todo.txt | grep -q "$DATE_TODAY"; then
	echo >> ~/todo.txt
	echo "$DATE_TODAY" >> ~/todo.txt
	echo >> ~/todo.txt
fi

vim + ~/todo.txt  

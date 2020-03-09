#!/usr/bin/env bash

DATE_TODAY=$(date +'%A, %d %B %Y')

touch -a ~/todo/todo.txt

if ! cat ~/todo/todo.txt | grep -q "$DATE_TODAY"; then
	echo >> ~/todo/todo.txt
	echo "$DATE_TODAY" >> ~/todo/todo.txt
	echo "===========================">> ~/todo/todo.txt
	echo >> ~/todo.txt
fi

vim + ~/todo/todo.txt  

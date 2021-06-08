#!/usr/bin/env bash

DATE_TODAY=$(date +'%A, %d %B %Y')
TODO_DIR="$HOME/todo"
TODO_FILE="$TODO_DIR/todo.txt"

if [ "$1" == "priv" ]; then
  TODO_FILE="$TODO_DIR/todo_priv.txt"
elif [ "$1" == "note" ]; then
  TODO_FILE="$TODO_DIR/note.txt"
elif [ "$1" == "write" ]; then
  TODO_FILE="$TODO_DIR/write.txt"
fi

mkdir -p $TODO_DIR

# if not a git direcotry clone existing
if ! ls -a $TODO_DIR | grep -q .git; then
	git clone https://github.com/antoniszczepanik/todo.git $TODO_DIR
fi

# If there's no todays date in a file try pulling
if ! cat $TODO_FILE | grep -q "$DATE_TODAY"; then
	cd $TODO_DIR && git pull && cd -
fi

# Try once again and if still not append it
if ! cat $TODO_FILE | grep -q "$DATE_TODAY"; then
	echo >> $TODO_FILE
	echo "$DATE_TODAY" >> $TODO_FILE
	echo "===========================">> $TODO_FILE
	echo >> $TODO_FILE
fi

vim + $TODO_FILE && cd $TODO_DIR && git add -A && git commit -m 'update' > /dev/null

# remove swap files
find $TODO_DIR -name "*.swp" -type f -delete

# if commit made succesfully push in background
[ $? -eq 0 ] && git push </dev/null &>/dev/null &

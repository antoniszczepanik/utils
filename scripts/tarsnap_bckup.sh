#!/bin/sh

/usr/bin/tarsnap -c \
	-f "$(uname -n)-$(date +%Y-%m-%d_%H-%M-%S)" \
  --print-stats --humanize-numbers \
  --exclude "/home/antoni/.arduino15" \
  --exclude "/home/antoni/.buildroot-ccache" \
  --exclude "/home/antoni/.buildroot-dl" \
  --exclude "/home/antoni/.cache" \
  --exclude "/home/antoni/.cargo" \
  --exclude "/home/antoni/.config/Microsoft" \
  --exclude "/home/antoni/.dropbox-dist" \
  --exclude "/home/antoni/.gnugpg" \
  --exclude "/home/antoni/.googleearth" \
  --exclude "/home/antoni/.gradle" \
  --exclude "/home/antoni/.local" \
  --exclude "/home/antoni/.npm" \
  --exclude "/home/antoni/.rustup" \
  --exclude "/home/antoni/.ssh" \
  --exclude "/home/antoni/.steam" \
  --exclude "/home/antoni/.vscode" \
  --exclude "/home/antoni/.wine" \
  --exclude "/home/antoni/snap" \
  --exclude "/home/antoni/apps" \
  --exclude "/home/antoni/downloads" \
  --exclude "/home/antoni/backup/sem2/lines" \
  --exclude "/home/antoni/trash" \
  -v \
	/home/antoni


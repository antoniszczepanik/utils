#!/usr/bin/env bash

rsync -avzP \
  --human-readable \
  --exclude ".arduino15" \
  --exclude ".buildroot-ccache" \
  --exclude ".buildroot-dl" \
  --exclude ".cache" \
  --exclude ".cargo" \
  --exclude ".config/Microsoft" \
  --exclude ".dropbox-dist" \
  --exclude ".gnugpg" \
  --exclude ".googleearth" \
  --exclude ".gradle" \
  --exclude ".local" \
  --exclude ".npm" \
  --exclude ".rustup" \
  --exclude ".ssh" \
  --exclude ".steam" \
  --exclude ".vscode" \
  --exclude ".wine" \
  --exclude "apps" \
  --exclude "downloads" \
  --exclude "sem2/lines" \
  --exclude "trash" \
  ~/ antoni@flats.antoniszczepanik.com:/media/hdd/T495

  #--exclude ".*" \

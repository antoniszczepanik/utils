#!/usr/bin/env bash

rsync -avzP \
  --human-readable \
  --exclude "trash" \
  --exclude ".local" \
  --exclude ".cargo" \
  --exclude ".gradle" \
  --exclude ".vscode" \
  --exclude ".rustup" \
  --exclude ".googleearth" \
  --exclude ".buildroot-ccache" \
  --exclude ".buildroot-dl" \
  --exclude ".cache" \
  --exclude ".wine" \
  --exclude ".npm" \
  --exclude ".steam" \
  --exclude ".arduino15" \
  --exclude ".dropbox-dist" \
  --exclude "sem2/lines" \
  --exclude "apps" \
  --exclude "downloads" \
  --exclude ".gnugpg" \
  --exclude ".ssh" \
  ~/ antoni@flats.antoniszczepanik.com:/media/hdd/T495

  #--exclude ".*" \

#!/usr/bin/env bash

# .gitconfig contains secrets - use script instead
git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global difftool.prompt 0
git config --global merge.tool vimdiff
git config --global alias.s status
# colors
git config --global color.status.changed "#c65353 bold"
git config --global color.status.added "green bold"
git config --global color.status.untracked "#c65353 bold"
git config --global color.diff.new green
git config --global color.diff.old "#c65353"



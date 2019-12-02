#!/usr/bin/env bash

cd $1 && git ls-files | grep "\.py$" | xargs wc -l && cd -

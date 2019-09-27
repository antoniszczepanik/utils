#!/usr/bin/env bash

git ls-files | grep "\.py$" | xargs wc -l 

#!/usr/bin/env bash

echo "Start watch ..."

# https://emcrisostomo.github.io/fswatch/doc/1.17.1/fswatch.html/
# https://github.com/emcrisostomo/fswatch
# https://stackoverflow.com/questions/34713278/fswatch-to-watch-only-a-certain-file-extension
fswatch --no-defer -e ".*" -i "\\.adoc$" -0 . | while read -d "" event
do
    echo "$event"
    make build
done

echo "End watch ..."

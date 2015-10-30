#!/usr/bin/env bash

set -e

SERVER=files.pharo.org
BASEDIR=/appli/files.pharo.org/books/enterprisepharo/book
SERVER_USER=filepharosync
TMP_DIR='~cassou/enterprisepharo-book'

PILLAR_COMMAND="./pillar"

chapters=$($PILLAR_COMMAND show inputFiles 2>/dev/null)

ssh $SERVER sh <<EOF
sudo su --login --command "mkdir -p \"$BASEDIR\"" "$SERVER_USER"
rm -rf $TMP_DIR
mkdir $TMP_DIR
EOF

echo Pushing all files to $SERVER
scp -r book-result $SERVER:$TMP_DIR

ssh $SERVER sh <<EOF
sudo su --login --command "cp -R $TMP_DIR/book-result/* $BASEDIR" filepharosync
EOF

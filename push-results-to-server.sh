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

rm -rf to-push
mkdir -p to-push/html/figures
cp book-result/EnterprisePharo.pdf to-push/

# Push all css/js files
cp -R support/html/* to-push/html

# Push all .html chapters
for chapter in $chapters; do
    html="${chapter%%.*}.html"

    # Hack to change the references to support files (e.g., .css, .js)
    sed 'sX../support/html/XX' $html > to-push/html/$(basename $html)

    # copy the figures
    cp -R $(dirname $html)/figures/* to-push/html/figures/ 2>/dev/null || true
done

cd to-push/html

cd ../..

echo Pushing all files to $SERVER
scp -r to-push $SERVER:$TMP_DIR

ssh $SERVER sh <<EOF
sudo su --login --command "cp -R $TMP_DIR/to-push/* $BASEDIR" filepharosync
EOF

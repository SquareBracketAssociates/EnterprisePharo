#!/usr/bin/env bash

set -e

git submodule update --init

rm -rf book-result
./pillar export
bash pillarPostExport.sh

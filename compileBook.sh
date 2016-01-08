#!/usr/bin/env bash

set -e

cd book-result
cp ../EnterprisePharo.tex .
../gitinfo2.sh > gitHeadLocal.gin
texfot latexmk EnterprisePharo

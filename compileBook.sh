#!/usr/bin/env bash

set -e

cd book-result
cp ../EnterprisePharo.tex .
../gitinfo2.sh > gitHeadInfo.gin
texfot latexmk EnterprisePharo

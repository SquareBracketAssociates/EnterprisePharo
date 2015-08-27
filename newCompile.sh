#!/usr/bin/env bash

# This script is meant for the EnterprisePharo book. You can use it for other projects

function mypdflatex() {
  file="$1"
  basename=${file%.*}

echo "=========================================================="
echo "Compiling PDF from $file..."
echo "=========================================================="

  lualatex --file-line-error --interaction=batchmode "$basename" 2>&1 1>/dev/null
  ret=$?
  if [[ $ret -ne 0 ]]; then
    cat "$basename".log
    echo "Can't generate the PDF for $file!"
    exit 1
  fi
}

./pillar export
bash pillarPostExport.sh
cd book-result
mypdflatex EnterprisePharo-A4.tex
mypdflatex EnterprisePharo-A4.tex
mypdflatex EnterprisePharo-Lulu.tex
mypdflatex EnterprisePharo-Lulu.tex
latexmk -c 2>&1 1>/dev/null
cd ..

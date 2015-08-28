#!/usr/bin/env bash

set -e

./pillar export
bash pillarPostExport.sh

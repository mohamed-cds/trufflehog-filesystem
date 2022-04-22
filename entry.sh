#!/bin/bash

pwd
ls -laR
find . -type f -exec cat {} \;

echo "submitted:" $@

exec /usr/local/bin/trufflehog "$@"
#!/bin/bash

pwd
ls -laR
find . -type f -exec cat {} \;

exec "$@"
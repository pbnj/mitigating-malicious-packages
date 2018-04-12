#!/bin/bash -euxo pipefail

FILE=$1

grep inet_addr $FILE | tr ' ' '\n' | grep inet_addr | grep -o '".*"' | sed 's/"//g'

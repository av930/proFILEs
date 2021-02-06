#!/bin/bash
# $1 should be real path where source locate
# example
# for Local SRC is D:/SRC_WORK/XXX 
# for Remote SRC is X:/XXX

if [ "$1" = "" ]; then
BASE_DIR=x:/myJB/
else
BASE_DIR=$1/
fi

set -x
find . -path ./out -prune \
    -o -path ./external -prune \
    -o -path ./development/apps -prune \
    -o -path ./packages -prune \
    -o -path ./prebuilts -prune \
    -o -path ./developers -prune \
    -o -path ./sdk -prune \
    -o -path ./ndk -prune \
    -o -path ./cts -prune \
    -o -path ./docs -prune \
    -o -path ./vendor/lge/external -prune \
    -o -path ./.repo -prune \
    -o -path ./.git -prune \
    -o -type d \
    |sort -u \
    |grep -v '/test/' \
    |grep -v '/tests/' \
    |sed s#^./#${BASE_DIR}# > SourceInsightFileList.txt
set +x

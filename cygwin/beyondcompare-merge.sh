#!/bin/sh
# Use SourceGear BeyondCompare as mergetool for git in cygwin.
# 	git config --global mergetool.bc.cmd "beyondcompare-merge.sh \"\$LOCAL\" \"\$REMOTE\" \"\$BASE\" \"\$MERGED\""
#   git config --global mergetool.bc.trustExitCode true
#   git mergetool -t bc

# Reference: http://www.tldp.org/LDP/abs/abs-guide.pdf

library=~/gittool/githelperfunctions.sh

#[ -f $library ] && . $library
. $library

echo Launching BeyondCompare - beyondcompare-merge.sh: 

set_path_vars "$1" "$2" "$3" "$4"

echo "$beyondcompare" /lefttitle=Local /righttitle=Remote /centertitle=Base "$localwinpath" "$remotewinpath" "$basewinpath" "$mergedwinpath"
"$beyondcompare" /lefttitle=Local /righttitle=Remote /centertitle=Base "$localwinpath" "$remotewinpath" "$basewinpath" "$mergedwinpath"

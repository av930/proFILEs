#!/bin/sh
# Use BeyondCompare as difftool for git in cygwin.
#   git config --global difftool.bc.cmd "beyondcompare-diff.sh \"\$LOCAL\" \"\$REMOTE\""
#   git difftool -t bc branch1..branch2

# Reference: http://www.tldp.org/LDP/abs/abs-guide.pdf

library=~/.proFILEs/cygwin/githelperfunctions.sh

#[ -f $library ] && . $library
. $library

echo Launching BeyondCommpare - beyondcompare-diff.sh:

set_path_vars "$1" "$2"

echo "$beyondcompare" $localwinpath $remotewinpath
"$beyondcompare" "$localwinpath" "$remotewinpath"

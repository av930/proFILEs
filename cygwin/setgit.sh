#!/bin/sh
# beyond compare for diff
git config --global difftool.bc.cmd "~/gittool/beyondcompare-diff.sh \"\$LOCAL\" \"\$REMOTE\""
#git difftool -t bc branch1..branch2
# diffmerge for merge
git config --global mergetool.diffmerge.cmd "~/gittool/diffmergetool.sh \"\$LOCAL\" \"\$REMOTE\" \"\$BASE\" \"\$MERGED\""
git config --global mergetool.diffmerge.trustExitCode false
#git difftool -t diffmerge branch1..branch2

git config --global alias.df "difftool -t bc"
git config --global alias.ci "commit --verbose"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global alias.br "branch"
git config --global alias.rb "rebase"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
git config --global alias.ls 'ls --show-control-chars --color=auto'
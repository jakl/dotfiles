#!/usr/bin/env bash -l
echo "##### @jakl this is a message I typed at `date` : Starting source ~/.bashrc #####"
. ~/.bashrc
echo "##### @jakl this is a message I typed at `date` : Starting brew update... #####"
/usr/local/bin/brew update
echo "##### @jakl this is a message I typed at `date` : Starting brew upgrade #####"
/usr/local/bin/brew upgrade
echo "##### @jakl this is a message I typed at `date` : Starting npm update -g #####"
/usr/local/bin/npm update -g
echo "##### @jakl this is a message I typed at `date` : Starting sync-dottools.sh #####"
/Users/jkoval/.tools-cache/home/aurora/tools/dottools/bin/sync-dottools.sh
echo "##### @jakl this is a message I typed at `date` : Starting cd ~/workspace/source && git fetch #####"
cd /Users/jkoval/workspace/source && git fetch
echo "##### @jakl this is a message I typed at `date` : Done with everything #####"

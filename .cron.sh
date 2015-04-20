#!/usr/bin/env bash -l

# This is an hourly cron script to keep my system well oiled

echo "##### @jakl this is a message I typed on `date` : Starting source ~/.bashrc #####"
. ~/.bashrc
echo "##### @jakl this is a message I typed on `date` : Starting brew update... #####"
/usr/local/bin/brew update
echo "##### @jakl this is a message I typed on `date` : Starting brew upgrade #####"
/usr/local/bin/brew upgrade
echo "##### @jakl this is a message I typed on `date` : Starting npm update -g #####"
/usr/local/bin/npm update -g
echo "##### @jakl this is a message I typed on `date` : Starting sync-dottools.sh #####"
/Users/jkoval/.tools-cache/home/aurora/tools/dottools/bin/sync-dottools.sh
echo "##### @jakl this is a message I typed on `date` : Starting cd ~/workspace/source && git fetch #####"
cd /Users/jkoval/workspace/source && /Users/jkoval/bin/git fetch
echo "##### @jakl this is a message I typed on `date` : Done with everything #####"

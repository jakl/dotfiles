#!/usr/bin/env bash -l
set -o xtrace -o nounset -o errexit -o pipefail

# This is an hourly cron script to keep my system well oiled

echo "##### @jakl cron ran on `date` : Starting source ~/.bashrc #####"
. ~/.bashrc
echo "##### @jakl cron ran on `date` : Starting brew update... #####"
/usr/local/bin/brew update
echo "##### @jakl cron ran on `date` : Starting brew upgrade #####"
/usr/local/bin/brew upgrade --all
echo "##### @jakl cron ran on `date` : Starting npm update -g #####"
/usr/local/bin/npm update -g
echo "##### @jakl cron ran on `date` : Starting export SSH_AUTH_SOCK=/tmp/launch-oxZKfu/Listeners && kinit #####"
export SSH_AUTH_SOCK=/tmp/launch-oxZKfu/Listeners
/usr/bin/kinit --password-file=/Users/jkoval/.mykinitrc
echo "##### @jakl cron ran on `date` : Starting cd ~/workspace/source && git fetch #####"
cd /Users/jkoval/workspace/source && /Users/jkoval/bin/sgit fetch
echo "##### @jakl cron ran on `date` : Done with everything #####"

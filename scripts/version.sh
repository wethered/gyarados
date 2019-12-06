#!/bin/sh

new_version=$1
filename=$(pwd)/fish_prompt.fish

sed -e "s/set -g GYARADOS_VERSION .*/set -g GYARADOS_VERSION $new_version/g" $filename > $filename.bak
mv -- $filename.bak $filename


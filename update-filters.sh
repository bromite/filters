#!/bin/bash
wget -O filters/filters.txt https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt
wget -O filters/badware.txt https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt
wget -O filters/privacy.txt https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt
wget -O filters/resource-abuse.txt https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt
wget -O filters/unbreak.txt https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt
wget -O filters/easylist.txt https://easylist.to/easylist/easylist.txt
wget -O filters/easyprivacy.txt https://easylist.to/easylist/easyprivacy.txt
wget -O filters/peter-lowe-serverlist.txt https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext

filters=($(ls -S filters/*))
input_files=$(IFS=, ; echo "${filters[*]}")

./ruleset_converter --input_format=filter-list \
	--output_format=unindexed-ruleset \
    --input_files=$input_files \
	--output_file=filters.dat

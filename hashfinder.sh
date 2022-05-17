#!/bin/bash
#
# Prerequisites:
# https://virustotal.github.io/vt-cli/
#
# Inputs:
# Place hashes (one per line) in 'hashes.txt' in the same dir as this script
#
while IFS= read -r hash; do
        mal=`./vt file $hash | grep -E "malicious" | sed 's/malicious\: //g'`
        hl=`./vt file $hash | grep -E "harmless" | sed 's/harmless\: //g'`
        sus=`./vt file $hash | grep -E "suspicious" | sed 's/suspicious\: //g'`
        echo ''
        echo "Hash: $hash"
        echo "Malicious count: $mal"
        echo "Harmless count: $hl"
        echo "Suspicious count: $sus"
done < hashes.txt

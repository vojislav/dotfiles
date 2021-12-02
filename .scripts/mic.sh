#!/usr/bin/sh

# Play/pause music on headphones button click

while true; do
    rec -n stat trim 0 .5 2>&1 | awk '/^Maximum amplitude/ && $3 > 0.89' | grep -q 'M' && mpc toggle
done

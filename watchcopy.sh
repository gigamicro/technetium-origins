#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
while true; do
	cp -ruvfT . ../datapacks/automaton
	sleep 0.25 & tail -n0 -f --pid $! ../datapacks/../../../logs/latest.log
done

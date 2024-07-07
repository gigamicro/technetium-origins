#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
while true; do
	zip -ru automaton.zip data pack.mcmeta; cp -uvfT ./automaton.zip ../datapacks/automaton.zip
	sleep 0.25 & tail -n0 -f --pid $! ../datapacks/../../../logs/latest.log
done

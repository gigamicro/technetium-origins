#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
while true; do
	zip -ru technetium-origins.zip data pack.mcmeta; cp -uvft ../datapacks/ ./*.zip
	sleep 0.25 & tail --pid $! -n0 -f ../datapacks/../../../logs/latest.log
done

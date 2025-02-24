#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
FILE=technetium-origins.jar
rm -- ./"$FILE"
while true; do
	zip -ru ./"$FILE" -- assets data pack.mcmeta fabric.mod.json META-INF com
	cp -uvft ../profile/mods -- ./"$FILE"
	sleep 0.25 & tail --pid $! -n0 -f ../profile/logs/latest.log
done

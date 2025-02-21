#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
rm technetium-origins.jar
while true; do
	zip -ru technetium-origins.jar -- assets data pack.mcmeta;
	cp -uvft ../profile/mods ./*.jar
	sleep 0.25 & tail --pid $! -n0 -f ../profile/logs/latest.log
done
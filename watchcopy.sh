#!/bin/sh
cd "$(readlink -zf "$0" | xargs -0 dirname)"
rm technetium-origins.zip
while true; do
	zip -ru technetium-origins.zip assets data pack.mcmeta
	cp -uvft ../profile/saves/New\ World_"$(git branch --show-current)"/datapacks/ ./*.zip
	cp -uvft ../profile/resourcepacks ./*.zip
	sleep 0.25 & tail --pid $! -n0 -f ../profile/logs/latest.log
done

#!/bin/sh
NEW_VERSION="$1"
set -o errexit
[ -n "$NEW_VERSION" ] || { echo need version; exit 1;}
git tag -l "v$NEW_VERSION" | grep -q '' && { echo version exists; exit 2;}
git stash
grep -v '^ *- *$' release.md >release~.md
mv -f release~.md release.md
sed -i '/^version=/s/"[0-9.]*"$/"'"$NEW_VERSION"'"/' META-INF/mods.toml
sed -i '/"version":/s/"[0-9.]*",$/"'"$NEW_VERSION"'",/' pack.mcmeta fabric.mod.json
git add release.md META-INF/mods.toml pack.mcmeta fabric.mod.json
git commit -m "v$NEW_VERSION"
git tag "v$NEW_VERSION"
grep -v '^ *-' release.md >release~.md
mv -f release~.md release.md
printf ' - \n' >>release.md
git add release.md
git commit -m 'reset New & Changed'
git stash list --max-age=$(date -d '5 seconds ago' +%s) | grep -q '' && git stash pop

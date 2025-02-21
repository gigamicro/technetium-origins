#!/bin/sh
set -o errexit
cd -- "$(readlink -zf "$0" | xargs -0 dirname)"
self=technetium-origins
printf =======%s=======\\n DATA
rm     ./"$self".zip || true
zip -r ./"$self".zip -- data pack.mcmeta
printf =======%s=======\\n ASSETS
rm     ./"$self"-assets.zip || true
zip -r ./"$self"-assets.zip -- assets pack.mcmeta
printf =======%s=======\\n FABRIC
rm     ./"$self".jar || true
zip -r ./"$self".jar -- assets data fabric.mod.json
printf =======%s=======\\n  FORGE
rm     ./"$self"-forge.jar || true
zip -r ./"$self"-forge.jar -- assets data pack.mcmeta META-INF com

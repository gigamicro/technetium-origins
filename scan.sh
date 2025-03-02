#!/bin/sh
[ $# -eq 0 ] && set -- ./*
for f in "$@"; do
	bsdtar -tf "$f"
done | sed -n '/^data\//{s///;/\/$/d;p}'

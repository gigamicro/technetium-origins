#!/bin/sh
exec grep -e '"name":' -- data/*/origins/* | sed 's|^data/||;s|/origins/|:|;s|\.json:\s*"name":\s*| = |;s|,$||'

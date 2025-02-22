#!/bin/sh
{
echo '### current origins:'
./listorigins.sh | sed 's/^/- /'
echo
} >> release.md

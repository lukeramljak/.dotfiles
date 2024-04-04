#!/bin/bash

RL_PREFIX="$HOME/Games/Heroic/Prefixes/default/Rocket League"
PROTON="$HOME/.config/heroic/tools/wine/Wine-GE-latest"
BAKKES="$RL_PREFIX/drive_c/Program Files/BakkesMod/BakkesMod.exe"

if [[ -f "$BAKKES" ]]; then

	while ! pgrep -f "RocketLeague.exe" > /dev/null; do
		sleep 1
	done

	sleep 10

	WINEFSYNC=1 WINEPREFIX="$RL_PREFIX" "$PROTON/bin/wine" "$BAKKES" &

	while pgrep -f "RocketLeague.exe" > /dev/null; do
		sleep 1
	done

	pkill -f "BakkesMod.exe"

else
	echo "$BAKKES doesn't exist. Aborting."
fi

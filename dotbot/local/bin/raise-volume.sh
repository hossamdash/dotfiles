#!/bin/sh

VOLUME= amixer sget Master | sed -En 's/.*\[([0-9]+)%\].*/\1/p' | head -1 

if [ VOLUME != 100 ]; then
	amixer -q sset Master 5%+ && echo $VOlUME+5 > $SWAYSOCK.audio
fi

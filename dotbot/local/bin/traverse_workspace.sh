#!/bin/sh

CUR_WORKSPACE=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.current_workspace' | awk -F':' '{print $1}')

if [ $1 = "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ $1 = "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
fi

#echo $TO_WORKSPACE
if [ $TO_WORKSPACE -eq 8 ]; then
    TO_WORKSPACE=7
elif [ $TO_WORKSPACE -eq 0 ]; then
    TO_WORKSPACE=1
fi

#switch or move containers
if [ $2 = "container" ]; then
    swaymsg move container to workspace number $TO_WORKSPACE
    swaymsg workspace number $TO_WORKSPACE
elif [ $2 = "workspace" ]; then
    swaymsg workspace number $TO_WORKSPACE
fi

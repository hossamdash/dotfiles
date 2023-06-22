#!/bin/sh

CUR_WORKSPACE_ROUGH=$(swaymsg -t "get_workspaces" | jq -r '.[] | select(.focused)' | jq -r '.name' | awk -F':' '{print $1}')
# expr substring index(1-based) length
CUR_WORKSPACE=$(expr substr "$CUR_WORKSPACE_ROUGH" 2 1)

if [ $1 = "prev" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE - 1)
elif [ $1 = "next" ]; then
    TO_WORKSPACE=$(expr $CUR_WORKSPACE + 1)
fi

#echo $TO_WORKSPACE
if [ $TO_WORKSPACE -eq 10 ]; then
    TO_WORKSPACE=9
elif [ $TO_WORKSPACE -eq 0 ]; then
    TO_WORKSPACE=1
fi

#switch or move containers
if [ $2 = "container" ]; then
    swaysome move $TO_WORKSPACE
    swaysome focus $TO_WORKSPACE
elif [ $2 = "workspace" ]; then
    swaysome focus $TO_WORKSPACE
fi

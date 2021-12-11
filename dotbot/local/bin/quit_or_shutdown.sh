#!/bin/sh

CUR_WORKSPACE_STATUS_TILING=$(swaymsg -t "get_workspaces" | jq -r '.[] | select(.focused).representation')
CUR_WORKSPACE_STATUS_FLOATING=$(swaymsg -t "get_workspaces" | jq -r '.[] | select(.focused).floating_nodes' | jq -r '.[].id')
FOCUSED_APP_ID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true).pid')

# echo $CUR_WORKSPACE_STATUS_TILING | tee ~/tiling-status.txt
# echo $CUR_WORKSPACE_STATUS_FLOATING | tee ~/floating-status.txt

if [ $CUR_WORKSPACE_STATUS_TILING = "null" ] \
|| [ $CUR_WORKSPACE_STATUS_TILING = "H[]" ] \
|| [ $CUR_WORKSPACE_STATUS_TILING = "V[]" ] \
&& [ -z $CUR_WORKSPACE_STATUS_FLOATING ]; then
    bepower.sh
else
    kill $FOCUSED_APP_ID
fi

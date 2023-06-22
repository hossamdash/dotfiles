bindcode $super+10 exec "swaysome focus 1"
bindcode $super+11 exec "swaysome focus 2"
bindcode $super+12 exec "swaysome focus 3"
bindcode $super+13 exec "swaysome focus 4"
bindcode $super+14 exec "swaysome focus 5"
bindcode $super+15 exec "swaysome focus 6"
bindcode $super+16 exec "swaysome focus 7"
bindcode $super+17 exec "swaysome focus 8"
bindcode $super+18 exec "swaysome focus 9"


bindsym $super+Shift+1 exec "swaysome move 1"
bindsym $super+Shift+2 exec "swaysome move 2"
bindsym $super+Shift+3 exec "swaysome move 3"
bindsym $super+Shift+4 exec "swaysome move 4"
bindsym $super+Shift+5 exec "swaysome move 5"
bindsym $super+Shift+6 exec "swaysome move 6"
bindsym $super+Shift+7 exec "swaysome move 7"
bindsym $super+Shift+8 exec "swaysome move 8"
bindsym $super+Shift+9 exec "swaysome move 9"


bindsym $super+Shift+KP_LEFT exec traverse_workspace_swaysome.sh prev container
bindsym $super+Shift+KP_RIGHT exec traverse_workspace_swaysome.sh next container
bindsym $super+KP_LEFT exec traverse_workspace_swaysome.sh prev workspace
bindsym $super+KP_RIGHT exec traverse_workspace_swaysome.sh next workspace

# Move focused container to next output
bindsym $super+Tab exec "swaysome next-output"

bindsym $super+F1 exec "swaysome focus-group 1"
bindsym $super+F2 exec "swaysome focus-group 2"
# Move focused container to previous output
# bindsym $super+Shift+Tab exec "swaysome prev-output"

# Init workspaces for every screen
exec "swaysome init 1"

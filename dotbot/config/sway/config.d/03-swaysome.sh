bindcode $super+10 exec "swaysome focus 1"
bindcode $super+11 exec "swaysome focus 2"
bindcode $super+12 exec "swaysome focus 3"
bindcode $super+13 exec "swaysome focus 4"
bindcode $super+14 exec "swaysome focus 5"
bindcode $super+15 exec "swaysome focus 6"
bindcode $super+16 exec "swaysome focus 7"
bindcode $super+17 exec "swaysome focus 8"
bindcode $super+18 exec "swaysome focus 9"

# Move focused container to next output
bindsym $super+Tab exec "swaysome next-output"

bindsym $super+F1 exec "swaysome focus-group 1"
bindsym $super+F2 exec "swaysome focus-group 2"
# Move focused container to previous output
# bindsym $super+Shift+Tab exec "swaysome prev-output"

# Init workspaces for every screen
exec "swaysome init 1"

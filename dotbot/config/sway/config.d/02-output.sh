# Decorations
default_border pixel 3
# gaps
gaps inner 10
gaps outer -5
# smart_borders no_gaps
smart_gaps on
# # no window borders adjacent to screen edge
# # and no title bar in tabbed or stacked layout if single child
hide_edge_borders --i3 smart
# focus under mouse
# focus_follows_mouse always
# xwayland focus test?
# focus_on_window_activation smart

# try to force mouse size
# seat * xcursor_theme Adwaita 12

# Screen Scaling
output eDP-1 scale 1.15
# output eDP-1 scale 1
output HDMI-A-1 mode 1920x1080@60Hz
# title
title_align center
# cursor theme 
seat * xcursor_theme Adwaita 24
# Hide cursor after 60 seconds
seat * hide_cursor 60000
seat * hide_cursor when-typing enable
seat * keyboard_grouping none

# # Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)
# output * bg /mnt/Lenovo/Home/Pictures/wallpapers/blue-night.jpg fill

### Set random wallpaper
set $wallpapers_path ~/.config/sway/wallpapers
output * bg `find $wallpapers_path -type f | shuf -n 1` fill
workspace_layout tabbed

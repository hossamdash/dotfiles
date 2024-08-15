# Windows exceptions
for_window {
    [title="Firefox — Sharing Indicator"] floating enable, sticky enable, move position 94 ppt 93 ppt
    [title="gsimplecal"] floating enable, sticky enable, move position 62 ppt 0 ppt
    [title="xeyes"] floating enable, sticky enable
    [title="\ -\ Connection\ Details$"] floating enable, sticky enable
    [title="Emulator"] floating enable, border none
    [title="Android Emulator "] floating enable, border none
    [title="pcmanfm-qt file-roller"] floating enable
    [title="Python Turtle Graphics"] floating enable
    [title="Tk"] floating enable
    [title="Smile"] floating enable
    # slack context menu
    # [title=""] floating enable, move position 80 ppt 0 pptio
}


for_window [app_id="^zenity*"] floating enable
for_window [app_id="^chrome-.*"] shortcuts_inhibitor disable

# Workspace layout
# workspace_layout tabbed

# Drag floating windows by holding down $mod and left mouse button.
# Resize them with right mouse button + $mod.
# Despite the name, also works for non-floating windows.
# Change normal to inverse to use left mouse button for resizing and right
# mouse button for dragging.
floating_modifier $super normal

workspace_layout default

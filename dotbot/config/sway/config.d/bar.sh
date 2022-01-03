# i3status-rs
bar {
    id 1
    position top
    height 30
    status_command i3status-rs
    workspace_min_width 50
    # strip_workspace_numbers yes
    font pango:Hack, Font Awesome 5 Free 10.5
    status_padding 0
    status_edge_padding 0
    bindsym {
        # diable vertical scrolling
        # button4 nop
        # button5 nop
        # diable horizontal scrolling
        # button6 nop
        # button7 nop
        # close on middle click
        --release button2 kill
    }
    # tray_bindsym {
    #     button1 Activate
    #     button3 ContextMenu
    # }
    colors {
        # separator #666666
        background #222d32
        statusline #dddddd
        focused_workspace #435f7b #435f7b #ffffff
        active_workspace #333333 #333333 #ffffff
        inactive_workspace #222d32 #222d32 #888888
        urgent_workspace #2f343a #900000 #ffffff
    }
} 
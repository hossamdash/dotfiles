# i3status-rs
bar {
    id 1
    position top
    height 30
    status_command i3status-rs
    workspace_min_width 75
    # strip_workspace_numbers yes
    font pango:Hack, Font Awesome 6 Free 10.5
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
        background #222d32de
        statusline #ddddddde
        focused_workspace #435f7bde #435f7bde #ffffffde
        active_workspace #333333de #333333de #ffffffde
        inactive_workspace #222d32de #222d32de #888888de
        urgent_workspace #2f343ade #900000de #ffffffde
    }
} 

set {
    # win key
    $super Mod4
    $alt Mod1

    # default apps
    $file_manager pcmanfm-qt
    $cli_file_manager ranger
    $term Alacritty
    $term2 alacritty
    $sys_monitor htop
    $media_player mpv
    $code_editor code-oss

    # launch menu style
    $highlight #3daee9
    $menu bemenu -i -p "launch ▶" -H 30 --tf "$highlight" --hf "$highlight" \
        --sf "$highlight" --scf "$highlight" --fn "Hack Regular 12"
    # Run Prompt 
    $desktop_menu j4-dmenu-desktop --dmenu='$menu' --term=alacritty \
        --use-xdg-de --no-generic | xargs swaymsg exec --
}




######## Keyboard Bindings ########

bindsym --to-code {

    # quick access shortcut
    $super+KP_Enter exec gtk-launch $cli_file_manager
    # Start a terminal
    $super+Return exec gtk-launch $term
    # Open sway settings
    $super+Comma exec gtk-launch $code_editor ~/.config/sway
    # Firefox
    $super+w exec gtk-launch firefox
    $super+Shift+w exec firefox -private-window
    # Chromium
    $super+Alt+w exec gtk-launch chromium
    $super+Alt+Shift+w exec chromium --incognito
    # Start File Manager
    $super+f exec gtk-launch $file_manager
    # Start Code Editor
    $super+KP_Divide exec gtk-launch $code_editor
    # Start System Monitor
    $super+Backslash exec gtk-launch $sys_monitor
    # Start Media Player
    $super+m exec gtk-launch $media_player
    # desktop menu (bemenu + j4-menu-desktop)
    $super+a exec wofi --show=drun --allow-images --allow-markup --insensitive --parse-search --define=key_expand=Right --width=60% --height=60%
    # desktop menu (nwg-drawr)
    # $super+Shift+a exec pkill -USR1 nwg-drawer
    $super+Shift+a exec $desktop_menu
    # .local/bin/bepower
    $super+Shift+q exec bepower.sh -m '$menu'
    # clipboard pick
    $super+v exec clipman pick --tool bemenu \
        -T'-i -n -l 7 --fn "Hack Regular 14" -p "clipboard" --scrollbar autohide' 
    # color picker
    $super+c exec gtk-launch wl-color-picker
    # emoji picker
    $super+period exec wofi-emoji
    # screenshots
    $alt+Print exec grimshot save area - | swappy -f -
    Print exec grimshot --notify copy area
    Shift+Print exec grimshot --notify save area
    $super+Print exec grimshot --notify copy window
    $super+Shift+Print exec grimshot --notify save window
    # xorg xeyes
    $super+x exec xeyes

    # make windows sticky
    $super+s sticky toggle
    ### Sway jargon ###
    # Reload the configuration file
    $super+Shift+c reload
    # Resize mode
    $super+Shift+r mode "resize"
    # Kill focused window
    # $super+q exec quit_or_shutdown.sh
    $super+q kill
    $super+F4 exec wkill.sh
    
    # Layouts	
    # $super+s layout stacking
    $super+l layout toggle split tabbed
    $super+t layout tabbed
    # Fullscreen
    $super+F1 fullscreen
    # Hide waybar
    # $super+b exec killall -SIGUSR1 waybar
    # hide sway-bar
    $super+b bar mode toggle
    # Toggle the current focus between tiling and floating mode
    $super+Grave floating toggle
    # Swap focus between the tiling area and the floating area
    # Alt+Grave focus mode_toggle
    # Move focused window to scratchpad
    $super+Shift+minus move scratchpad
    # switch-show applications in the scratchpad
    $super+minus scratchpad show

    # Move your focus around the output screen
    $super+Up focus up
    $super+Down focus down
    $super+Left focus left
    $super+Right focus right

    # Move the focused window around the output
    $super+Shift+Up move up
    $super+Shift+Down move down
    $super+Shift+Left move left
    $super+Shift+Right move right

    # Switch to previous and next workspaces
    $super+Control+Left exec traverse_workspace.sh prev workspace
    $super+Control+Right exec traverse_workspace.sh next workspace
    
    # Same with arrow keys
    $super+Shift+Control+Left exec traverse_workspace.sh prev container
    $super+Shift+Control+Right exec traverse_workspace.sh next container
    
    # Switch between the most recent workspaces
    # Alt+Tab workspace back_and_forth
    # Alt+Shift+Tab move container workspace back_and_forth, workspace back_and_forth

    # Follow focused container to workspacee
    $super+Shift+1 move container to workspace number 1, workspace number 1
    $super+Shift+2 move container to workspace number 2, workspace number 2
    $super+Shift+3 move container to workspace number 3, workspace number 3
    $super+Shift+4 move container to workspace number 4, workspace number 4
    $super+Shift+5 move container to workspace number 5, workspace number 5
    $super+Shift+6 move container to workspace number 6, workspace number 6
    $super+Shift+7 move container to workspace number 7, workspace number 7

    # volume 
    # XF86AudioRaiseVolume exec pamixer -ui 2 && pamixer --get-volume > $SWAYSOCK.audio
    # XF86AudioLowerVolume exec pamixer -ud 2 && pamixer --get-volume > $SWAYSOCK.audio
    
    # extreme volume sates
    # Shift+XF86AudioRaiseVolume exec pamixer --unmute --allow-boost --set-volume 125 && pamixer --get-volume > $SWAYSOCK.audio
    Shift+XF86AudioLowerVolume exec pamixer --toggle-mute && ( pamixer --get-mute && echo 0 > $SWAYSOCK.audio )
    XF86AudioMicMute exec pamixer --default-source -t
    Shift+F9 exec pamixer --default-source -t

    
    
    XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
    XF86MonBrightnessUp exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
}

bindsym --no-repeat {
    # Switch to workspace
    $super+1 workspace number 1
    $super+2 workspace number 2
    $super+3 workspace number 3
    $super+4 workspace number 4
    $super+5 workspace number 5
    $super+6 workspace number 6
    $super+7 workspace number 7
}

######## Touchpad Bindings ########

bindgesture {
    swipe:right workspace prev
    swipe:left workspace next
    pinch:inward+up move up
    pinch:inward+down move down
    pinch:inward+left move left
    pinch:inward+right move right
    --exact swipe:3:down exec grimshot --notify copy window
    --exact swipe:3:up exec wofi --show=drun --allow-images --allow-markup --insensitive --parse-search --define=key_expand=Right --width=60% --height=60%
}

set {
    # win key
    $mod Mod4

    # default apps
    $file_manager pcmanfm-qt
    $cli_file_manager ranger
    $term Alacritty
    $term2 alacritty
    $sys_monitor btop
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
    $mod+KP_Enter exec gtk-launch $cli_file_manager
    # Start a terminal
    $mod+Return exec gtk-launch $term
    # Open sway settings
    $mod+Comma exec gtk-launch $code_editor ~/.config/sway/config.d
    # Firefox
    $mod+w exec gtk-launch firefox
    $mod+Shift+w exec firefox -private-window
    # Chromium
    $mod+Alt+w exec gtk-launch chromium
    $mod+Alt+Shift+w exec chromium --incognito
    # Start File Manager
    $mod+f exec gtk-launch $file_manager
    # Start Code Editor
    $mod+KP_Divide exec gtk-launch $code_editor
    # Start System Monitor
    $mod+Backslash exec $term2 -e btop
    # Start Media Player
    $mod+m exec gtk-launch $media_player
    # desktop menu (bemenu + j4-menu-desktop)
    $mod+a exec wofi --show=drun --allow-images --allow-markup --insensitive --parse-search --define=key_expand=Right --width=60% --height=60%
    # desktop menu (nwg-drawr)
    # $mod+Shift+a exec pkill -USR1 nwg-drawer
    $mod+Shift+a exec $desktop_menu
    # .local/bin/bepower
    $mod+Shift+q exec bepower.sh -m '$menu'
    # clipboard pick
    $mod+v exec clipman pick --tool bemenu \
        -T'-i -n -l 5 --fn "Hack Regular 16" -p "clipboard" --scrollbar autohide' 
    # color picker
    $mod+c exec gtk-launch wl-color-picker
    # emoji picker
    $mod+period exec wofi-emoji
    # screenshots
    Print exec grimshot --notify copy area
    Shift+Print exec grimshot --notify save area
    $mod+Print exec grimshot --notify copy window
    $mod+Shift+Print exec grimshot --notify save window
    # xorg xeyes
    $mod+x exec xeyes

    ### Sway jargon ###
    # Reload the configuration file
    $mod+Shift+c reload
    # Resize mode
    $mod+Shift+r mode "resize"
    # Kill focused window
    # $mod+q exec quit_or_shutdown.sh
    $mod+q kill
    
    # Layouts	
    # $mod+s layout stacking
    $mod+l layout toggle split tabbed
    $mod+t layout tabbed
    # Fullscreen
    $mod+F1 fullscreen
    # Hide waybar
    # $mod+b exec killall -SIGUSR1 waybar
    # hide sway-bar
    $mod+b bar mode toggle
    # Toggle the current focus between tiling and floating mode
    $mod+Grave floating toggle
    # Swap focus between the tiling area and the floating area
    # Alt+Grave focus mode_toggle
    # Move focused window to scratchpad
    $mod+Shift+minus move scratchpad
    # switch-show applications in the scratchpad
    $mod+minus scratchpad show

    # Move your focus around the output screen
    $mod+Up focus up
    $mod+Down focus down
    $mod+Left focus left
    $mod+Right focus right

    # Move the focused window around the output
    $mod+Shift+Up move up
    $mod+Shift+Down move down
    $mod+Shift+Left move left
    $mod+Shift+Right move right

    # Switch to previous and next workspaces
    $mod+Control+Left exec traverse_workspace.sh prev workspace
    $mod+Control+Right exec traverse_workspace.sh next workspace
    
    # Same with arrow keys
    $mod+Shift+Control+Left exec traverse_workspace.sh prev container
    $mod+Shift+Control+Right exec traverse_workspace.sh next container
    
    # Switch between the most recent workspaces
    # Alt+Tab workspace back_and_forth
    # Alt+Shift+Tab move container workspace back_and_forth, workspace back_and_forth

    # Switch to workspace
    $mod+1 workspace number 1
    $mod+2 workspace number 2
    $mod+3 workspace number 3
    $mod+4 workspace number 4
    $mod+5 workspace number 5
    $mod+6 workspace number 6
    $mod+7 workspace number 7

    # Follow focused container to workspacee
    $mod+Shift+1 move container to workspace number 1, workspace number 1
    $mod+Shift+2 move container to workspace number 2, workspace number 2
    $mod+Shift+3 move container to workspace number 3, workspace number 3
    $mod+Shift+4 move container to workspace number 4, workspace number 4
    $mod+Shift+5 move container to workspace number 5, workspace number 5
    $mod+Shift+6 move container to workspace number 6, workspace number 6
    $mod+Shift+7 move container to workspace number 7, workspace number 7

    # volume and brightness
    XF86AudioRaiseVolume exec pamixer --unmute --increase 5 && pamixer --get-volume > $SWAYSOCK.audio
    Shift+XF86AudioRaiseVolume exec pamixer --unmute --allow-boost --set-volume 125
    XF86AudioLowerVolume exec pamixer --unmute --decrease 5 && pamixer --get-volume > $SWAYSOCK.audio
    XF86AudioMute exec pamixer --toggle-mute && ( pamixer --get-mute && echo 0 > $SWAYSOCK.audio ) || pamixer --get-volume > $SWAYSOCK.audio
    XF86AudioMicMute exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
    XF86MonBrightnessUp exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
}
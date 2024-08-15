######## Keyboard Bindings ########

bindsym --to-code {

    # quick access shortcut
    $super+KP_Enter exec gtk-launch $term
    # Start a terminal
    $super+Return exec gtk-launch $term
    # Open sway settings
    $super+Comma exec gtk-launch $code_editor ~/.config/sway
    # Firefox
    $super+w exec gtk-launch thorium-browser
    $super+Shift+w exec thorium-browser --incognito
    # Chromium
    $super+Alt+w exec gtk-launch chromium
    $super+Alt+Shift+w exec chromium --incognito
    # Start File Manager
    $super+f exec gtk-launch $file_manager
    $super+Shift+f exec gtk-launch $cli_file_manager
    # Start Code Editor
    $super+KP_Divide exec gtk-launch $code_editor
    # Start System Monitor
    $super+Backslash exec gtk-launch $sys_monitor
    # Start Media Player
    $super+m exec gtk-launch $media_player
    # desktop menu
    $super+a exec $desktop_gui_menu
    # .local/bin/bepower
    $super+Shift+q exec $power_menu
    # clipboard pick
    $super+v exec $clipboard_menu
    # color picker
    $super+c exec gtk-launch wl-color-picker
    # emoji picker
    $super+period exec gtk-launch $emoji_picker
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
    $super+l layout toggle splitv splith
    $super+t layout tabbed
    # Fullscreen
    $super+F11 fullscreen
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

    # volume 
    XF86AudioRaiseVolume exec pamixer -ui 2 && pamixer --get-volume > $SWAYSOCK.audio
    XF86AudioLowerVolume exec pamixer -ud 2 && pamixer --get-volume > $SWAYSOCK.audio
    
    # extreme volume sates
    # Shift+XF86AudioRaiseVolume exec pamixer --unmute --allow-boost --set-volume 125 && pamixer --get-volume > $SWAYSOCK.audio
    Shift+XF86AudioLowerVolume exec pamixer --toggle-mute && ( pamixer --get-mute && echo 0 > $SWAYSOCK.audio )
    XF86AudioMicMute exec pamixer --default-source -t
    Shift+F9 exec pamixer --default-source -t

    
    
    XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
    XF86MonBrightnessUp exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $SWAYSOCK.brightness
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
    --exact swipe:3:up exec $desktop_gui_menu
}

######## Laptop Lid########
# bindswitch {
#     --reload --locked lid:on exec "[ $(swaymsg -t get_outputs | jq '. | length') -gt 1 ] && swaymsgoutput eDP-1 disable"
#     --reload --locked lid:off output eDP-1 enable
# }

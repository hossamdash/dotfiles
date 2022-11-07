# Execute once when sway starts
exec {
### sway specific

    # per workspace auto generated icons
    sworkstyle &> /tmp/sworkstyle.log

    # per window keyboard layout
    swaykbdd
        
    # Enables inhibit_idle when playing audio
    sway-audio-idle-inhibit &>/dev/null

    # wob sockets to show visualization
    mkfifo $SWAYSOCK.brightness && tail -f $SWAYSOCK.brightness | wob --background-color "#000000FF" \
        --border-color "#FFFFFFFF" --bar-color "#FCBA03FF" --anchor 'top' --anchor 'center' --margin 50 --width 320 --height 40
    mkfifo $SWAYSOCK.audio && tail -f $SWAYSOCK.audio | wob --background-color "#000000FF" \
        --border-color "#FFFFFFFF" --bar-color "#4287f5FF" --anchor 'bottom' --anchor 'center' --margin 50 --width 320 --height 40

    # Swayidle and Swaylock
    swayidle -w \
        timeout 600 'brightnessctl set 10% -s' resume 'brightnessctl -r' \
        timeout 900 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
        before-sleep 'swaylock --daemonize --show-failed-attempts --image "/mnt/Lenovo/Home/Pictures/wallpapers/summer-vibes.jpg" ' \
        idlehint 1800

### wayland specfic

    # clipboard
    wl-paste -t text --watch clipman store

### general

    # GUI Polkit agent 
    gtk-launch polkit-gnome-authentication-agent-1
    
    # Auto night light
    gammastep

    # touchpad gestures
    # gebaard -b

    # low power notificationsn
    poweralertd

    # automount 
    udiskie

    # easyeffects sound enhancer
    gio launch ~/.config/autostart/easyeffects-service.desktop
    # pactl set-default-sink easyeffects_sink
    # pactl set-default-source easyeffects_source
}

# always executed on reload
exec_always {
    # set default mic volume
    pactl set-source-volume @DEFAULT_SOURCE@ 20%
}

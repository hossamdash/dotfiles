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
    rm -f $SWAYSOCK.brightness && mkfifo $SWAYSOCK.brightness && tail -f $SWAYSOCK.brightness | wob --config ~/.config/wob/brightness-bar.ini
    rm -f $SWAYSOCK.audio && mkfifo $SWAYSOCK.audio && tail -f $SWAYSOCK.audio | wob --config ~/.config/wob/audio-bar.ini

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
}

# always executed on reload
exec_always {
    # set default mic volume
    pactl set-source-volume @DEFAULT_SOURCE@ 20%
    import_gsettings.sh
}

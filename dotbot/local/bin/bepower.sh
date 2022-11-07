Menu='Shutdown
Restart
Suspend
Logout
Lock
Hibernate
'


Chosen=$(printf "$Menu" | bemenu -i -p "██ ̲̅]" -H 30 --fn "Hack Regular 12")
#Chosen=$(printf "$Menu" | $menu)
if [ "$Chosen" = 'Shutdown' ]; then exec shutdown -h now
elif [ "$Chosen" = 'Restart' ]; then exec reboot
elif [ "$Chosen" = 'Suspend' ]; then exec systemctl suspend
elif [ "$Chosen" = 'Logout' ]; then exec swaymsg 'exit'
elif [ "$Chosen" = 'Lock' ]; then exec swaylock --daemonize --show-failed-attempts --image "/mnt/Lenovo/Home/Pictures/wallpapers/summer-vibes.jpg"
elif [ "$Chosen" = 'Hibernate' ]; then exec systemctl hibernate
else
    exit 1
fi


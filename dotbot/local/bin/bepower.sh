Menu='Shutdown
Restart
Suspend
Logout
'


Chosen=$(printf "$Menu" | bemenu -i -p "██ ̲̅]" -H 30 --fn "Hack Regular 12")
#Chosen=$(printf "$Menu" | $menu)
if [ "$Chosen" = 'Shutdown' ]; then exec poweroff
elif [ "$Chosen" = 'Restart' ]; then exec reboot
elif [ "$Chosen" = 'Suspend' ]; then exec systemctl suspend
elif [ "$Chosen" = 'Logout' ]; then exec swaymsg 'exit'
else
    exit 1
fi


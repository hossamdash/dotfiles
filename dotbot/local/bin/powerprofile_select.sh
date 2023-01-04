#!/bin/sh

PROFILE=$(zenity --list --text="Choose a power profile" --column="Profile" power-saver balanced performance)

powerprofilesctl set $PROFILE
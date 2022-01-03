# Touchpad
set $touchpad 2:7:SynPS/2_Synaptics_TouchPad

input $touchpad {
    tap enabled
    tap_button_map lrm
    # dwt disabled
    # events disabled_on_external_mouse
    natural_scroll enabled
    # postive value
    scroll_factor .5
    accel_profile adaptive
    pointer_accel .2
}

# Mouse
set $mouse 6127:24696:Lenovo_Lenovo_Y_Gaming_Precision_Mouse

input $mouse {
    # left_handed enabled
    accel_profile flat
    # [-1, 1]
    pointer_accel -.5
}

# Keyboard
set $keyboard 1:1:AT_Translated_Set_2_keyboard

input $keyboard {
    xkb_layout "us,ara"
    xkb_options grp:win_space_toggle,caps:escape_shifted_capslock
    xkb_numlock enabled
}
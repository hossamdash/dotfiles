# Touchpad
set $touchpad 1739:52972:VEN_06CB:00_06CB:CEEC_Touchpad
input $touchpad {
    tap enabled
    tap_button_map lrm
    dwt enabled
    events disabled_on_external_mouse
    natural_scroll enabled
    # postive value
    scroll_factor .5
    accel_profile adaptive
    pointer_accel .2
}

# Mouse
set $mouse 6127:24748:Lenovo_Lenovo_300_Wireless_Compact_Mouse

input $mouse {
    # left_handed enabled
    accel_profile adaptive
    # [-1, 1]
    # pointer_accel -.5
}

# Keyboard
set $keyboard 1:1:AT_Translated_Set_2_keyboard

input $keyboard {
    xkb_layout "us,ara"
    xkb_options grp:win_space_toggle,caps:escape_shifted_capslock
    xkb_numlock enabled
}
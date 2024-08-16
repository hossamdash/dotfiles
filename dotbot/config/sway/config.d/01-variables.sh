set {
    # win key
    $super Mod4
    $alt Mod1

    # default apps
    $file_manager pcmanfm-qt
    $menu bemenu
    $cli_file_manager ranger
    $term org.codeberg.dnkl.footclient.desktop
    $sys_monitor htop
    $media_player mpv
    $code_editor code
 

    $power_menu waylogout
    $desktop_gui_menu yofi --quiet --disable-syslog-logger
    $emoji_picker it.mijorus.smile
    $clipboard_menu cliphist list | yofi --config-file ~/.config/yofi/yofi-clipboard.config dialog | cliphist decode | wl-copy
}
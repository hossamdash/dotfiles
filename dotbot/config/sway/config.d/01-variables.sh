set {
    # win key
    $super Mod4
    $alt Mod1

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

    $power_menu bemenu -i -p "launch ▶" -H 30 --tf "$highlight" --hf "$highlight" \
        --sf "$highlight" --scf "$highlight" --fn "Hack Regular 12"
    
    # Run Prompt 
    $desktop_menu j4-dmenu-desktop --dmenu='$menu' --term=alacritty \
        --use-xdg-de --no-generic | xargs swaymsg exec --
    
    $desktop_gui_menu wofi --show=drun --allow-images --allow-markup --insensitive --parse-search --define=key_expand=Right --width=60% --height=60%

    $clipboard_menu bemenu \
        -T'-i -n -l 7 --fn "Hack Regular 14" -p "clipboard" --scrollbar autohide'
}
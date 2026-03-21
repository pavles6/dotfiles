# run zellij on shell init
if [[ -z "$ZELLIJ" ]]; then
    if [[ $TERM =~ "xterm-ghostty" ]]; then
      zellij attach -c $USER@$HOST
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

case "$1" in
    --popup)
        notify-send "Memory (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
        swap=$(free -h --si | awk '/^Swap:/ {print $3 "/" $2}')
		echo 'Swap: '${swap}
        ;;
esac

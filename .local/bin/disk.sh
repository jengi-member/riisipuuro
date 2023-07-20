case "$1" in
    --popup)
        notify-send "Memory (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
        disk=$(df -h /dev/nvme0n1p3 | grep '/dev' | awk '/^/ {print $3 "/" $2}')
		echo ' '${disk}
        ;;
esac

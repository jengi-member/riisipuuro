#!/bin/bash

case "$1" in
    --popup)
        notify-send "Memory (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
		disk=$(df -h --output=target,used,size | grep '/ ' | awk '/^/ {print $2 "/" $3}')
		echo ' '${disk}
        ;;
esac

#!/bin/bash
declare -i total=$(xbps-install -un | wc -l)
echo '󰞒 '${total}

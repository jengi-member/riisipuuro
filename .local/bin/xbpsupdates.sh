#!/bin/bash
total=$(xbps-install -un | wc -l)
echo '󰞒 '${total}

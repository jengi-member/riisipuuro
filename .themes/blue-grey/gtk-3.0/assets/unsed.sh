#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#212121/g' \
         -e 's/rgb(100%,100%,100%)/#ffffff/g' \
    -e 's/rgb(50%,0%,0%)/#212121/g' \
     -e 's/rgb(0%,50%,0%)/#009eff/g' \
 -e 's/rgb(0%,50.196078%,0%)/#009eff/g' \
     -e 's/rgb(50%,0%,50%)/#212121/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#212121/g' \
     -e 's/rgb(0%,0%,50%)/#ffffff/g' \
	"$@"
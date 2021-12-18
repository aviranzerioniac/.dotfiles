#!/bin/sh

# notification server
deadd-notification-center &

# auto start redshift
redshift -l 49.8728:8.6512 &

# restore background with feh
~/.fehbg &

# picom
picom -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88 --experimental-backend &

numlockx & # numlock

setxkbmap -layout de -option ctrl:nocaps # de + caps -> shift

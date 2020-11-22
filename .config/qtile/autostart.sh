#!/bin/sh

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}
# Desktop essentials

## emacs --daemon & # Start emacs as a daemon, useful for when systemd fucks you up
~/.fehbg & # Wallpaper from previous session with feh
#numlockx & # NUmlock on restart
setxkbmap -layout de -option ctrl:nocaps # de + caps -> shift
# setxkbmap de & # changing keymap to german, if it has somehow failed
picom -b & # compositor for transparency

## Mounting drives with rclone
rclone mount myDump: "/home/bagofnothing/Documents/MountedDrives/Mount #1/" &
rclone mount sDrive: "/home/bagofnothing/Documents/MountedDrives/Mount #2/" &
rclone mount driveLinks: "/home/bagofnothing/Documents/MountedDrives/Mount #3/" &

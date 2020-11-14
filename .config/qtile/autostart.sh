#!/bin/sh

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}
# Desktop essentials

~/.fehbg & # Wallpaper from previous session with feh
setxkbmap de & # changing keymap to german, if it has somehow failed
picom -b & # compositor for transparency

## Mounting drives with rclone
rclone mount myDump: "/home/bagofnothing/Documents/MountedDrives/Mount #1/" &
rclone mount sDrive: "/home/bagofnothing/Documents/MountedDrives/Mount #2/" &
rclone mount driveLinks: "/home/bagofnothing/Documents/MountedDrives/Mount #3/" &


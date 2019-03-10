#!/bin/bash

# The Poor Man's Wallpaper/Workspace solution
# Requires: wmctrl
# Make sure you edit the NUMBER_WORKSPACES and WORKSPACE_WALL array to suit.
# Remember: wmctrl starts counting workspaces at 0.

lockfile=/tmp/.wspm.lockfile
if ( set -o noclobber; echo "locked" > "$lockfile") 2> /dev/null; then
  	trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT
  	echo "Locking succeeded" >&2

	###### EDIT THESE VALUES
	NUMBER_WORKSPACES=4
	WORKSPACE_WALL[0]=/usr/share/backgrounds/xfce/inukaze/DoctorWho001.jpg
	WORKSPACE_WALL[1]=/usr/share/backgrounds/xfce/inukaze/DoctorWho002.jpg
	WORKSPACE_WALL[2]=/usr/share/backgrounds/xfce/inukaze/DoctorWho003.jpg
	WORKSPACE_WALL[3]=/usr/share/backgrounds/xfce/inukaze/AniripsaMasculino001.jpg

	###### DO NOT EDIT BELOW
	CURRENT_WORKSPACE=$(wmctrl -d | grep \* | cut -d' ' -f1)

	while true
	do
		sleep 1
		NEW_WORKSPACE=$(wmctrl -d | grep \* | cut -d' ' -f1)	
		if [ $CURRENT_WORKSPACE -ne $NEW_WORKSPACE ]; then
			wmctrl -s $NEW_WORKSPACE
			xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ${WORKSPACE_WALL[$NEW_WORKSPACE]}
			CURRENT_WORKSPACE=$NEW_WORKSPACE
		fi
	done

  	rm -f "$lockfile"
else
  	echo "Lock failed - exit" >&2
  	exit 1
fi

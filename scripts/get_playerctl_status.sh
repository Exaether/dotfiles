#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="main"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="{{ title }}"

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
    	if [ "$2" == "$NONE" ]; then
	        polybar-msg -p "$id" hook previous 1 1>/dev/null 2>&1
	        polybar-msg -p "$id" hook next 1 1>/dev/null 2>&1
	    else
	        polybar-msg -p "$id" hook previous 2 1>/dev/null 2>&1
	        polybar-msg -p "$id" hook next 2 1>/dev/null 2>&1
	    fi
        polybar-msg -p "$id" hook playpause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

NONE=1
PLAYING=2
PAUSED=3

PLAYERCTL_STATUS=$(playerctl status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS="No player found"
fi

if [ "$1" == "--status" ]; then
    echo "$STATUS"
else
    if [ "$STATUS" = "Stopped" ]; then
        update_hooks "$PARENT_BAR_PID" "$NONE"
        echo "No music is playing"
    elif [ "$STATUS" = "Paused" ]; then
        update_hooks "$PARENT_BAR_PID" "$PAUSED"
        playerctl metadata --format "$FORMAT"
    elif [ "$STATUS" = "No player is running" ]; then
        update_hooks "$PARENT_BAR_PID" "$NONE"
        echo "No player is running"
    elif [ "$STATUS" = "No player found" ]; then
        update_hooks "$PARENT_BAR_PID" "$NONE"
        echo ""
    else
        update_hooks "$PARENT_BAR_PID" "$PLAYING"
        playerctl metadata --format "$FORMAT"
    fi
fi


#!/bin/zsh

# @raycast.schemaVersion 1
# @raycast.title Add Calendar Event
# @raycast.mode silent
# @raycast.packageName Calendar
# @raycast.argument1 { "type": "text", "placeholder": "Event Title" }
# @raycast.argument2 { "type": "text", "placeholder": "HH:MM" }

source ~/.zshrc
cal-add "$1" "$2"

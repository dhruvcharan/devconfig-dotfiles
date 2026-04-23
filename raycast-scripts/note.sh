#!/bin/zsh

# @raycast.schemaVersion 1
# @raycast.title Quick Note to Obsidian
# @raycast.mode silent
# @raycast.packageName Obsidian
# @raycast.argument1 { "type": "text", "placeholder": "Note content" }

source ~/.zshrc
note "$1"

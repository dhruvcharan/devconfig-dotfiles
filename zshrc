alias switch-nvim='ln -sfn'

# Added by Antigravity
export PATH="/Users/dhruvcharan/.antigravity/antigravity/bin:$PATH"

. "$HOME/.local/bin/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export PATH="$HOME/.cargo/bin:$PATH"

# Zoxide: smarter 'cd' that replaces the standard cd command
eval "$(zoxide init zsh --cmd cd)"

# Bat: a cat(1) clone with syntax highlighting and git integration
alias cat='bat --paging=never'
alias preview='bat'

# Fast capture to Obsidian daily note
note() {
  local today=$(date +"%Y-%m-%d")
  local note_file="$HOME/Obsidian_MD/dailies/$today.md"
  if [[ ! -f "$note_file" ]]; then
    echo "# 📅 $today" > "$note_file"
  fi
  echo "- $*" >> "$note_file"
  echo "Captured to Daily Note: $*"
}

# --- macOS Calendar Integration ---

cal-today() {
  osascript -e 'set today to (current date)' -e 'set time of today to 0' -e 'set tomorrow to today + (24 * 60 * 60)' -e 'tell application "Calendar"' -e 'try' -e 'set targetCal to calendar "Mastery"' -e 'on error' -e 'set targetCal to first calendar' -e 'end try' -e 'tell targetCal' -e 'set allEvents to {}' -e 'set theEvents to (every event whose start date is greater than or equal to today and start date is less than tomorrow)' -e 'repeat with evt in theEvents' -e 'copy (summary of evt & " | " & (time string of (get start date of evt))) to end of allEvents' -e 'end repeat' -e 'return allEvents' -e 'end tell' -e 'end tell'
}

cal-add() {
  osascript ~/.config/bin/cal-add.scpt "$1" "$2"
}

# Neovim Configurations
alias nv='NVIM_APPNAME=nvim nvim'
alias npack='NVIM_APPNAME=neovim-pack nvim'

alias setup-day='~/.config/bin/setup-day'

# 🧠 The "Full Potential" Developer Guide

This guide defines the optimal workflow for your specific environment: **Ghostty + Zsh + Neovim + Gemini CLI**.

---

## 🏛️ The Infrastructure Trinity

1.  **Ghostty (The Container):**
    *   *Pane Navigation:* Use `Cmd+Option+Arrows` (Never conflicts with Neovim).
    *   *Pane Resizing:* Use `Cmd+Shift+Arrows` (Precise 20px increments).
    *   *Focus:* Use `Cmd+Enter` to "Zoom" the current pane to full screen.
    *   *Splits:* `Cmd+D` (Vertical) and `Cmd+Shift+D` (Horizontal).
    *   *Left Pane:* Gemini CLI (Your architectural partner).
    *   *Main Right Pane:* Neovim (Your surgical tool).
    *   *Bottom Pane:* Terminal (For `lazygit`, `lazydocker`, and one-off commands).
2.  **Zsh + Zoxide (The Fast Lane):**
    *   Stop typing full paths. Use `cd project-name` from anywhere.
    *   Use `zi` for interactive fuzzy-searching your most-visited directories.
3.  **Neovim (The Editor):** Minimalist, high-performance, and now IDE-grade with `Neotest` and `DAP`.

---


## 🤖 The AI-Native Workflow

### Scenario A: Starting a New Feature
1.  **Context Injection:** In your Gemini CLI pane, use `cat` (now `bat`) to pipe relevant files into the AI context.
2.  **Drafting:** Ask the AI to draft the architecture or the boilerplate.
3.  **Implementation:** Move to Neovim. Use `cd` to jump to the new files.



4.  **Surgical Edits:** Use Copilot (`Option+L`) for line-by-line completion.

### Scenario B: Fixing a Bug (The "Golden Loop")
1.  **Reproduce:** In Neovim, find the failing test. Run it with `<leader>tt`.
2.  **Debug:** If the failure isn't obvious, set a breakpoint (`<leader>db`) and launch the debugger (`<leader>dc`).
3.  **Analyze:** Use the `DAP UI` (`<leader>dt`) to inspect state.
4.  **AI Help:** If stuck, copy the error and the local state from the `DAP` window into Gemini CLI. Ask: *"Based on this state, why is this failing?"*
5.  **Verify:** Apply the fix and re-run `<leader>tt`.

### Scenario C: Massive Refactoring
1.  **File Management:** Use **Oil** (`-`) to rename or move batches of files. It’s faster than any GUI.
2.  **Structural Selection:** Use `<leader>v` to select entire functions or classes for moving.
3.  **Validation:** Use `<leader>tf` to run all tests in the file after the refactor to ensure no regressions.
4.  **Git:** Open `lazygit` (`<leader>gg`) to selectively stage your changes.

---

## 🧠 Brain & Pulse (Time Blocking & Notes)

Your environment is now your **Cognitive Command Center**, integrating **Obsidian** directly into your temrirnal workflow.

### 1. The Daily Protocol
- **Start the Day:** Press `<leader>od` in Neovim. This generates your **Time-Blocked Daily Note** from a template.
- **Plan:** Fill in your `🚀 Goals` and `🗓️ Schedule`. This becomes your "Pulse" for the day.
- **Track:** Keep this note open in a small split or a separate Ghostty tab.

### 2. The "Fast Capture" Inbox
Stop switching apps to "remember" things. Use the `note` command from any terminal pane:
```zsh
note "Remember to refactor the Auth controller"
note "Meeting with Sarah at 2 PM"
```
**The Synergy:** This instantly appends the thought to today's Obsidian Daily Note.

### 3. Searchable Knowledge
Use `<leader>os` in Neovim to fuzzy-search your entire Obsidian vault. It uses `telescope`/`snacks` to find your past thoughts in milliseconds.

---

## 📱 iOS & Global Mastery (Sync & Raycast)

Your workflow now extends beyond the Mac and into your pocket.

### 1. iOS Sync (iPhone/Apple Watch)
- **Notes:** Your vault is in `~/Documents/Obsidian_MD`. Enable **iCloud Desktop & Documents** to sync these to the Obsidian iOS app for free.
- **Calendar:** Use `cal-today` and `cal-add` in the terminal. These talk to the macOS Calendar database, which syncs instantly to your iPhone/Watch via iCloud.

### 2. Raycast Integration (The Global Layer)
- **Global Capture:** Use the Raycast Obsidian extension to "Append to Daily Note" when outside the terminal.
- **Deep Work:** Use the Raycast Pomodoro extension to track your time blocks.
- **Search:** Use Raycast for global file/note search; use Neovim (`<leader>os`) for coding-context search.

### 3. The "Closed Loop" Recap
1. **Plan** in Neovim (`<leader>od`).
2. **Execute** in Ghostty/Neovim.
3. **Capture** in Terminal (`note "..."`) or Raycast.
4. **Sync** to iOS for review and mobile access.

---

*“The goal is not to manage time, but to manage focus.” — Your Dev Env*


-   **Update Plugins:** Run `:Lazy update` once a week to get the latest performance fixes for `snacks` and `mini`.
-   **Update Parsers:** Run `:TSUpdate` if syntax highlighting looks weird in a new language.
-   **Clean History:** If `cd` (zoxide) starts suggesting wrong folders, use `zoxide remove <path>` to clean its memory.

---

*“Speed is a feature. Simplicity is a choice.” — Your Dev Env*

## 🚀 Updated Neovim Workflow (2026-04-26)

### Navigation & Buffers
- `H` / `L`: Quick buffer switching (via `mini.tabline`).
- `]d` / `[d`: Diagnostic navigation.
- `]h` / `[h`: Git hunk navigation.
- `<leader>w|` / `<leader>w-`: Vertical/Horizontal splits.

### AI & Gemini
- `<C-g>` / `<leader>ai`: Toggle Gemini in a **Right Split** (35% width).
- `<leader>ar`: Refactor visual selection with Gemini.

### Enhanced Search
- `<leader>fm`: **Search specifically within all .md files in the project.**
- `<leader>su`: Visual undo history.
- `<leader>sR`: Resume last search.

### Discoverability
- Press `<leader>` and wait for the **Which-key** hint window to see all categorized actions.

# 🚀 Neovim IDE Guide

Welcome to your personalized, minimalist, AI-native Neovim environment. This configuration is built on a foundation of **Snacks.nvim** and **Mini.nvim**, providing an IDE-grade experience with near-zero bloat.

---

## 🛠️ Core Philosophy
- **Leader Key:** `<Space>`
- **Plugin Manager:** `lazy.nvim`
- **Minimalism:** Use high-efficiency "Swiss Army Knife" plugins (`snacks`, `mini`) instead of dozens of single-purpose ones.
- **AI-Native:** Designed to work alongside **Gemini CLI** in a split-pane workflow (Ghostty).

---

## ⌨️ Key Code Legend

| Notation | Key | Description |
| :--- | :--- | :--- |
| `<leader>` | `Space` | Your primary prefix key |
| `<C-x>` | `Control + x` | Hold Control and press `x` |
| `<M-x>` | `Option + x` | Hold Option and press `x` |
| `<S-x>` | `Shift + x` | Hold Shift and press `x` |
| `<bs>` | `Backspace` | The Backspace key |
| `<cr>` | `Enter` | The Enter / Return key |
| `<Esc>` | `Escape` | The Escape key |

---

## 📂 File Management & Navigation

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `-` | **Oil:** Open parent directory as a buffer (Edit-as-Code) | `oil.nvim` |
| `<leader>fo` | **Oil Float:** Open Oil in a floating window | `oil.nvim` |
| `<leader>fg` | **Find Guide:** Search this guide using Snacks picker | `snacks.picker` |
| `<leader>e` | **Explorer:** Sidebar file tree with git integration | `snacks.explorer` |
| `<leader><space>`| **Smart Find:** Search files, buffers, and recent files | `snacks.picker` |
| `<leader>ff` | **Find Files:** Search all files in project | `snacks.picker` |
| `<leader>fr` | **Recent Files:** Search recently opened files | `snacks.picker` |
| `<leader>fb` | **Buffers:** List and search open buffers | `snacks.picker` |
| `<C-e>` | **Harpoon Menu:** Toggle quick-access file list | `harpoon2` |
| `<leader>a` | **Harpoon Add:** Add current file to Harpoon | `harpoon2` |
| `s` | **Flash:** Jump to any character on screen | `flash.nvim` |

---

## 🐞 Debugging (DAP)

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>db` | **Breakpoint:** Toggle breakpoint on current line | `nvim-dap` |
| `<leader>dc` | **Continue:** Start debugging or go to next breakpoint | `nvim-dap` |
| `<leader>di` | **Step Into:** Step into the function call | `nvim-dap` |
| `<leader>do` | **Step Over:** Step over to the next line | `nvim-dap` |
| `<leader>dO` | **Step Out:** Step out of the current function | `nvim-dap` |
| `<leader>dt` | **UI Toggle:** Toggle the debug sidebar and windows | `nvim-dap-ui` |
| `<leader>de` | **Eval:** Evaluate the expression under cursor | `nvim-dap-ui` |

---

## 🧪 Testing (IDE-Grade)

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>tt` | **Run Nearest:** Run the test under the cursor | `neotest` |
| `<leader>tf` | **Run File:** Run all tests in the current file | `neotest` |
| `<leader>ts` | **Summary:** Toggle sidebar test tree (results) | `neotest` |
| `<leader>to` | **Output:** Show test results in a floating window | `neotest` |
| `<leader>tO` | **Output Panel:** Toggle persistent output bottom pane | `neotest` |
| `<leader>tS` | **Stop:** Stop the currently running test | `neotest` |

---

## 💻 Code Intelligence (LSP & Symbols)

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `gd` | **Definition:** Jump to symbol definition | `lspconfig` |
| `gr` | **References:** List all references in a picker | `snacks.picker` |
| `gi` | **Implementation:** Jump to implementation | `lspconfig` |
| `K` | **Hover:** Show documentation in a popup | `lspconfig` |
| `<leader>ca` | **Code Action:** Show available LSP fixes | `lspconfig` |
| `<leader>cr` | **Rename:** Rename symbol project-wide | `lspconfig` |
| `<leader>cf` | **Format:** Format code (async) | `conform.nvim` |
| `<leader>co` | **Outline:** Toggle symbol sidebar (Aerial) | `aerial.nvim` |
| `<leader>v` | **Expand:** Expand structural selection (Treesitter) | `treesitter` |
| `<bs>` | **Shrink:** Shrink structural selection | `treesitter` |
| `<leader>s` | **Symbols:** Search symbols in current file | `snacks.picker` |
| `<leader>xx` | **Trouble:** Toggle diagnostics list | `trouble.nvim` |

---

## 🤖 AI Integration

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `M-l` | **Accept Suggestion:** Complete code (Option + L) | `copilot.lua` |
| `M-]` / `[` | **Next/Prev:** Cycle through suggestions | `copilot.lua` |
| `C-]` | **Dismiss:** Close current suggestion | `copilot.lua` |

*Note: Use Gemini CLI in your side pane for architectural questions and large-scale refactoring.*

---

## 🌿 Git Integration

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>gg` | **Lazygit:** Full-screen git terminal interface | `snacks.lazygit` |
| `<leader>gb` | **Blame:** Toggle line blame information | `snacks.git` |
| `<leader>gl` | **Log:** Show git log for current file | `snacks.git` |
| `]h` / `[h` | **Hunks:** Jump between git hunks (changes) | `gitsigns` |
| `<leader>hs` | **Stage Hunk:** Stage current change | `gitsigns` |
| `<leader>hr` | **Reset Hunk:** Revert current change | `gitsigns` |

---

## 🎨 UI & Workspace

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>z` | **Zen Mode:** Center code and hide distractions | `snacks.zen` |
| `<leader>Z` | **Zoom:** Toggle full-screen for current pane | `snacks.zen` |
| `<leader>/` | **Grep:** Search text across entire project | `snacks.picker` |
| `<leader>n` | **History:** Show notification history | `snacks.notifier` |
| `<leader>bd` | **Delete Buffer:** Safely close current buffer | `snacks.bufdelete` |
| `<leader>qs` | **Restore Session:** Restore project session | `persistence` |
| `<leader>u` | **Undotree:** Visual history of all changes | `undotree` |

---

## 🪟 Window Management

| Shortcut | Action |
| :--- | :--- |
| `<C-h/j/k/l>` | Navigate between windows (Left/Down/Up/Right) |
| `<leader>w` | Save current file |
| `<leader>q` | Quit Neovim |
| `<leader>ws` | Split window horizontally |
| `<leader>wv` | Split window vertically |
| `<leader>wc` | Close current window |

---

## 📝 Markdown & Obsidian

| Shortcut | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>mp` | **Preview:** Toggle markdown browser preview | `markdown-preview` |
| `<leader>od` | **Daily Note:** Open today's Obsidian note | `obsidian.nvim` |
| `<leader>on` | **New Note:** Create new note in Obsidian | `obsidian.nvim` |
| `<leader>os` | **Search Notes:** Search Obsidian vault | `obsidian.nvim` |

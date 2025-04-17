-- local M = {}

-- -- Utility to extract markdown code blocks
-- local function extract_code_block(output)
--   local in_block = false
--   local code = {}

--   for _, line in ipairs(output) do
--     if line:match("^```") then
--       if in_block then
--         break
--       else
--         in_block = true
--       end
--     elseif in_block then
--       table.insert(code, line)
--     end
--   end

--   return table.concat(code, "\n")
-- end

-- -- Show result in a floating window
-- local function show_floating_output(content)
--   local buf = vim.api.nvim_create_buf(false, true)
--   vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))

--   local width = math.floor(vim.o.columns * 0.6)
--   local height = math.floor(vim.o.lines * 0.4)
--   local row = math.floor((vim.o.lines - height) / 2)
--   local col = math.floor((vim.o.columns - width) / 2)

--   local win = vim.api.nvim_open_win(buf, true, {
--     relative = "editor",
--     width = width,
--     height = height,
--     row = row,
--     col = col,
--     style = "minimal",
--     border = "rounded"
--   })

--   vim.api.nvim_buf_set_keymap(buf, "n", "q", ":q<CR>", { noremap = true, silent = true })
-- end

-- -- Main function for gh copilot
-- local function run_copilot_cmd(kind)
--   local mode = vim.fn.mode()
--   local input = ""

--   if mode == "v" or mode == "V" then
--     local start_pos = vim.fn.getpos("'<")
--     local end_pos = vim.fn.getpos("'>")
--     local lines = vim.fn.getline(start_pos[2], end_pos[2])
--     input = table.concat(lines, "\n")
--   else
--     input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
--   end

--   local tmpfile = "/tmp/copilot_input.txt"
--   local f = io.open(tmpfile, "w")
--   f:write(input)
--   f:close()

--   vim.fn.jobstart({ "gh", "copilot", kind, tmpfile }, {
--     stdout_buffered = true,
--     on_stdout = function(_, data)
--       if data then
--         local suggestion = extract_code_block(data)
--         vim.fn.setreg("+", suggestion) 
--         show_floating_output(suggestion)
--       end
--     end
--   })
-- end

-- vim.api.nvim_create_user_command("CopilotSuggest", function()
--   run_copilot_cmd("suggest")
-- end, { range = true })

-- vim.api.nvim_create_user_command("CopilotExplain", function()
--   run_copilot_cmd("explain")
-- end, { range = true })

-- return M
-- plugins/plugin_to_disable.lua

return {
  config = function() 
  end
}

if vim.fn.argc() == 1 then
	local arg = vim.fn.argv()[1]
	if vim.fn.isdirectory(arg) == 1 then
		vim.cmd("cd " .. vim.fn.fnameescape(arg))
	end
end

require("dhruvcharan.core.options")
require("dhruvcharan.core.keymaps")

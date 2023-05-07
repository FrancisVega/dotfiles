-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

local keymap = vim.keymap.set

-- keybinds for navigation in lspsaga window
move_in_saga = { prev = "<C-k>", next = "<C-j>" }
-- use enter to open file with finder
finder_action_keys = {
	open = "<CR>",
}
-- use enter to open file with definition preview
definition_action_keys = {
 	edit = "<CR>",
 }
-- Rename
keymap("n", "<leader>r", "<cmd>Lspsaga rename<CR>", { silent = true })
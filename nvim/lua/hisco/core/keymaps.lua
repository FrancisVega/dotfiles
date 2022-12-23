vim.g.mapleader = ","

local keymap = vim.keymap

-- Silent keymap option
local opts = { silent = true }

keymap.set("i", "jj", "<ESC>")
keymap.set("n", "<leader>,", ":nohl<CR>")
keymap.set("n", "<leader>y", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "0", "^")
keymap.set("n", "<leader>,b", ":bp\\| bd #<CR>")
keymap.set("n", "<leader>W", ":set nowrap<CR>")
keymap.set("n", "<space>", "/")
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")
keymap.set("n", "G", "Gzz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
keymap.set("n", "<C-j>", "}", opts)
keymap.set("n", "<C-k>", "{", opts)
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>y", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<tab>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

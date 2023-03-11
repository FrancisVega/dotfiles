-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
vim.opt.termguicolors = true
vim.cmd([[ set background=dark ]])
vim.cmd([[ colorscheme falcon ]])

-- require("lighthaus").setup({
-- 	-- set true to use dark bg by default
-- 	bg_dark = false,
-- 	-- see colors.lua to see colors table, set overrides here to be merged with defaults
-- 	colors = {},
-- 	-- set to 'underline' to replace undercurl with underline
-- 	-- or empty string '' to disable
-- 	lsp_underline_style = "undercurl",
-- 	-- make background transparent, this overrides `bg_dark`
-- 	transparent = false,
-- 	-- use an italic font for comments
-- 	italic_comments = false,
-- 	-- use an italic font for keywords/conditionals
-- 	italic_keywords = false,
-- })

vim.cmd([[
  hi Pmenu guibg=clear
  hi Visual guifg=#000000 guibg=#FFFFFF gui=none
]])

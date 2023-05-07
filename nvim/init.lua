require("hisco.core.keymaps")
require("hisco.plugins-setup")
require("hisco.core.options")
require("hisco.core.colorscheme")
require("hisco.plugins.comment")
require("hisco.plugins.lualine")
require("hisco.plugins.nvim-cmp")
require("hisco.plugins.lsp.mason")
require("hisco.plugins.lsp.lspsaga")
require("hisco.plugins.lsp.lspconfig")
require("hisco.plugins.lsp.null-ls")
require("hisco.plugins.autopairs")
require("hisco.plugins.treesitter")
require("hisco.plugins.gitsigns")


-- Cursor (Temp...)
vim.cmd('set termguicolors')
vim.cmd('highlight Cursor guifg=#181818 guibg=#ffdd33')
vim.cmd('autocmd VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50' ..
    ',a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor' ..
    ',sm:block-blinkwait175-blinkoff150-blinkon175')
vim.cmd('highlight CursorReset guifg=#c7c7c7 guibg=#c7c7c7')
vim.cmd('autocmd VimLeave,VimSuspend * set guicursor=a:block-blinkwait700-blinkoff400-blinkon550-CursorReset/lCursorReset')

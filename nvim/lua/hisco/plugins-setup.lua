-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data")
		.. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- which key
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- git
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- desactivar los iconos en Neotree
			vim.g.neo_tree_disable_nerdtree_compat = 1
			vim.g.neo_tree_show_icons = {
				git = 0,
				folders = 0,
				files = 0,
				folder_arrows = 0,
			}
			filesystem = {
				follow_current_file = true, -- This will find and focus the file in the active buffer every
				hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
			}
		end,
	})

	use("terryma/vim-multiple-cursors")

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- CTRLP
	vim.o.wildignore = vim.o.wildignore
		.. ",*/.git/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat"
	vim.g.ctrlp_user_command = 'rg %s --files --color=never --glob ""'
	vim.g.ctrlp_use_caching = 0
	vim.g.ctrlp_map = "<tab>"
	vim.g.ctrlp_cmd = "CtrlPCurWD"
	vim.g.ctrlp_show_hidden = 1
	use({
		"ctrlpvim/ctrlp.vim",
		requires = { "ctrlpvim/ctrlp.vim" },
		config = function()
			-- vim.api.nvim_set_keymap(
			-- 	"n",
			-- 	"<Tab>",
			-- 	":CtrlPCurWD<CR>",
			-- 	{ noremap = true, silent = true }
			-- )
		end,
	})

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

	-- lspsaga
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	local keymap = vim.keymap.set
	-- Lsp finder find the symbol definition implement reference
	-- if there is no implement it will hide
	-- when you use action in finder like open vsplit then you can
	-- use <C-t> to jump back
	keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
	keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

	--
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use({
		"MunifTanjim/eslint.nvim",
		config = function()
			require("eslint").setup({
				bin = "eslint_d", -- or `eslint_d`
				code_actions = {
					enable = true,
					apply_on_save = {
						enable = true,
						types = {
							"directive",
							"problem",
							"suggestion",
							"layout",
						},
					},
					disable_rule_comment = {
						enable = true,
						location = "separate_line", -- or `same_line`
					},
				},
				diagnostics = {
					enable = true,
					report_unused_disable_directives = false,
					run_on = "type", -- or `save`
				},
			})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update =
				require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	-- use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)

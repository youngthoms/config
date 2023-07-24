require("thomas.plugins-setup")
require("thomas.core.options")
require("thomas.core.keymaps")
require("thomas.core.colorscheme")

-- plugins
require("thomas.plugins.comment")
require("thomas.plugins.nvim-tree")
require("thomas.plugins.lualine")
require("thomas.plugins.telescope")
require("thomas.plugins.nvim-cmp")
require("thomas.plugins.autopairs")
require("thomas.plugins.treesitter")
require("thomas.plugins.gitsigns")

-- lsp
require("thomas.plugins.lsp.mason")
require("thomas.plugins.lsp.lspconfig")
require("thomas.plugins.lsp.lspsaga")

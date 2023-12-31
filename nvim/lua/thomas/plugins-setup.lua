local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  -- lua functions plugins use
  use "bluz71/vim-nightfly-guicolors"
  use "ellisonleao/gruvbox.nvim"
  use "shaunsingh/nord.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "navarasu/onedark.nvim"
  use "folke/tokyonight.nvim"

  -- tmux & splir window navigation
  use "christoomey/vim-tmux-navigator"
  use "szw/vim-maximizer"

  -- esential
  use "tpope/vim-surround"
  use "vim-scripts/ReplaceWithRegister"

  -- commenting
  use "numToStr/Comment.nvim"

  -- file explrorer
  use "nvim-tree/nvim-tree.lua"

  -- icons
  use "nvim-tree/nvim-web-devicons"

  -- status line
  use "nvim-lualine/lualine.nvim"

  -- fuzzy finding
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
  use {"nvim-telescope/telescope.nvim", branch = "0.1.x"}

  -- autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- managing & installing lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- configuring lsp servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use {"glepnir/lspsaga.nvim", branch = "main"}
  use "onsails/lspkind.nvim" -- vs-code like icons for autocompletion

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true})
    end,
  }

  -- auto closing
  use "windwp/nvim-autopairs"

  -- git
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


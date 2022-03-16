local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "kyazdani42/nvim-web-devicons"

  -- colorschemes
  use "cocopon/iceberg.vim"
  use "NLKNguyen/papercolor-theme"
  use "lunarvim/darkplus.nvim"
  use "lunarvim/onedarker.nvim"
  use "EdenEast/nightfox.nvim"

  -- completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
  use "nvim-telescope/telescope-media-files.nvim"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"

  -- nvim-tree
  use {
    "kyazdani42/nvim-tree.lua",
    config = function() require'nvim-tree'.setup {} end
  }

  -- lualine
  use {
    "nvim-lualine/lualine.nvim",
  }

  -- hop.nvim
  use {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup { keys = "aoeuhtns" }
    end
  }

  -- commenting
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }

  -- formatting
  use "sbdchd/neoformat"

  use "tpope/vim-surround"

  use "tpope/vim-projectionist"

  use "akinsho/toggleterm.nvim"

  use {
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins"
  }


  use "andymass/vim-matchup"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


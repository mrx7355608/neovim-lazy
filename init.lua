local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Theme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
	},

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Neotree
  {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Treesitter
    {
	  "nvim-treesitter/nvim-treesitter",
	  version = false, -- last release is way too old and doesn't work on Windows
	  build = ":TSUpdate",
      lazy = false
    },
    -- Lsp
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
            { "folke/neodev.nvim", opts = {} },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
  },
    {
        'nvimdev/lspsaga.nvim',
        event = "LspAttach",
        lazy = true
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
    },

    { 
		"jose-elias-alvarez/typescript.nvim",
        lazy = true,
    }
})

require("core.options")
require("core.keymaps")
-- Plugins
require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.lsp")
require("plugins.mason")
require("plugins.lspsaga")
require("plugins.cmp")

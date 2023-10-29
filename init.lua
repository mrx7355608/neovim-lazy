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

-- Neovim options and keymaps
require("core.options")
require("core.keymaps")


require("lazy").setup({
    -- Theme
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('onedark').setup {
			    style = 'darker'
			}
			require("onedark").load()
		end
	},

	  { "folke/which-key.nvim", lazy = true },

  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  {
	  "Wansmer/treesj",
	  keys = {
		  { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
	  },
	  opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
	  "monaqa/dial.nvim",
	  -- lazy-load on keys
	  -- mode is `n` by default. For more advanced options, check the section on key mappings
	  keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },

  -- local plugins need to be explicitly configured with dir
  { dir = "~/projects/secret.nvim" },

  -- you can use a custom url to fetch a plugin
  { url = "git@github.com:folke/noice.nvim.git" },

  -- local plugins can also be configure with the dev option.
  -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
  -- With the dev option, you can easily switch between the local and installed version of a plugin
  { "folke/noice.nvim", dev = true },

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
}
})

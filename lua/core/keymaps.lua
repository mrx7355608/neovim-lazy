-- map leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- Editor
keymap.set("i", "jj", "<Esc>")
keymap.set({ "n", "i" }, "<C-s>", function()
	vim.cmd(":w")
end)
-- Splitting panes
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- Split pane navigation
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-h>", "<C-w>h")
-- Tabs navigation
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>pv", function()
	vim.cmd(":Ex")
end)

-- NeoTree
keymap.set("n", "<leader>e", ":Neotree filesystem toggle float<CR>")
keymap.set("n", "<leader>gs", ":Neotree git_status reveal right<CR>")
-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- Vim tmux navigator
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")

-- vim fugitive bindings
keymap.set("n", "<leader>og", vim.cmd.Git)
keymap.set("n", "<leader>gp", function()
	vim.cmd.Git("push")
end)

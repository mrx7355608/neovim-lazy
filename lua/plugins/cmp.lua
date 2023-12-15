-- Set up nvim-cmp.
local cmp = require("cmp")

local borderstyle = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-.>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),

	window = {
		completion = borderstyle,
		documentation = borderstyle,
	},
	completion = {
		border = "rounded",
	},
})

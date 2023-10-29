require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "lua", "typescript", "javascript", "markdown", "markdown_inline", "json", "html", "css" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
  indent =  { enable = true }
}

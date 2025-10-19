local lsps = {
	"lua_ls",
	"gopls",
}

vim.lsp.enable(lsps)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

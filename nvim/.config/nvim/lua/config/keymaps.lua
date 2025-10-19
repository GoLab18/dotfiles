vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":qall<CR>")
vim.keymap.set("n", "<leader>Q", ":qall!<CR>")
vim.keymap.set("n", "<leader>wq", ":wqall<CR>")

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Open neotree filesystem" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format()
end, { desc = "Formats current file" })

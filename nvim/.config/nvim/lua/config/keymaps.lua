vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Open neotree filesystem" })

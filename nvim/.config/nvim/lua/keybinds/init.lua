vim.g.mapleader = " "

-- NORMAL MODE --
vim.keymap.set("n", "<leader>pv", ":Vex<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>", { noremap = true })

vim.keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true })

vim.keymap.set("n", "<leader>ww", ":w<CR>", { noremap = true })

vim.keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true })

vim.keymap.set("n", "<leader>e", ":Neotree source=filesystem reveal=true position=right", { noremap = true })

vim.keymap.set("n", "<leader>df", function()
	vim.cmd("normal! ggVGd")
end, { noremap = true, desc = "Delete entire file content" })

vim.keymap.set("n", "<leader>yf", function()
	vim.cmd('normal! ggVG"+y')
end, { noremap = true, desc = "Yank entire file to system clipboard" })

vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- VISUAL MODE --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("v", "<leader>y", function()
	vim.cmd('normal! "+y')
end, { noremap = true, desc = "Yank to clipboard" })

vim.keymap.set("v", "<leader>p", function()
	vim.cmd('normal! "_dP')
end, { noremap = true, desc = "Paste without yanking selection" })

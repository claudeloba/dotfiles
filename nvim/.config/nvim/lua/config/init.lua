-- Allmänna editorinställningar
vim.opt.number = true -- visa radnummer
vim.opt.relativenumber = true -- visa relativa rader
vim.opt.smartindent = true
vim.opt.scrolloff = 8 -- håll 8 rader marginal ovanför/under cursorn
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- använd spaces istället för \t

-- Skapa en helper-funktion för att sätta lokala options
local function set_indent(tabsize)
	vim.opt_local.tabstop = tabsize
	vim.opt_local.shiftwidth = tabsize
	vim.opt_local.softtabstop = tabsize
	vim.opt_local.expandtab = true -- använd spaces istället för \t
end

-- Grupp för att undvika duplicerade autocmds
vim.api.nvim_create_augroup("LanguageSpecificIndent", { clear = true })

-- Golang → Tabs, 4 kolumner
vim.api.nvim_create_autocmd("FileType", {
	group = "LanguageSpecificIndent",
	pattern = "go",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab = false -- Go använder tabs, inte spaces
	end,
})

-- Python → 4 spaces
vim.api.nvim_create_autocmd("FileType", {
	group = "LanguageSpecificIndent",
	pattern = "python",
	callback = function()
		set_indent(4)
	end,
})

-- JavaScript och TypeScript → 2 spaces
vim.api.nvim_create_autocmd("FileType", {
	group = "LanguageSpecificIndent",
	pattern = { "javascript", "typescript" },
	callback = function()
		set_indent(2)
	end,
})

-- YAML → ofta 2 spaces, vissa använder 4
vim.api.nvim_create_autocmd("FileType", {
	group = "LanguageSpecificIndent",
	pattern = "yaml",
	callback = function()
		set_indent(2)
	end,
})

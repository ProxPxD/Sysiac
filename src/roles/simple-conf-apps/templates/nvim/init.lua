local keymap = vim.keymap.set

-- Wrapped line movement
keymap({ "n", "v" }, "<Down>", "gj")
keymap({ "n", "v" }, "<Up>", "gk")
keymap("i", "<Down>", "<C-o>gj")
keymap("i", "<Up>", "<C-o>gk")
-- Line displayal
vim.opt.whichwrap:append("<,>,[,]")
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Word movement
keymap("n", "<C-Right>", "e<Right>")
keymap("i", "<C-Right>", "<C-o>e<Right>")


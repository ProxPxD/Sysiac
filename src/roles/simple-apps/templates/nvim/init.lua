local keymap = vim.keymap.set

-- Wrapped line movement
keymap({ "n", "v" }, "<Down>", "gj")
keymap({ "n", "v" }, "<Up>", "gk")
keymap("i", "<Down>", "<C-o>gj")
keymap("i", "<Up>", "<C-o>gk")
vim.opt.whichwrap:append("<,>,[,]")

-- Word movement
keymap("n", "<C-Right>", "e")
keymap("i", "<C-Right>", "<C-o>e")


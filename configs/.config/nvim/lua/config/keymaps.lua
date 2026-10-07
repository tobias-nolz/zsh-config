local map = vim.keymap.set

map("n", "<leader>q", "<cmd>wq<cr>", { desc = "Write and quit" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

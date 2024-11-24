require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

-- Do this in cinnamon plugin
-- map("n", "<C-u>", "<C-u>zz")
-- map("n", "<C-d>", "<C-d>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "Q", "<nop>")
map("n", "q:", "<nop>")

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- Keymap for opening weblinks
map("n", "gx", [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]])

local map = vim.keymap.set

-- Window navigation handled by vim-tmux-navigator plugin (C-h/j/k/l)

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer (tab)" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer (tab)" })
map("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "Pin buffer" })
map("n", "<leader>bP", ":BufferLineGroupClose ungrouped<CR>", { desc = "Close unpinned buffers" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear search highlights
map("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Better paste (don't overwrite register)
map("x", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })

-- Quickfix navigation
map("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix" })
map("n", "<leader>cn", ":cnext<CR>", { desc = "Next quickfix" })
map("n", "<leader>cp", ":cprev<CR>", { desc = "Previous quickfix" })

-- System clipboard
map("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- Format JSON with jq
map("n", "<leader>jf", ":.!jq .<CR>", { desc = "Format line as JSON" })
map("n", "<leader>jF", ":%!jq .<CR>", { desc = "Format file as JSON" })

-- Terminal (toggleterm)
map("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { desc = "Float terminal" })
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", ":ToggleTerm direction=vertical size=80<CR>", { desc = "Vertical terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>xl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
map("n", "<leader>xn", "<cmd>Noice history<cr>", { desc = "Notification history" })

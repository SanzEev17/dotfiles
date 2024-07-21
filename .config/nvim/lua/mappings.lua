vim.g.mapleader = " "

local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })

map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- Nvim Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree toggle window" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "Comment toggle", remap = true })

-- Inc-Rename
map("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Barbar
map("n", "<tab>", "<cmd>BufferNext<CR>", { desc = "Goto next buffer" })
map("n", "<S-tab>", "<cmd>BufferPrevious<CR>", { desc = "Goto previous buffer" })
map("n", "<leader>bd", "<cmd>BufferClose<CR>", { desc = "Delete current buffer" })
map("n", "<leader>bp", "<cmd>BufferPin<CR>", { desc = "Toggle pin for current buffer" })
map("n", "<leader>bl", "<cmd>BufferCloseBuffersLeft<CR>", { desc = "Close all left buffer" })
map("n", "<leader>br", "<cmd>BufferCloseBuffersRight<CR>", { desc = "Close all right buffers" })
map("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all other buffers" })

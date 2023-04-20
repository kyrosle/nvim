vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

vim.keymap.set({ "n", "x" }, "gt", "gg")
vim.keymap.set({ "n", "x" }, "gb", "G")
vim.keymap.set({ "n", "x" }, "gh", "_")
vim.keymap.set({ "n", "x" }, "gl", "$")
vim.keymap.set({ "n", "x" }, "gj", "L")
vim.keymap.set({ "n", "x" }, "gk", "H")

vim.keymap.set("n", "H", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })

vim.keymap.set("n", "/", "<cmd>FzfLua blines<CR>", { desc = "Search in buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

vim.keymap.set("n", "<C-w>", "<cmd>w<CR>", { desc = "Write buffer", silent = true })
vim.keymap.set("i", "<C-w>", "<Esc><cmd>w<CR>", { desc = "Write buffer", silent = true })

vim.keymap.set({ "n", "x", "o" }, "s", "<cmd>LeapBuffer<CR>", { desc = "[Leap] Search in buffer" })
vim.keymap.set(
    { "n", "x", "o" },
    "S",
    "<cmd>LeapWindow<CR>",
    { desc = "[Leap] Search cross window" }
)

vim.keymap.set("n", "zR", "<cmd>UFOOpenAllFolds<CR>", { desc = "[UFO]Open all folds" })
vim.keymap.set("n", "zM", "<cmd>UFOCloseAllFolds<CR>", { desc = "[UFO]Close all folds" })

vim.keymap.set("n", "<leader>q", "<cmd>BufferRemove<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>g", "<cmd>Lazygit<CR>", { desc = "Lazygit" })
vim.keymap.set("t", "<leader>g", "<C-\\><C-n><cmd>Lazygit<CR>", { desc = "Close Lazygit" })

for i = 1, 6 do
    local lhs = "<leader>" .. i
    local rhs = i .. "<C-w>w"
    vim.keymap.set("n", lhs, rhs, { desc = "Go to window #" .. i })
end

vim.keymap.set("n", "<leader><CR>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<leader><BS>", "O<Esc>", { desc = "New line above" })

vim.keymap.set("n", "<leader>?", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua keymaps<CR>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>\\", "<cmd>Lazy<CR>", { desc = "Plugins" })
vim.keymap.set("n", "<leader>.", "<cmd>FindCommands<CR>", { desc = "Commands" })

vim.keymap.set("n", "<leader>cn", "<cmd>NodeAction<CR>", { desc = "Node action" })

vim.keymap.set("n", "<leader>e", "<cmd>HydraEditorOptions<CR>", { desc = "Hydra Editor Options" })
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "Find files" })

vim.keymap.set("n", "<leader>h", "<cmd>FocusSplitLeft<CR>", { desc = "Split left" })
vim.keymap.set("n", "<leader>j", "<cmd>FocusSplitDown<CR>", { desc = "Split down" })
vim.keymap.set("n", "<leader>k", "<cmd>FocusSplitUp<CR>", { desc = "Split up" })
vim.keymap.set("n", "<leader>l", "<cmd>FocusSplitRight<CR>", { desc = "Split right" })

vim.keymap.set("n", "<leader>mm", require("harpoon.mark").add_file, { desc = "Harpoon mark" })
vim.keymap.set(
    "n",
    "<leader>mu",
    require("harpoon.ui").toggle_quick_menu,
    { desc = "Harpoon menu" }
)
vim.keymap.set("n", "<leader>mn", require("harpoon.ui").nav_next, { desc = "Harpoon next" })
vim.keymap.set("n", "<leader>mp", require("harpoon.ui").nav_prev, { desc = "Harpoon prev" })

vim.keymap.set("n", "<leader>nf", "<cmd>Neogen func<CR>", { desc = "Annotation function" })
vim.keymap.set("n", "<leader>nt", "<cmd>Neogen type<CR>", { desc = "Annotation type" })
vim.keymap.set("n", "<leader>nc", "<cmd>Neogen class<CR>", { desc = "Annotation class" })

vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<CR>", { desc = "Oil file manager" })
vim.keymap.set("n", "<leader>p", "<cmd>FindProjects<CR>", { desc = "Projects" })
vim.keymap.set("n", "<leader>q", "<cmd>BufferRemove<CR>", { desc = "Quit" })

vim.keymap.set("v", "<leader>r", "<cmd>Refactor<CR>", { desc = "Refactor" })
-- TODO bulk rename

vim.keymap.set("n", "<leader>s", "<cmd>FzfLua live_grep<CR>", { desc = "Grep Search" })

-- Escape from terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-t>", "<cmd>FTermToggle<CR>", { desc = "Terminal" })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>FTermToggle<CR>", { desc = "Terminal" })

vim.keymap.set("n", "<leader>u", "<cmd>HydraUrlView<CR>", { desc = "Urls" })

vim.keymap.set("n", "<leader>y", "<cmd>Neoclip<CR>", { desc = "Yank history" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Zen mode" })

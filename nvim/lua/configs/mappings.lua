-- Global Keymappings
-- ~~~~~~~~~~~~~~~~~~
local ck = require("caskey")
local cmd = ck.cmd
local emitted = ck.emitted
local ft = ck.ft

vim.g.mapleader = " "
vim.g.maplocalleader = " "

return {
    mode = { "n" },

    ["j"] = { act = "v:count == 0 ? 'gj': 'j'", expr = true, desc = "Jump one line down" },
    ["k"] = { act = "v:count == 0 ? 'gk':'k'", expr = true, desc = "Jump one line up" },

    -- Motion inside buffer
    ["g"] = {
        name = "Goto",
        mode = { "n", "x" },

        ["t"] = { act = "gg", desc = "Top of the buffer" },
        ["b"] = { act = "G", desc = "Bottom of the buffer" },
        ["h"] = { act = "_", desc = "Head of the line" },
        ["l"] = { act = "$", desc = "Last of the line" },
        ["u"] = { act = "<c-u>", desc = "Scroll up" },
        ["d"] = { act = "<C-d>", desc = "Scroll down" },

        ["k"] = { act = "H", desc = "Top of the window" },
        ["j"] = { act = "L", desc = "Bottom of the window" },
    },
    -- Treesitter Node Action
    ["n"] = { act = cmd("NodeAction"), desc = "TS Node Action" },

    ["zf"] = {
        name = "UFO",

        ["o"] = {
            act = cmd("UFOOpenAllFolds"),
            desc = "Open all folds",
            when = emitted("AllFoldsClosed"),
        }, -- TODO condition: when there are any folds
        ["c"] = {
            act = cmd("UFOCloseAllFolds"),
            desc = "Close all folds",
        }, -- TODO condition: when there are any unfolds
        ["p"] = {
            act = cmd("UFOGoNextClosedAndPeak"),
            desc = "Peak next fold",
            when = emitted("AllFoldsClosed"),
        },
        ["P"] = {
            act = cmd("UFOGoPrevClosedAndPeak"),
            desc = "Peak previous fold",
            when = emitted("AllFoldsClosed"),
        },
    },
    ["q"] = {
        --TODO normal mode
    },
    {
        mode = "t",
        when = {
            ft("FTerm"),
        },
        ["<A-q>"] = { act = cmd("CloseTerminal"), desc = "Close terminal" },
        ["<A-c>"] = { act = cmd("ExitTerminal"), desc = "Exit terminal" },
    },
    {
        mode = "t",
        when = {
            ft("GitUI"),
        },
        ["<A-q>"] = { act = cmd("CloseGitUI"), desc = "Close GitUI" },
        ["<A-c>"] = { act = cmd("ExitGitUI"), desc = "Exit GitUI" },
    },
    {
        mode = "t",
        when = {
            ft("nnn"),
        },
        ["<A-q>"] = { act = cmd("CloseNNN"), desc = "Close nnn" },
        ["<A-c>"] = { act = cmd("ExitNNN"), desc = "Exit nnn" },
    },
    ["<A-r>"] = { act = "<C-r>", desc = "Redo" },

    ["<Tab>"] = { act = cmd("bnext"), desc = "Next buffer" },
    ["<S-Tab>"] = { act = cmd("bprevious"), desc = "Prev buffer" },

    ["<leader><right>"] = { act = cmd("tabnext"), desc = "Next tabpage" },
    ["<leader><left>"] = { act = cmd("tabprevious"), desc = "Prev tabpage" },
    -- --  -- Comment
    -- ["gc"] = { act = "v:lua.MiniComment.operator()", desc = "Comment textobject", expr = true },
    -- {
    --     mode = "o",
    --     ["gc"] = { act = cmd("lua MiniComment.textobject()"), desc = "Comment textobject" },
    -- },
    -- {
    --     mode = "x",
    --     ["gc"] = {
    --         act = [[:<c-u>lua MiniComment.operator('visual')<cr>]],
    --         desc = "Comment selection",
    --     },
    -- },
    -- ["gcc"] = {
    --     act = "v:lua.MiniComment.operator() . '_'",
    --     desc = "Comment current line",
    --     expr = true,
    -- },
    --  Gomove
    -- ["<A-h>"] = { act = "<Plug>GoNSMLeft", desc = "Move left" },
    -- ["<A-j>"] = { act = "<Plug>GoNSMDown", desc = "Move down" },
    -- ["<A-k>"] = { act = "<Plug>GoNSMUp", desc = "Move up" },
    -- ["<A-l>"] = { act = "<Plug>GoNSMRight", desc = "Move right" },
    -- ["<A-H>"] = { act = "<Plug>GoNSDLeft", desc = "Duplicate left" },
    -- ["<A-J>"] = { act = "<Plug>GoNSDDown", desc = "Duplicate down" },
    -- ["<A-K>"] = { act = "<Plug>GoNSDUp", desc = "Duplicate up" },
    -- ["<A-L>"] = { act = "<Plug>GoNSDRight", desc = "Duplicate right" },
    --
    -- {
    --     mode = { "x" },
    --
    --     ["<A-h>"] = { act = "<Plug>GoVSMLeft", desc = "Move left" },
    --     ["<A-j>"] = { act = "<Plug>GoVSMDown", desc = "Move down" },
    --     ["<A-k>"] = { act = "<Plug>GoVSMUp", desc = "Move up" },
    --     ["<A-l>"] = { act = "<Plug>GoVSMRight", desc = "Move right" },
    --     ["<A-H>"] = { act = "<Plug>GoVSDLeft", desc = "Duplicate left" },
    --     ["<A-J>"] = { act = "<Plug>GoVSDDown", desc = "Duplicate down" },
    --     ["<A-K>"] = { act = "<Plug>GoVSDUp", desc = "Duplicate up" },
    --     ["<A-L>"] = { act = "<Plug>GoVSDRight", desc = "Duplicate right" },
    -- },
    -- -- Leader Starts
    -- todo <leader>number => window or buffer navigation

    ["<leader><BS>"] = { act = "O<Esc>", desc = "New line up" },
    ["<leader><Enter>"] = { act = "o<Esc>", desc = "New line down" },

    -- 🅰 Actions => Aerial
    ["<leader>a"] = {
        name = "Actions",

        s = {
            act = "<cmd>w<CR><Esc>",
            desc = "Save buffer",
        },
    },

    -- 🅱  Buffer TODO add ordinal number to buffers then use <leader>number to jump to specific buffer, <Tab> for tab pages or tabout.nvim
    ["<leader>b"] = {
        name = "Buffer",

        ["q"] = { act = cmd("BufferRemove"), desc = "Quit current buffer" },
    },

    -- 🅲 Command Palette
    ["<leader>c"] = { act = cmd("Legendary"), desc = "Command Palette" },

    -- 🅳 Debug
    -- ["<leader>d"]

    -- 🅴 File Explorer
    ["<leader>e"] = { act = cmd("OpenNNN"), desc = "File Explorer" },

    -- 🅵 Fuzzy Finder
    ["<leader>f"] = {
        name = "Find",

        -- TODO
        b = {
            act = cmd("SearchInBuffer"),
            desc = "Search in buffer",
        },
        f = { act = cmd("Telescope find_files"), desc = "Files" },
        r = { act = cmd("Telescope repo list search_dirs=~/Projects/"), desc = "Repos" },
        g = { act = cmd("Telescope live_grep"), desc = "Live Grep" },
        m = { act = cmd("Telescope harpoon marks"), desc = "Marks" },
        n = { act = cmd("Telescope notify"), desc = "notify" },
        t = { act = cmd("TodoTelescope"), desc = "Todos" },
    },

    -- 🅶 Git
    ["<leader>g"] = {
        name = "Git",
        ["d"] = {
            act = function()
                --todo
                print("diffview")
            end,
            desc = "Differ View",
        },
        ["<Enter>"] = { act = function() end, desc = "[Hydra] Git" },

        ["u"] = { act = cmd("OpenGitUI"), desc = "Gitui" },
    },

    -- 🅷 Help Tags
    ["<leader>h"] = { act = cmd("Telescope help_tags"), desc = "Help Tags" },

    -- 🅸
    -- ["<leader>i"] = {}

    -- 🅹 Jobs
    -- ["<leader>j"] = {},

    -- 🅺 Keymaps
    ["<leader>k"] = { act = cmd("WhichKey"), desc = "WhichKey" },

    -- 🅻 Links
    ["<leader>l"] = {
        act = function()
            require("hydras.urlview-hydra").activate()
        end,
        desc = "URL View",
    },

    -- 🅼 Marks
    ["<leader>m"] = {
        act = function()
            local hydra = require("hydras.harpoon-hydra").init_hydra()
            hydra:activate()
        end,
        desc = "[Hydra] Marks",
    },

    -- 🅽 NeoGen
    -- ["<leader>n"] = { act = cmd("Neogen"), desc = "Generate annotation" }, -- looks enough without parameters
    ["<leader>n"] = {
        name = "NeoGen",

        ["f"] = { act = cmd("Neogen func"), desc = "Function annotation" },
        ["c"] = { act = cmd("Neogen class"), desc = "Class annotation" },
        ["t"] = { act = cmd("Neogen type"), desc = "Type annotation" },
        ["l"] = { act = cmd("Neogen file"), desc = "File annotation" },
    },

    -- 🅾 Editor Options TODO
    ["<leader>o"] = {
        act = function()
            local hydra = require("hydras.options-hydra").init_hydra()
            hydra:activate()
        end,
        desc = "Editor Options",
    },

    -- 🅿 Plugins
    ["<leader>p"] = { act = cmd("Lazy"), desc = "Plugins" },

    -- 🆀 QuickFix
    --
    -- Normal mode sniprun
    -- 🆁 Refactor
    ["<leader>r"] = { act = cmd("Refactor"), desc = "Refactor", mode = "v" },

    -- 🆂 Session
    ["<leader>s"] = {
        name = "Session",

        ["r"] = { act = cmd("Autosession search"), desc = "Restore session" },
        ["s"] = { act = cmd("SaveSession"), desc = "Save session" },
        ["d"] = { act = cmd("Autosession delete"), desc = "Delete session" },
    },
    -- 🆃 Terminal
    ["<leader>t"] = { act = cmd("OpenTerminal"), desc = "Terminal" },

    -- 🆄 Undotree
    ["<leader>u"] = { act = cmd("UndotreeToggle"), desc = "Undotree" },

    -- 🆅

    -- 🆆 Windows
    ["<leader>w"] = {

        name = "Windows",

        -- Navigation between windows
        ["h"] = { act = cmd("GotoLeftWindow"), desc = "Go to left window" },
        ["j"] = { act = cmd("GotoDownWindow"), desc = "Go to down window" },
        ["k"] = { act = cmd("GotoUpWindow"), desc = "Go to up window" },
        ["l"] = { act = cmd("GotoRightWindow"), desc = "Go to right window" },
        ["q"] = { act = "<C-w>q", desc = "Quit the current window" },

        -- Window Resize
        ["r"] = { act = cmd("StartResizeMode"), desc = "Start window resize mode" },

        ["H"] = { act = cmd("ResizeWindowLeft"), desc = "Resize window left" },
        ["K"] = { act = cmd("ResizeWindowUp"), desc = "Resize window up" },
        ["J"] = { act = cmd("ResizeWindowDown"), desc = "Resize window down" },
        ["L"] = { act = cmd("ResizeWindowRight"), desc = "Resize window right" },

        -- Window Maximize
        ["M"] = { act = cmd("WindowsMaximize"), desc = "Maximize" },
        ["_"] = { act = cmd("WindowsMaximizeHorizontally"), desc = "Maximize horizontally" },
        ["|"] = { act = cmd("WindowsMaximizeVertically"), desc = "Maximize vertically" },
        ["E"] = { act = cmd("WindowsEqualize"), desc = "Equalize" },

        -- WinShift (move window)
        ["<Left>"] = { act = cmd("WinShift left"), desc = "Move window left" },
        ["<Down>"] = { act = cmd("WinShift down"), desc = "Move window down" },
        ["<Up>"] = { act = cmd("WinShift up"), desc = "Move window up" },
        ["<Right>"] = { act = cmd("WinShift right"), desc = "Move window right" },
        ["<S-Left>"] = { act = cmd("WinShift far_left"), desc = "Move window far left" },
        ["<S-Up>"] = { act = cmd("WinShift far_up"), desc = "Move window far up" },
        ["<S-Down>"] = { act = cmd("WinShift far_down"), desc = "Move window far down" },
        ["<S-Right>"] = { act = cmd("WinShift far_right"), desc = "Move window far right" },

        ["s"] = { act = "<C-w>s", desc = "Split window horizontally" },
        ["v"] = { act = "<C-w>v", desc = "Split window vertically" },

        ["<Enter>"] = {
            act = function()
                local hydra = require("hydras.windows-hydra").init_hydra()
                hydra:activate()
            end,
            desc = "[Hydra] Windows",
        },
    },

    -- 🆇
    -- 🆈 Yanky Histoy
    ["<leader>y"] = {
        act = cmd("Neoclip"),
        desc = "[Hydra] Yanky",
    },
    -- 🆉
    -- ZenMode
    -- Leader Ends
    -- LSP on_attach
    {
        mode = { "n" },
        when = "LspAttach",
        -- common lsp key bindings
        ["K"] = {
            act = function()
                vim.lsp.buf.hover()
            end,
            desc = "Hover",
        },
        ["]d"] = {
            act = function()
                vim.diagnostic.goto_next({})
            end,
            desc = "Next diagnostic",
        },
        ["[d"] = {
            act = function()
                vim.diagnostic.goto_prev({})
            end,
            desc = "Previous diagnostic",
        },
        -- When null-ls is attached
        ["ft"] = {
            act = function()
                vim.lsp.buf.format() -- TODO conditional format on save
            end,
            desc = "[LSP] Format",
            --when_extend = vim.lsp.get_active_clients
        },
        ["gp"] = {
            name = "Goto Preview",

            ["d"] = {
                act = function()
                    require("goto-preview").goto_preview_definition()
                end,
                desc = "[LSP] Goto preview definition",
            },
            ["i"] = {
                act = function()
                    require("goto-preview").goto_preview_implementation()
                end,
                desc = "[LSP] Goto preivew implementation",
            },
            ["t"] = {
                act = function()
                    require("goto-preview").goto_preview_type_definition()
                end,
                desc = "[LSP] Goto preview type definition",
            },
            ["r"] = {
                act = function()
                    require("goto-preview").goto_preview_reference()
                end,
                desc = "[LSP] Goto preview reference",
            },
            ["q"] = {
                act = function()
                    require("goto-preview").close_all_win()
                end,
                desc = "[LSP] Close all windows",
            },
        },
        -- Typescript related key bindings

        ["ai"] = {
            act = cmd("TypescriptAddMissingImports"),
            desc = "[LSP] Add missing imports",
            when_extend = emitted("TSServerAttached"),
        },
        ["oi"] = {
            act = cmd("TypescriptOrganizeImports"),
            desc = "[LSP] Organize imports",
            when_extend = emitted("TSServerAttached"),
        },
        ["ru"] = {
            act = cmd("TypescriptRemoveUnused"),
            desc = "[LSP] Remove unused vars",
            when_extend = emitted("TSServerAttached"),
        },
        ["fa"] = {
            act = cmd("TypescriptFixAll"),
            desc = "[LSP] Fix all",
            when_extend = emitted("TSServerAttached"),
        },
        -- TODO Rust related key bindings
    },
    -- Leap
    {
        mode = { "n", "x", "o" },
        ["s"] = {
            act = function()
                require("plugins.leap").search()
            end,
            desc = "[Leap] Search",
        },
        ["S"] = {
            act = function()
                require("plugins.leap").search_cross_window()
            end,
            desc = "[Leap] Search cross window",
        },
    },
    -- Yanky
    --   {
    --       mode = { "n", "x" },
    --       ["y"] = { act = "<Plug>(YankyYank)", desc = "Yank (Copy)" },
    --       ["p"] = { act = "<Plug>(YankyPutAfter)", desc = "Paste after cursor" },
    --       ["P"] = { act = "<Plug>(YankyPutBefore)", desc = "Paste before cursor" },
    --       -- TODO directly invoke yanky ring
    --       --[[         ["]p"] = {
    --           act = function()
    --               local t = require("hydras.yanky-hydra").t
    --               vim.fn.feedkeys(t("<Plug>(YankyPutIndentAfterLinewise)"))
    --               local hydra = require("hydras.yanky-hydra").init_hydra()
    --               hydra:activate()
    --           end,
    --           desc = "Paste indent after linewise",
    --           mode = "n",
    --       },
    -- ]]
    --   },
}

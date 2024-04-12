-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        -- vim options can be configured here
        options = {
            opt = { -- vim.opt.<key>
                -- 使用jk移动光标时，上下方保留7行,
                scrolloff = 10,
                sidescrolloff = 10,
                -- 设置自动折叠,
                smartindent = false,
                -- 显示空白字符,
                list = true,
                listchars = 'tab:| ,trail:▫',
            },
            g = { -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
                python3_host_prog = 'D:/Program Files (x86)/Python311/python.exe',
                python_host_prog = 'D:/Program Files (x86)/Python27/python.exe',
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        mappings = {
            -- first key is the mode
            n = {
                -- second key is the lefthand side of the map

                -- navigate buffer tabs with `H` and `L`
                L = { function()
                    require("astrocore.buffer").nav(vim.v.count1)
                end, desc = "Next buffer" },
                H = { function()
                    require("astrocore.buffer").nav(-vim.v.count1)
                end, desc = "Previous buffer" },

                ["<Leader>q"] = { function()
                    require("astrocore.buffer").close()
                end, desc = "Close buffer" },

                ["s"] = { "<NOP>", desc = "Set s is Null" },
                ["sj"] = { "<Cmd>set splitbelow<CR><Cmd>split<CR>", desc = "Split down" },
                ["sk"] = { "<Cmd>set nosplitbelow<CR><Cmd>split<CR><Cmd>set splitbelow<CR>", desc = "Split up" },
                ["sl"] = { "<Cmd>set nosplitright<CR><Cmd>vsplit<CR><Cmd>set splitright<CR>", desc = "Split left" },
                ["sh"] = { "<Cmd>set nosplitright<CR><Cmd>vsplit<CR><Cmd>set splitright<CR>", desc = "Split right" },
                ['J'] = { '5j', desc = "move quick" },
                ['K'] = { '5k', desc = "move quick" },
                ['W'] = { '5w', desc = "move quick" },
                ['B'] = { '5b', desc = "move quick" },
                ['gh'] = { '^', desc = "go to line start" },
                ['gl'] = { '$', desc = "go to line end" },
                ['<Esc>'] = { '<Cmd>noh<CR><Esc>', desc = "no highlight" },
                ['ga'] = { "\'.", desc = "move last location" },
                ['<Leader>A'] = { 'maggVG', desc = "select All" },
                ['<Leader>p'] = { '"+p', desc = "paste from system cli" },
                ['<Leader>y'] = { '"+yy<CR>', desc = "copy line to sys cli" },
                ['<Leader>Y'] = { 'maggVG"by', desc = "copy All" },
                ['<Leader>i'] = { 'f(a', desc = "insert after (" },
                ['<Leader>tu'] = { '<Cmd>tabe<CR>', desc = "tab new" },
                ["<leader>ww"] = { function()
                    require("astronvim.utils.buffer").close_all(true)
                end, desc = "Close all buffers except current" },
                ["<Leader>wh"] = { "<C-w>h", desc = "Move to left split" },
                ["<Leader>wj"] = { "<C-w>j", desc = "Move to below split" },
                ["<Leader>wk"] = { "<C-w>k", desc = "Move to above split" },
                ["<Leader>wl"] = { "<C-w>l", desc = "Move to right split" },
                ["<Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" },
                ["<Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" },
                ["<Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" },
                ["<Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" },
                -- mappings seen under group name "Buffer"
                ["<leader>s"] = {
                    function()
                        require("flash").jump()
                    end,
                    desc = "Flash",
                },
                ['<C-p>'] = { '<Cmd>call mdip#MarkdownClipboardImage()<CR><ESC>j', desc = "Paste Markdown Image" },
                [',r'] = { '<Cmd>MarkdownPreview<CR>', desc = "MarkdownPreview" },
                [',rs'] = { '<Cmd>MarkdownPreviewStop<CR>', desc = "MarkdownPreviewStop" },
                [',gtc'] = { 'magg<Cmd>GenTocMarked<CR>g\'a', desc = "GenTocMarkded" },
                [',utc'] = { '<Cmd>UpdateToc<CR>', desc = "Update Toc" },
                [',tm'] = { '<Cmd>TableModeToggle<CR>', desc = "Table Mode" },
                ["<leader>fr"] = { function()
                    require("telescope.builtin").oldfiles()
                end, desc = "Find history" },
                ["<Leader>bD"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                                function(bufnr)
                                    require("astrocore.buffer").close(bufnr)
                                end
                        )
                    end,
                    desc = "Pick to close",
                },
                -- tables with just a `desc` key will be registered with which-key if it's installed
                -- this is useful for naming menus
                ["<Leader>b"] = { desc = "Buffers" },
                -- quick save
                ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
            },
            t = {
                -- setting a mapping to false will disable it
                -- ["<esc>"] = false,
            },
            v = {
                ['J'] = { '5j', desc = "move quick" },
                ['K'] = { '5k', desc = "move quick" },
                ['W'] = { '5w', desc = "move quick" },
                ['B'] = { '5b', desc = "move quick" },
                ['gh'] = { '^', desc = "go to line start" },
                ['gl'] = { '$', desc = "go to line end" },
            }
        },
    },
}

local M = {}

function M.mappings(maps)
    local utils = require "astronvim.utils"
    local is_available = utils.is_available
    -- Normal --
    -- Standard Operations
    maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
    maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
    maps.n["<leader>q"] = { function()
        require("astronvim.utils.buffer").close()
    end, desc = "Close buffer" }
    maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
    maps.n["<C-q>"] = { "<cmd>qa!<cr>", desc = "Quit Neovim" }

    maps.n["s"] = { "<NOP>", desc = "Set s is Null" }
    maps.n["sj"] = { "<Cmd>set splitbelow<CR><Cmd>split<CR>", desc = "Split down" }
    maps.n["sk"] = { "<Cmd>set nosplitbelow<CR><Cmd>split<CR><Cmd>set splitbelow<CR>", desc = "Split up" }
    maps.n["sl"] = { "<Cmd>set nosplitright<CR><Cmd>vsplit<CR><Cmd>set splitright<CR>", desc = "Split left" }
    maps.n["sh"] = { "<Cmd>set nosplitright<CR><Cmd>vsplit<CR><Cmd>set splitright<CR>", desc = "Split right" }

    maps.n['J'] = { '5j', desc = "move quick" }
    maps.n['K'] = { '5k', desc = "move quick" }
    maps.n['W'] = { '5w', desc = "move quick" }
    maps.n['B'] = { '5b', desc = "move quick" }
    maps.n['gh'] = { '^', desc = "go to line start" }
    maps.n['gl'] = { '$', desc = "go to line end" }
    maps.v['gh'] = { '^', desc = "go to line start" }
    maps.v['gl'] = { '$', desc = "go to line end" }
    maps.n['<Esc>'] = { '<Cmd>noh<CR><Esc>', desc = "no highlight" }
    maps.n['ga'] = { "\'.", desc = "move last location" }
    --空格键,
    maps.n['<Leader><Leader>'] = { '<Esc>/<++><CR><Cmd>noh<CR>c4l', desc = "find <++> and insert" }
    maps.n['<Leader>A'] = { 'maggVG', desc = "select All" }
    maps.n['<Leader>p'] = { '"+p', desc = "paste from system cli" }
    maps.n['<Leader>y'] = { '"+yy<CR>', desc = "copy line to sys cli" }
    maps.n['<Leader>Y'] = { 'maggVG"by', desc = "copy All" }
    maps.n['<Leader>i'] = { 'f(a', desc = "insert after (" }
    maps.n['<C-S-u>'] = { '<ESC>viwUwa', desc = "convert to Uppercase" }
    maps.n['<C-S-u>'] = { '<ESC>viwuwa', desc = "convert to Lowercase" }
    maps.n['<Leader>tu'] = { '<Cmd>tabe<CR>', desc = "tab new" }
    maps.i['<C-h>'] = { '<Left>', desc = "left" }
    maps.i['<C-l>'] = { '<Right>', desc = "right" }
    maps.i['<C-j>'] = { '<Down>', desc = "down" }
    maps.i['<C-k>'] = { '<Up>', desc = "up" }

    -- Manage Buffers
    maps.n["L"] = { function()
        require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
    end, desc = "Next buffer" }
    maps.n["H"] = {
        function()
            require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
        end,
        desc = "Previous buffer",
    }
    maps.n["<Tab>"] = {
        function()
            require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1)
        end,
        desc = "Move buffer tab right",
    }
    maps.n["<S-Tab>"] = {
        function()
            require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1))
        end,
        desc = "Move buffer tab left",
    }

    maps.n["<leader>ww"] = { function()
        require("astronvim.utils.buffer").close_all(true)
    end, desc = "Close all buffers except current" }

    -- NeoTree
    --[[
        -- 显示隐藏文件
        { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
        { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
        -- 文件操作
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "o", action = "system_open" },
    ]]

    -- visita
    if is_available "vista.vim" then
        maps.n["<C-l>"] = { "<cmd>Vista<cr>", desc = "Vista" }
    end

    if is_available "markdown-preview.nvim" then
        require("user/plugin-config/markdown")
    end
    -- Smart Splits
    if is_available "smart-splits.nvim" then
        maps.n["<Leader>wl"] = { function()
            require("smart-splits").move_cursor_left()
        end, desc = "Move to left split" }
        maps.n["<Leader>wj"] = { function()
            require("smart-splits").move_cursor_down()
        end, desc = "Move to below split" }
        maps.n["<Leader>wk"] = { function()
            require("smart-splits").move_cursor_up()
        end, desc = "Move to above split" }
        maps.n["<Leader>wh"] = { function()
            require("smart-splits").move_cursor_right()
        end, desc = "Move to right split" }
        maps.n["<Up>"] = { function()
            require("smart-splits").resize_up()
        end, desc = "Resize split up" }
        maps.n["<Down>"] = { function()
            require("smart-splits").resize_down()
        end, desc = "Resize split down" }
        maps.n["<Left>"] = { function()
            require("smart-splits").resize_left()
        end, desc = "Resize split left" }
        maps.n["<Right>"] = { function()
            require("smart-splits").resize_right()
        end, desc = "Resize split right" }
    else
        maps.n["<Leader>wh"] = { "<C-w>h", desc = "Move to left split" }
        maps.n["<Leader>wj"] = { "<C-w>j", desc = "Move to below split" }
        maps.n["<Leader>wk"] = { "<C-w>k", desc = "Move to above split" }
        maps.n["<Leader>wl"] = { "<C-w>l", desc = "Move to right split" }
        maps.n["<Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
        maps.n["<Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
        maps.n["<Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
        maps.n["<Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
    end
    if is_available "flash.nvim" then
        maps.n["<leader>s"] = {
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        }
        maps.x["<leader>s"] = {
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        }
        maps.o["<leader>s"] = {
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        }
        maps.n["<leader><leader>s"] = {
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        }
        maps.x["<leader><leader>s"] = {
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        }
        maps.o["<leader><leader>s"] = {
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        }
    end
    -- Telescope
    if is_available "telescope.nvim" then
        maps.n["<leader>ff"] = { function()
            require("telescope.builtin").find_files()
        end, desc = "Find files" }
        maps.n["<leader>fF"] = {
            function()
                require("telescope.builtin").find_files { hidden = true, no_ignore = true }
            end,
            desc = "Find all files",
        }
        if is_available "telescope-file-browser.nvim" then
            require("telescope").load_extension "file_browser"
            maps.n["<leader>fb"] = { "<Cmd>Telescope file_browser<CR>", desc = "Find Browser" }
        end
        maps.n["<leader>fr"] = { function()
            require("telescope.builtin").oldfiles()
        end, desc = "Find history" }
        maps.n["<leader>fw"] = { function()
            require("telescope.builtin").live_grep()
        end, desc = "Find words" }
        maps.n["<leader>fW"] = {
            function()
                require("telescope.builtin").live_grep {
                    additional_args = function(args)
                        return vim.list_extend(args, { "--hidden", "--no-ignore" })
                    end,
                }
            end,
            desc = "Find words in all files",
        }
    end
    return maps
end

return M
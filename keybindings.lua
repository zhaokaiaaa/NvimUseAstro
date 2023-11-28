local utils = require "astronvim.utils"
local get_icon = utils.get_icon
local is_available = utils.is_available
local ui = require "astronvim.utils.ui"

local maps = require("astronvim.utils").empty_map_table()

local sections = {
    f = { desc = get_icon("Search", 1, true) .. "Find" },
    p = { desc = get_icon("Package", 1, true) .. "Packages" },
    l = { desc = get_icon("ActiveLSP", 1, true) .. "LSP" },
    u = { desc = get_icon("Window", 1, true) .. "UI/UX" },
    b = { desc = get_icon("Tab", 1, true) .. "Buffers" },
    bs = { desc = get_icon("Sort", 1, true) .. "Sort Buffers" },
    d = { desc = get_icon("Debugger", 1, true) .. "Debugger" },
    g = { desc = get_icon("Git", 1, true) .. "Git" },
    S = { desc = get_icon("Session", 1, true) .. "Session" },
    t = { desc = get_icon("Terminal", 1, true) .. "Terminal" },
}

-- Normal --
-- Standard Operations
maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit current buffer" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" }

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
maps.n['<C-s>'] = { '<Cmd>w<CR>', desc = "save" }
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
maps.n['<Leader>vi'] = { '<Cmd>vs $MYVIMRC<CR>', desc = "open vimrc" }
maps.n['<Leader>vs'] = { '<Cmd>source $MYVIMRC<CR>', desc = "reload vimrc" }
maps.n['<Leader>tu'] = { '<Cmd>tabe<CR>', desc = "tab new" }
maps.i['<C-h>'] = { '<Left>', desc = "left" }
maps.i['<C-l>'] = { '<Right>', desc = "right" }
maps.i['<C-j>'] = { '<Down>', desc = "down" }
maps.i['<C-k>'] = { '<Up>', desc = "up" }

if not vim.ui.open then
    maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" }
end

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

-- Navigate tabs
maps.n["]t"] = { function()
    vim.cmd.tabnext()
end, desc = "Next tab" }
maps.n["[t"] = { function()
    vim.cmd.tabprevious()
end, desc = "Previous tab" }

-- NeoTree
if is_available "neo-tree.nvim" then
    maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
    maps.n["<leader>o"] = {
        function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
            else
                vim.cmd.Neotree "focus"
            end
        end,
        desc = "Toggle Explorer Focus",
    }

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
end

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
    maps.n["<leader>f"] = sections.f
    maps.n["<leader>g"] = sections.g
    maps.n["<leader>gb"] = { function()
        require("telescope.builtin").git_branches { use_file_path = true }
    end, desc = "Git branches" }
    maps.n["<leader>gc"] = {
        function()
            require("telescope.builtin").git_commits { use_file_path = true }
        end,
        desc = "Git commits (repository)",
    }
    maps.n["<leader>gC"] = {
        function()
            require("telescope.builtin").git_bcommits { use_file_path = true }
        end,
        desc = "Git commits (current file)",
    }
    maps.n["<leader>gt"] = { function()
        require("telescope.builtin").git_status { use_file_path = true }
    end, desc = "Git status" }
    maps.n["<leader>f<CR>"] = { function()
        require("telescope.builtin").resume()
    end, desc = "Resume previous search" }
    maps.n["<leader>f'"] = { function()
        require("telescope.builtin").marks()
    end, desc = "Find marks" }
    maps.n["<leader>f/"] = { function()
        require("telescope.builtin").current_buffer_fuzzy_find()
    end, desc = "Find words in current buffer" }
    maps.n["<leader>fa"] = {
        function()
            local cwd = vim.fn.stdpath "config" .. "/.."
            local search_dirs = {}
            for _, dir in ipairs(astronvim.supported_configs) do
                -- search all supported config locations
                if dir == astronvim.install.home then
                    dir = dir .. "/lua/user"
                end -- don't search the astronvim core files
                if vim.fn.isdirectory(dir) == 1 then
                    table.insert(search_dirs, dir)
                end -- add directory to search if exists
            end
            if vim.tbl_isempty(search_dirs) then
                -- if no config folders found, show warning
                utils.notify("No user configuration files found", vim.log.levels.WARN)
            else
                if #search_dirs == 1 then
                    cwd = search_dirs[1]
                end -- if only one directory, focus cwd
                require("telescope.builtin").find_files {
                    prompt_title = "Config Files",
                    search_dirs = search_dirs,
                    cwd = cwd,
                    follow = true,
                } -- call telescope
            end
        end,
        desc = "Find AstroNvim config files",
    }
    maps.n["<leader>fc"] = { function()
        require("telescope.builtin").grep_string()
    end, desc = "Find word under cursor" }
    maps.n["<leader>fC"] = { function()
        require("telescope.builtin").commands()
    end, desc = "Find commands" }
    maps.n["<leader>ff"] = { function()
        require("telescope.builtin").find_files()
    end, desc = "Find files" }
    maps.n["<leader>fF"] = {
        function()
            require("telescope.builtin").find_files { hidden = true, no_ignore = true }
        end,
        desc = "Find all files",
    }
    maps.n["<leader>fh"] = { function()
        require("telescope.builtin").help_tags()
    end, desc = "Find help" }
    maps.n["<leader>fk"] = { function()
        require("telescope.builtin").keymaps()
    end, desc = "Find keymaps" }
    maps.n["<leader>fm"] = { function()
        require("telescope.builtin").man_pages()
    end, desc = "Find man" }
    if is_available "nvim-notify" then
        maps.n["<leader>fn"] = { function()
            require("telescope").extensions.notify.notify()
        end, desc = "Find notifications" }
    end
    if is_available "telescope-file-browser.nvim" then
        require("telescope").load_extension "file_browser"
        maps.n["<leader>fb"] = { "<Cmd>Telescope file_browser<CR>", desc = "Find Browser" }
    end
    maps.n["<leader>fr"] = { function()
        require("telescope.builtin").oldfiles()
    end, desc = "Find history" }
    maps.n["<leader>fg"] = { function()
        require("telescope.builtin").registers()
    end, desc = "Find registers" }
    maps.n["<leader>ft"] = { function()
        require("telescope.builtin").colorscheme { enable_preview = true }
    end, desc = "Find themes" }
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
    maps.n["<leader>l"] = sections.l
    maps.n["<leader>ls"] = {
        function()
            local aerial_avail, _ = pcall(require, "aerial")
            if aerial_avail then
                require("telescope").extensions.aerial.aerial()
            else
                require("telescope.builtin").lsp_document_symbols()
            end
        end,
        desc = "Search symbols",
    }
end

-- Terminal
if is_available "toggleterm.nvim" then
    maps.n["<leader>t"] = sections.t
    if vim.fn.executable "lazygit" == 1 then
        maps.n["<leader>g"] = sections.g
        maps.n["<leader>gg"] = {
            function()
                local worktree = require("astronvim.utils.git").file_worktree()
                local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
                utils.toggle_term_cmd("lazygit " .. flags)
            end,
            desc = "ToggleTerm lazygit",
        }
        maps.n["<leader>tl"] = maps.n["<leader>gg"]
    end
    if vim.fn.executable "node" == 1 then
        maps.n["<leader>tn"] = { function()
            utils.toggle_term_cmd "node"
        end, desc = "ToggleTerm node" }
    end
    if vim.fn.executable "gdu" == 1 then
        maps.n["<leader>tu"] = { function()
            utils.toggle_term_cmd "gdu"
        end, desc = "ToggleTerm gdu" }
    end
    if vim.fn.executable "btm" == 1 then
        maps.n["<leader>tt"] = { function()
            utils.toggle_term_cmd "btm"
        end, desc = "ToggleTerm btm" }
    end
    local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
    if python then
        maps.n["<leader>tp"] = { function()
            utils.toggle_term_cmd(python)
        end, desc = "ToggleTerm python" }
    end
    maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
    maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
    maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
    maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
    maps.t["<F7>"] = maps.n["<F7>"]
    maps.n["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
    maps.t["<C-'>"] = maps.n["<F7>"] -- requires terminal that supports binding <C-'>
end

if is_available "nvim-dap" then
    maps.n["<leader>d"] = sections.d
    maps.v["<leader>d"] = sections.d
    -- modified function keys found with `showkey -a` in the terminal to get key code
    -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
    maps.n["<F5>"] = { function()
        require("dap").continue()
    end, desc = "Debugger: Start" }
    maps.n["<F17>"] = { function()
        require("dap").terminate()
    end, desc = "Debugger: Stop" } -- Shift+F5
    maps.n["<F21>"] = { -- Shift+F9
        function()
            vim.ui.input({ prompt = "Condition: " }, function(condition)
                if condition then
                    require("dap").set_breakpoint(condition)
                end
            end)
        end,
        desc = "Debugger: Conditional Breakpoint",
    }
    maps.n["<F29>"] = { function()
        require("dap").restart_frame()
    end, desc = "Debugger: Restart" } -- Control+F5
    maps.n["<F6>"] = { function()
        require("dap").pause()
    end, desc = "Debugger: Pause" }
    maps.n["<F9>"] = { function()
        require("dap").toggle_breakpoint()
    end, desc = "Debugger: Toggle Breakpoint" }
    maps.n["<F10>"] = { function()
        require("dap").step_over()
    end, desc = "Debugger: Step Over" }
    maps.n["<F11>"] = { function()
        require("dap").step_into()
    end, desc = "Debugger: Step Into" }
    maps.n["<F23>"] = { function()
        require("dap").step_out()
    end, desc = "Debugger: Step Out" } -- Shift+F11
    maps.n["<leader>db"] = { function()
        require("dap").toggle_breakpoint()
    end, desc = "Toggle Breakpoint (F9)" }
    maps.n["<leader>dB"] = { function()
        require("dap").clear_breakpoints()
    end, desc = "Clear Breakpoints" }
    maps.n["<leader>dc"] = { function()
        require("dap").continue()
    end, desc = "Start/Continue (F5)" }
    maps.n["<leader>dC"] = {
        function()
            vim.ui.input({ prompt = "Condition: " }, function(condition)
                if condition then
                    require("dap").set_breakpoint(condition)
                end
            end)
        end,
        desc = "Conditional Breakpoint (S-F9)",
    }
    maps.n["<leader>di"] = { function()
        require("dap").step_into()
    end, desc = "Step Into (F11)" }
    maps.n["<leader>do"] = { function()
        require("dap").step_over()
    end, desc = "Step Over (F10)" }
    maps.n["<leader>dO"] = { function()
        require("dap").step_out()
    end, desc = "Step Out (S-F11)" }
    maps.n["<leader>dq"] = { function()
        require("dap").close()
    end, desc = "Close Session" }
    maps.n["<leader>dQ"] = { function()
        require("dap").terminate()
    end, desc = "Terminate Session (S-F5)" }
    maps.n["<leader>dp"] = { function()
        require("dap").pause()
    end, desc = "Pause (F6)" }
    maps.n["<leader>dr"] = { function()
        require("dap").restart_frame()
    end, desc = "Restart (C-F5)" }
    maps.n["<leader>dR"] = { function()
        require("dap").repl.toggle()
    end, desc = "Toggle REPL" }
    maps.n["<leader>ds"] = { function()
        require("dap").run_to_cursor()
    end, desc = "Run To Cursor" }

    if is_available "nvim-dap-ui" then
        maps.n["<leader>dE"] = {
            function()
                vim.ui.input({ prompt = "Expression: " }, function(expr)
                    if expr then
                        require("dapui").eval(expr, { enter = true })
                    end
                end)
            end,
            desc = "Evaluate Input",
        }
        maps.v["<leader>dE"] = { function()
            require("dapui").eval()
        end, desc = "Evaluate Input" }
        maps.n["<leader>du"] = { function()
            require("dapui").toggle()
        end, desc = "Toggle Debugger UI" }
        maps.n["<leader>dh"] = { function()
            require("dap.ui.widgets").hover()
        end, desc = "Debugger Hover" }
    end
end

-- Improved Code Folding
if is_available "nvim-ufo" then
    maps.n["zR"] = { function()
        require("ufo").openAllFolds()
    end, desc = "Open all folds" }
    maps.n["zM"] = { function()
        require("ufo").closeAllFolds()
    end, desc = "Close all folds" }
    maps.n["zr"] = { function()
        require("ufo").openFoldsExceptKinds()
    end, desc = "Fold less" }
    maps.n["zm"] = { function()
        require("ufo").closeFoldsWith()
    end, desc = "Fold more" }
    maps.n["zp"] = { function()
        require("ufo").peekFoldedLinesUnderCursor()
    end, desc = "Peek fold" }
end

-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "Indent line" }

-- Improved Terminal Navigation
maps.t["<C-h>"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" }
maps.t["<C-j>"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" }
maps.t["<C-k>"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" }
maps.t["<C-l>"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" }

maps.n["<leader>u"] = sections.u
-- Custom menu for modification of the user experience
if is_available "nvim-autopairs" then
    maps.n["<leader>ua"] = { ui.toggle_autopairs, desc = "Toggle autopairs" }
end
maps.n["<leader>ub"] = { ui.toggle_background, desc = "Toggle background" }
if is_available "nvim-cmp" then
    maps.n["<leader>uc"] = { ui.toggle_cmp, desc = "Toggle autocompletion" }
end
if is_available "nvim-colorizer.lua" then
    maps.n["<leader>uC"] = { "<cmd>ColorizerToggle<cr>", desc = "Toggle color highlight" }
end
maps.n["<leader>ud"] = { ui.toggle_diagnostics, desc = "Toggle diagnostics" }
maps.n["<leader>ug"] = { ui.toggle_signcolumn, desc = "Toggle signcolumn" }
maps.n["<leader>ui"] = { ui.set_indent, desc = "Change indent setting" }
maps.n["<leader>ul"] = { ui.toggle_statusline, desc = "Toggle statusline" }
maps.n["<leader>uL"] = { ui.toggle_codelens, desc = "Toggle CodeLens" }
maps.n["<leader>un"] = { ui.change_number, desc = "Change line numbering" }
maps.n["<leader>uN"] = { ui.toggle_ui_notifications, desc = "Toggle Notifications" }
maps.n["<leader>up"] = { ui.toggle_paste, desc = "Toggle paste mode" }
maps.n["<leader>us"] = { ui.toggle_spell, desc = "Toggle spellcheck" }
maps.n["<leader>uS"] = { ui.toggle_conceal, desc = "Toggle conceal" }
maps.n["<leader>ut"] = { ui.toggle_tabline, desc = "Toggle tabline" }
maps.n["<leader>uu"] = { ui.toggle_url_match, desc = "Toggle URL highlight" }
maps.n["<leader>uw"] = { ui.toggle_wrap, desc = "Toggle wrap" }
maps.n["<leader>uy"] = { ui.toggle_syntax, desc = "Toggle syntax highlighting (buffer)" }
maps.n["<leader>uh"] = { ui.toggle_foldcolumn, desc = "Toggle foldcolumn" }

utils.set_mappings(astronvim.user_opts("mappings", maps))

--=================================================================================
--=================markdown===========================
--=================================================================================
local vim = vim
-- opt setting
local function set_markdown_default_opt()
    local default_markdown_options = {
        --选项仅控制 Vim Markdown 特定折叠配置。
        vim_markdown_folding_disabled = 1,
        vim_markdown_folding_style_pythonic = 1,
        markdown_fenced_languages = "['bash=sh', 'javascript', 'js=javascript','json=javascript','typescript', 'ts=typescript', 'php','html','css','rust', 'sql']",
        --======MarkdownPreview====
        --[[
            zr: 降低整个缓冲区的折叠级别
            zR: 打开所有折叠
            zm: 增加整个缓冲区的折叠级别
            zM: 一路折叠一切
            za: 打开你光标所在的折叠
            zA: 递归地打开你的光标所在的折叠
            zc：关闭光标所在的折叠
            zC：递归关闭光标所在的折叠
        ]]
        mkdp_auto_start = 1,
        mkdp_auto_close = 0,
        mkdp_refresh_slow = 0,
        mkdp_browser = '',
        mkdp_command_for_global = 0,
        mkdp_open_to_the_world = 0,
        mkdp_echo_preview_url = 1,
        mkdp_browserfunc = '',
        mkdp_page_title = '「${name}」',
    }
    for k, v in pairs(default_markdown_options) do
        vim.g.k = v
    end
end

local function set_markdown_keymaps()
    local default_opts = { noremap = true, silent = true }
    local mode_key_map = {
        ['n'] = {
            ['<C-p>'] = '<Cmd>call mdip#MarkdownClipboardImage()<CR><ESC>j',
            [',r'] = '<Cmd>MarkdownPreview<CR>',
            [',rs'] = '<Cmd>MarkdownPreviewStop<CR>',
            [',gtc'] = 'magg<Cmd>GenTocMarked<CR>g\'a',
            [',utc'] = '<Cmd>UpdateToc<CR>',
            [',tm'] = '<Cmd>TableModeToggle<CR>'
        },
        ['i'] = {
            [',r'] = '<Cmd>MarkdownPreview<CR>',
            [',rs'] = '<Cmd>MarkdownPreviewStop<CR>',
        }

    }
    for k, v in pairs(mode_key_map) do
        for k_, v_ in pairs(v) do
            vim.api.nvim_set_keymap(k, k_, v_, default_opts)
        end
    end
end

local function set_markdown_default()
    set_markdown_default_opt()
    set_markdown_keymaps()
end

set_markdown_default()

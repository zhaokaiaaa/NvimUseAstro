local autocmd = vim.api.nvim_create_autocmd
-- 自动命令，自动命令组
if vim.fn.has "nvim-0.7" then
    -- 保存后自动加载配置文件
    local nvimrc = vim.api.nvim_create_augroup("NVIMRC", { clear = true })
    autocmd({ "BufWritePost" }, {
        pattern = "init.lua",
        group = nvimrc,
        command = [[source %]],
    })

    autocmd({ "BufReadPost" }, {
        pattern = "init.lua",
        group = nvimrc,
        callback = function()
            vim.o.path = vim.o.path .. ",**/*"
        end,
    })

    -- text like documents enable wrap and spell
    autocmd("FileType", {
        pattern = { "gitcommit", "markdown", "text", "plaintex", "md" },
        group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
        callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.spell = true
        end,
    })

    if vim.g.neovide then
        local neovide = require "user/plugin-config/neovide"
        neovide.init()
    end
else
    vim.cmd [[
        augroup NVIMRC
        autocmd!
        autocmd BufWritePost init.lua source $MYVIMRC
        autocmd BufReadPost init.lua set path+=**/*
        autocmd BufWritePost * normal! gg=G``
        augroup END
        ]]
end

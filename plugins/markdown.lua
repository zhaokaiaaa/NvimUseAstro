--[[
--=================================================================================
--=================markdown===========================
--=================================================================================
--]]
return {
    { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim", enable=true },
    { 'preservim/vim-markdown',
      init = function()
          vim.g.mkdp_filetypes = { "markdown", "md" }
      end,
      event = "BufEnter"
    },
    --为 Markdown 文件生成目录
    { 'mzlogin/vim-markdown-toc',
      init = function()
          vim.g.mkdp_filetypes = { "markdown", "md" }
      end,
      event = "BufEnter",
    },
    -- 自动表格创建器和格式化程序
    { 'dhruvasagar/vim-table-mode',
      init = function()
          vim.g.mkdp_filetypes = { "markdown", "md" }
      end,
      event = "BufEnter"
    },
    -- 照片
    { 'img-paste-devs/img-paste.vim',
      init = function()
          vim.g.mkdp_filetypes = { "markdown", "md" }
      end,
      event = "BufEnter"
    },
}

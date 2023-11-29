-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  -- 配置文件入口,主要负责加载其他配置文件
  require("user/autocmd")
end

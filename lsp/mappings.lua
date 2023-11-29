local lsp_mappings = require("astronvim.utils").empty_map_table()
lsp_mappings.v['gl'] = { '$', desc = "go to line end" }
lsp_mappings.n['gl'] = { '$', desc = "go to line end" }
return lsp_mappings

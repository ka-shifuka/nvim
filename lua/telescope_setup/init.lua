require('telescope').setup {
    defaults = {
        file_ignore_pattern = {
            "node_modules/*",
            "node_modules",
            "lua_modules/*",
            "lua_modules"
        }
    }
}

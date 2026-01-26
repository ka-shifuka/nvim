local function compileLuaFiles(dir)
    local cmd = string.format("find %s -name '*.lua' -exec luajit -b {} {} \\;", dir)
    os.execute(cmd)
end

local currentDir = "."
compileLuaFiles(currentDir)

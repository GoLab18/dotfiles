local function get_latest_lombok_jar()
    local home = os.getenv("HOME")
    local m2_lombok_dir = home .. "/.m2/repository/org/projectlombok/lombok"

    local handle = io.popen("ls -d " .. m2_lombok_dir .. "/* | sort -V | tail -1")
    local latest_dir = handle:read("*l")
    handle:close()

    if not latest_dir then return nil end

    local version = latest_dir:match("(%d+%.%d+%.%d+)$")
    if not version then return nil end

    return latest_dir .. "/lombok-" .. version .. ".jar"
end

local lombok_jar = get_latest_lombok_jar()
if not lombok_jar then vim.notify("Could not find lombok jar in ~/.m2", vim.log.levels.WARN) end

vim.lsp.config("jdtls", {
    cmd = {
        "jdtls",
        lombok_jar and ("--jvm-arg=-javaagent:" .. lombok_jar),
    },
})

vim.lsp.enable("jdtls")

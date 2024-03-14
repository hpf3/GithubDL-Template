local STARTUP_LABEL_BEGIN = "--[Example:start] Do Not Remove"
local STARTUP_LABEL_END = "--[Example:end] Do Not Remove"
local STARTUP_TEMPLATE = [[
--Example startup script
print("Hello Startup!")
]]

local function getStartup()
    local counter = 0
    local startPos = 0
    local endPos = 0
    local content = {}
    if not fs.exists("/startup") then
        return startPos, endPos, content
    end
    for line in io.lines("/startup") do
        counter = counter + 1
        if line == STARTUP_LABEL_BEGIN then
            startPos = counter
        elseif line == STARTUP_LABEL_END then
            endPos = counter
        end
        table.insert(content, line)
    end
    return startPos, endPos, content
end

local function install()
    print("[Installer] Installing example...")

    --get the current startup code
    local startPos, endPos, content = getStartup()

    --remove the old startup code
    if startPos ~= 0 and endPos ~= 0 then
        ---@diagnostic disable-next-line: unused-local
        for i = startPos, endPos do
            table.remove(content, startPos)
        end
    end

    --add the new startup code
    table.insert(content, STARTUP_LABEL_BEGIN)
    table.insert(content, STARTUP_TEMPLATE)
    table.insert(content, STARTUP_LABEL_END)

    --write the new startup code
    local file = fs.open("/startup", "w")
    for _, value in ipairs(content) do
        file.write(value .. "\n")
    end
    file.close()
end


local function remove()
    --keep in mind that the files listed in your manifest will be removed automatically
    print("[Installer] Removing example...")

    --get the current startup code
    local startPos, endPos, content = getStartup()
    if startPos == 0 or endPos == 0 then
        print("[Installer] Example not found in startup")
    else
        --remove the old startup code
        ---@diagnostic disable-next-line: unused-local
        for i = startPos, endPos do
            table.remove(content, startPos)
        end
    end
end


local args = { ... }
if #args < 1 then
    install()
    return
end
if args[1] == "install" then
    install()
elseif args[1] == "remove" then
    remove()
end

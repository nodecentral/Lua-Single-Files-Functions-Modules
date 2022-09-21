-- https://stackoverflow.com/questions/5327882/reboot-a-system-through-lua-script/5333873

local function is_rebooted()
    -- Presence of file indicates reboot status
    if io.open("Rebooted.txt", "r") then
        os.remove("Rebooted.txt")
        return true
    else
        return false
    end
end

local function reboot_system()
    local f = assert(io.open("Rebooted.txt", "w"))
    f:write("Restarted!  Call On_Reboot()")

    -- Do something to make sure the script is called upon reboot here

    -- First line of package.config is directory separator
    -- Assume that '\' means it's Windows
    local is_windows = string.find(_G.package.config:sub(1,1), "\\")

    if is_windows then
        os.execute("shutdown -r");
    else
        os.execute("reboot")
    end
end

local function before_reboot()
    print("Before Reboot System")
    reboot_system()
end

local function after_reboot()
    print("After Reboot System")
end

-- Execution begins here !
if not is_rebooted() then
    before_reboot()
else
    after_reboot()
end
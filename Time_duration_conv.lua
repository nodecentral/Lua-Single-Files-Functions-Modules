-- formatDuration(): format a timespan into a human readable string

local function formatDuration (diff)
    local days = math.floor(diff / 86400)
    local hours = math.floor((diff % 86400) / 3600)
    local minutes = math.floor((diff % 3600) / 60)
    local output = string.format("%d minute%s", minutes, minutes ~= 1 and "s" or "")
    if diff >= 86400 then
        output = string.format("%d day%s, %d hour%s and %d minute%s", days, days ~= 1 and "s" or "",hours, hours ~= 1 and "s" or "", minutes, minutes ~= 1 and "s" or "")
    elseif diff >= 3600 then
        output = string.format("%d hour%s and %d minute%s", hours, hours ~= 1 and "s" or "", minutes, minutes ~= 1 and "s" or "")
    end
    return output
end

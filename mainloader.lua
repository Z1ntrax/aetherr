-- Game Name → Script ID mapping
local scriptIDs = {
    ["Steal a Brainrot"] = "0c7761f0e65be3d9",
    ["99 Nights in the Forest"] = "a8400b989b3e7eec",
    ["Grow a Garden - Mutation ESP"] = "303f7db46e30257d",
    ["Grow a Garden - Value Calculator"] = "3f52dbfc94e8f44f",
}

-- Required user config:
-- settings = { name = "Z1ntrax", game = "Grow a Garden - Mutation ESP" }

if not settings or not settings.game then
    warn("⚠️ Please set the 'settings.game' value!")
    return
end

local scriptId = scriptIDs[settings.game]
if not scriptId then
    warn("Game not recognized: " .. tostring(settings.game))
    return
end

-- Load the matching script
local url = "https://pandadevelopment.net/virtual/file/" .. scriptId
local success, result = pcall(function()
    return setfenv(loadstring(game:HttpGet(url)), getfenv())()
end)

if success then
    print("Loaded script for " .. settings.game)
else
    warn("Failed to load script:", result)
end

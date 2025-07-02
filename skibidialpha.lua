-- AetherHub - The Hatch Event Script
-- Optimized and cleaned version

if game:GetService("CoreGui"):FindFirstChild("AetherHub") then
    game:GetService("CoreGui").AetherHub:Destroy()
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew"))()
local Window = Library:CreateWindow("AetherHub - The Hatch Event")

-- Egg Teleport Functionality
local function ScanEggs()
    local eggs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(obj.Name:lower(), "egg") then
            table.insert(eggs, obj.Name)
        end
    end
    return eggs
end

Window:AddList({
    text = "Egg Locations",
    flag = "egg_list",
    values = ScanEggs(),
    callback = function(selected)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name == selected then
                    if obj:IsA("Model") then
                        char.HumanoidRootPart.CFrame = obj:GetPivot()
                    else
                        char.HumanoidRootPart.CFrame = CFrame.new(obj.Position + Vector3.new(0, 5, 0))
                    end
                    break
                end
            end
        end
    end
})

Window:AddLabel({
    text = "AetherHub v1.0"
})

Window:Init()

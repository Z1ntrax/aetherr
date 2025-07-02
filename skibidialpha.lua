-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "AetherHub - The Hatch Event",
    LoadingTitle = "AetherHub v1.0",
    LoadingSubtitle = "Teleporting to Eggs...",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Function to scan egg locations
local function ScanEggs()
    local eggs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(obj.Name:lower(), "egg") then
            table.insert(eggs, obj.Name)
        end
    end
    return eggs
end

-- Create Egg Tab
local MainTab = Window:CreateTab("Egg Teleport", 4483362458)

-- Dropdown for egg list
local EggDropdown = MainTab:CreateDropdown({
    Name = "Egg Locations",
    Options = ScanEggs(),
    CurrentOption = nil,
    Callback = function(selected)
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
    end,
})

-- Info Label
MainTab:CreateParagraph({
    Title = "AetherHub v1.0",
    Content = "Use the dropdown to teleport to detected eggs."
})

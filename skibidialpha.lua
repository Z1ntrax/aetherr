-- Simple Auto-Teleport to Eggs Script

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Function to find egg objects
local function getEggs()
    local eggs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and string.find(obj.Name:lower(), "egg") then
            table.insert(eggs, obj)
        end
    end
    return eggs
end

-- Teleport loop
while true do
    local eggs = getEggs()
    for _, egg in ipairs(eggs) do
        if char and char:FindFirstChild("HumanoidRootPart") then
            if egg:IsA("Model") then
                char.HumanoidRootPart.CFrame = egg:GetPivot()
            elseif egg:IsA("BasePart") then
                char.HumanoidRootPart.CFrame = CFrame.new(egg.Position + Vector3.new(0, 5, 0))
            end
            wait(5) -- Wait 5 seconds before next egg
        end
    end
    wait(1) -- Short pause before scanning eggs again
end

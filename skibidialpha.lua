-- AetherHub - The Hatch Event Utility
-- Optimized for modern executors

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Cleanup previous GUI
if CoreGui:FindFirstChild("AetherHub") then
    CoreGui.AetherHub:Destroy()
end

-- Create simple UI (compatible with all executors)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AetherHub"
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 300)
Frame.Position = UDim2.new(0.5, -125, 0.5, -150)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "AetherHub - Egg Teleporter"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
Title.TextColor3 = Color3.white
Title.Parent = Frame

local EggList = Instance.new("ScrollingFrame")
EggList.Size = UDim2.new(1, -10, 0, 200)
EggList.Position = UDim2.new(0, 5, 0, 35)
EggList.BackgroundTransparency = 1
EggList.Parent = Frame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = EggList

local function ScanEggs()
    local eggs = {}
    for _, obj in pairs(workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) and obj.Name:lower():find("egg") then
            table.insert(eggs, obj.Name)
        end
    end
    return eggs
end

local function CreateButton(text, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(1, -10, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
    button.TextColor3 = Color3.white
    button.Parent = EggList
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Populate egg list
for _, eggName in pairs(ScanEggs()) do
    CreateButton(eggName, function()
        local char = LocalPlayer.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj.Name == eggName then
                        if obj:IsA("Model") then
                            root.CFrame = obj:GetPivot()
                        else
                            root.CFrame = CFrame.new(obj.Position + Vector3.new(0, 5, 0))
                        end
                        break
                    end
                end
            end
        end
    end)
end

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "Close"
CloseButton.Size = UDim2.new(1, -10, 0, 30)
CloseButton.Position = UDim2.new(0, 5, 1, -35)
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
CloseButton.TextColor3 = Color3.white
CloseButton.Parent = Frame

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

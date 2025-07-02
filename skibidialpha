-- Steal Script for Roblox
-- Protected with MoonSec V3 (removed during reconstruction)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "StealGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.Text = "Steal | niggatrin"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = mainFrame

local stealButton = Instance.new("TextButton")
stealButton.Size = UDim2.new(0.8, 0, 0.3, 0)
stealButton.Position = UDim2.new(0.1, 0, 0.35, 0)
stealButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
stealButton.Text = "Steal"
stealButton.TextColor3 = Color3.new(1, 1, 1)
stealButton.Font = Enum.Font.SourceSansBold
stealButton.TextScaled = true
stealButton.Parent = mainFrame

local floatButton = Instance.new("TextButton")
floatButton.Size = UDim2.new(0.8, 0, 0.3, 0)
floatButton.Position = UDim2.new(0.1, 0, 0.7, 0)
floatButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
floatButton.Text = "Float"
floatButton.TextColor3 = Color3.new(1, 1, 1)
floatButton.Font = Enum.Font.SourceSansBold
floatButton.TextScaled = true
floatButton.Parent = mainFrame

-- Steal function
local function steal()
    for _, plot in pairs(workspace.Plots:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            local surfaceGui = sign:FindFirstChild("SurfaceGui")
            if surfaceGui then
                local frame = surfaceGui:FindFirstChild("Frame")
                if frame then
                    local textLabel = frame:FindFirstChild("TextLabel")
                    if textLabel then
                        local ownerName = string.lower(textLabel.Text:match("Owner: (.+)"))
                        if ownerName == string.lower(player.Name) then
                            for _, item in pairs(plot:GetDescendants()) do
                                if item:IsA("BasePart") then
                                    item.Transparency = 1
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Float function
local floatEnabled = false
local bodyVelocity

local function toggleFloat()
    floatEnabled = not floatEnabled
    
    if floatEnabled then
        -- Create floating effect
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.Parent = rootPart
        
        local connection = RunService.Heartbeat:Connect(function()
            if floatEnabled and rootPart then
                bodyVelocity.Velocity = Vector3.new(0, 5, 0)
            end
        end)
    else
        -- Stop floating
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
    end
end

-- Button connections
stealButton.MouseButton1Click:Connect(steal)
floatButton.MouseButton1Click:Connect(toggleFloat)

-- Character handling
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    rootPart = newChar:WaitForChild("HumanoidRootPart")
    
    if floatEnabled then
        toggleFloat() -- Reset float when character respawns
        task.wait(1)
        toggleFloat() -- Re-enable float
    end
end)

-- Input handling for floating
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.E then
            toggleFloat()
        end
    end
end)

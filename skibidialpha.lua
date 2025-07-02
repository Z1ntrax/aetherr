--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- //
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- //
local ScreenGui = Instance.new("ScreenGui", playerGui)
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "CheatSheet"

-- //
local Frame = Instance.new("Frame", ScreenGui)
Frame.Name = "BackgroundFrame"
Frame.Size = UDim2.new(0, 250, 0, 250)
Frame.BackgroundTransparency = 0.5
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)

-- //
local UIDragDetector = Instance.new("UIDragDetector", Frame)

-- //
local ImageButton = Instance.new("ImageButton", ScreenGui)
ImageButton.ImageTransparency = 1
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Position = UDim2.new(0.25, 0, 0.4, 0)
ImageButton.BackgroundTransparency = 0.5
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- //
local Debounce = false

ImageButton.MouseButton1Click:Connect(function()
	if not Debounce then
		Debounce = true
		Frame.Visible = false
	else
		Debounce = false
		Frame.Visible = true
	end
end)

-- //
local TextLabel = Instance.new("TextLabel", Frame)
TextLabel.Name = "DragLabel"
TextLabel.Text = "The Hatch"
TextLabel.TextScaled = true
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(1, 0, 0, 50)
TextLabel.BackgroundTransparency = 1

-- //
local ScrollingFrame = Instance.new("ScrollingFrame", Frame)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.ScrollBarImageTransparency = 0.5
ScrollingFrame.Size = UDim2.new(1, 0, 0, 200)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)

local TextLabel2 = Instance.new("TextLabel", ScrollingFrame)
TextLabel2.Name = "LootLabel"
TextLabel2.Text = "EGG"
TextLabel2.TextScaled = true
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.Size = UDim2.new(1, 0, 0, 25)
TextLabel2.BackgroundTransparency = 1

-- Creating ImageButton2 inside TextLabel2
local ImageButton2 = Instance.new("ImageButton", TextLabel2)
ImageButton2.ImageTransparency = 1
ImageButton2.Size = UDim2.new(0, 25, 0, 25)
ImageButton2.Position = UDim2.new(0.75, 0, 0, 0)
ImageButton2.BackgroundTransparency = 0.5
ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- //
local Debounce2 = false

-- //
ImageButton2.MouseButton1Click:Connect(function()
	if not Debounce2 then
for _, egg in ipairs(workspace:GetDescendants()) do
if egg:IsA("MeshPart") and string.match(egg.Name, "Egg") then
player.Character:PivotTo(egg.CFrame)
end
end
	task.wait(1)
		Debounce2 = false
		ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	end
end)

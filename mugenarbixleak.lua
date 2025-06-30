<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ARBIX HUB | Script Leak</title>
</head>
<body>
<pre>
local GuiScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/U-ARE-MY-SUNSHINE/refs/heads/main/Gui.lua"))()

local Window = GuiScript.MakeWindow({
    Title = "ARBIX HUB | MUGEN",
    Animation = "by : TOUKA",
    KeySystem = false,
    Title = "",
    Description = "",
    KeyLink = "",
    Keys = {"1234"},
    Notifications = true,
    CorrectKey = "Running the Script...",
    Incorrectkey = "The key is incorrect",
    CopyKeyLink = "Copied to Clipboard",
    MinimizeButton = true,
    Size = UDim2.new(0, 500, 0, 400),
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = true,
    StrokeColor = Color3.fromRGB(0, 0, 0)
})

Window.MakeNotifi({
    Title = "ARBIX HUB | MUGEN",
    Text = "JOIN OUR DISCORD",
    Time = 5
})

local MainTab = Window.MakeTab({
    Name = "STYLE"
})

local RollbackSection = MainTab.AddSection({
    Name = "RollBack"
})

RollbackSection.AddToggle({
    Name = "RollBack",
    Default = false,
    Callback = function(state)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Knit = require(ReplicatedStorage.Packages.Knit)
        local CharacterSetupService = Knit.GetService("CharacterSetupService")
        
        CharacterSetupService.RE.UpdateSettings:FireServer("CameraShake", state)
        CharacterSetupService.RE.UpdateSettings:FireServer("AutoRun", state)
        CharacterSetupService.RE.UpdateSettings:FireServer("PerformanceMode", state)
    end
})

local RejoinSection = MainTab.AddSection({
    Name = "REJOIN BUTTON"
})

RejoinSection.AddButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
    end
})

local FooterSection = MainTab.AddSection({
    Name = "script made by touka (arbix hub owner)"
})
</pre>
</body>
</html>

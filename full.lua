-- idk how to hide my code so wtv
local DiscordLib = loadstring(
                       game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

local Window = DiscordLib:Window("Discord")

--[[
    GENERAL STUFF
]]

local Main = Window:Server("Main", "http://www.roblox.com/asset/?id=6031075938")
local MainGeneral = Main:Channel("general")
local MainUtilities = Main:Channel("util")

MainUtilities:Toggle("Anti AFK", false, function(bool)
    if bool == true then
        local VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0),
                                    workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0),
                                  workspace.CurrentCamera.CFrame)
        end)
    end
end)

MainUtilities:Textbox("Teleport to Player", "Username", true, function(t)
    players = game:GetService("Players")
    targetPlayer = players:FindFirstChild(t)
    players.LocalPlayer.Character:MoveTo(
        targetPlayer.Character.HumanoidRootPart.Position)
end)

MainUtilities:Button('Btools', function()
    backpack = game:GetService("Players").LocalPlayer.Backpack

    hammer = Instance.new("HopperBin")
    hammer.Name = "Hammer"
    hammer.BinType = 4
    hammer.Parent = backpack

    cloneTool = Instance.new("HopperBin")
    cloneTool.Name = "Clone"
    cloneTool.BinType = 3
    cloneTool.Parent = backpack

    grabTool = Instance.new("HopperBin")
    grabTool.Name = "Grab"
    grabTool.BinType = 2
    grabTool.Parent = backpack
end)

MainUtilities:Button('Fling', function()
    DiscordLib:Notification("Alert", "Script copied to clipboard", "Dismiss")
    setclipboard(
        "_G.KeyCode = \"X\" \nloadstring(game:HttpGet(\"https://shattered-gang.lol/scripts/fe/touch_fling.lua\"))()")
end)

MainGeneral:Toggle("Invisible", false, function(bool)
    if bool == true then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 1 -- make it invisible
            end
        end

        char.Humanoid.DisplayDistanceType =
            Enum.HumanoidDisplayDistanceType.None
    elseif bool == false then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 0 -- make it invisible
            end
        end

        char.HumanoidRootPart.Transparency = 1
    end
end)

MainGeneral:Toggle("Fly", false, function(bool)
    if bool == true then
        local Player = game.Players.LocalPlayer
        local Char = Player.Character
        while not Char do
            wait()
            Char = Player.Character
        end
        local Humanoid = Char:WaitForChild("Humanoid")
        local Root = Char:FindFirstChild("HumanoidRootPart")
        while not Root do
            wait()
            Root = Char:FindFirstChild("HumanoidRootPart")
        end
        local Mouse = Player:GetMouse()
        local Cam = game.Workspace.CurrentCamera

        local dir = {w = 0, s = 0, a = 0, d = 0}
        local spd = 2
        Mouse.KeyDown:connect(function(key)
            if key:lower() == "w" then
                dir.w = 1
            elseif key:lower() == "s" then
                dir.s = 1
            elseif key:lower() == "a" then
                dir.a = 1
            elseif key:lower() == "d" then
                dir.d = 1
            elseif key:lower() == "q" then
                spd = spd + 1
            elseif key:lower() == "e" then
                spd = spd - 1
            end
        end)
        Mouse.KeyUp:connect(function(key)
            if key:lower() == "w" then
                dir.w = 0
            elseif key:lower() == "s" then
                dir.s = 0
            elseif key:lower() == "a" then
                dir.a = 0
            elseif key:lower() == "d" then
                dir.d = 0
            end
        end)
        Root.Anchored = true
        Humanoid.PlatformStand = true
        Humanoid.Changed:connect(function() Humanoid.PlatformStand = true end)
        repeat
            wait(1 / 44)
            Root.CFrame = CFrame.new(Root.Position, Cam.CoordinateFrame.p) *
                              CFrame.Angles(0, math.rad(180), 0) *
                              CFrame.new((dir.d - dir.a) * spd, 0,
                                         (dir.s - dir.w) * spd)
        until nil
    elseif bool == false then
        player = game:GetService("Players").LocalPlayer
        playercurrentpositiongeneral = player.Character.HumanoidRootPart
                                           .Position

        player.Character.Humanoid.Health = 0
        wait(game:GetService("Players").RespawnTime + 2)
        player.Character:MoveTo(playercurrentpositiongeneral)
    end
end)

MainGeneral:Seperator()

MainGeneral:Slider("Walkspeed", 0, 500, 15, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.Humanoid.WalkSpeed = t
end)

MainGeneral:Slider("Jump Power", 0, 1000, 50, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.JumpPower = t
end)

--[[
    TAPPING SIMULATOR
]]

local TappingSim = Window:Server("Tapping Simulator", "")

-- General
local TappingSimGeneral = TappingSim:Channel("general")

TappingSimGeneral:Toggle("Anti AFK", false, function(bool)
    if bool == true then
        VirtualUser = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            VirtualUser:Button2Down(Vector2.new(0, 0),
                                    workspace.CurrentCamera.CFrame)
            wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0),
                                  workspace.CurrentCamera.CFrame)
        end)
    end
end)

TappingSimGeneral:Slider("Walkspeed", 0, 500, 15, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.Humanoid.WalkSpeed = t
end)

TappingSimGeneral:Slider("Jump Power", 0, 1000, 50, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.JumpPower = t
end)

-- Auto Farms
local AutoFarms = TappingSim:Channel("auto-farms")

AutoFarms:Toggle("Auto Tap", false, function(bool)
    if bool == true then
        while true do
            wait(0.0001)
            local Event = game:GetService("ReplicatedStorage").Events.Tap
            Event:FireServer()
        end
    end
end)

AutoFarms:Toggle("Auto Rebirth", false, function(bool)
    if bool == true then
        while true do
            local A_1 = 1
            wait(10)
            local Event = game:GetService("ReplicatedStorage").Events.Rebirth
            Event:FireServer(A_1)
        end
    end
end)

--[[
    LIFE IN PARADISE
]]

local LifeInParadiseServer = Window:Server("Life in Paradise",
                                           "http://www.roblox.com/asset/?id=6031075938")

local LIPGeneral = LifeInParadiseServer:Channel("general")
local LIPTeleports = LifeInParadiseServer:Channel("teleports")
local LIPUtilities = LifeInParadiseServer:Channel("util")
local LIPTeams = LifeInParadiseServer:Channel("teams")

LIPTeleports:Button("Campsite", function()
    pos = "-305.706, 40.2968, -62.0767"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

LIPTeleports:Button("School", function()
    pos = "-277.612, 38.7978, 241.121"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

LIPTeleports:Button("Cinema", function()
    pos = "-427.331, 44.6627, 373.63"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

LIPTeleports:Button("Mountain", function()
    pos = "679.87, 325.165, -7.71623"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

LIPTeleports:Button("Cars", function()
    pos = "-696.51, 38.9656, 313.779"
    game:GetService("Players").LocalPlayer.Character:MoveTo(pos)
end)

LIPTeams:Button("Switch to Kids Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Kids"].TeamColor
    player:LoadCharacter()
end)

LIPTeams:Button("Switch to Parents Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Parents"].TeamColor
    player:LoadCharacter()
end)

LIPTeams:Button("Switch to Teens Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Teens"].TeamColor
    player:LoadCharacter()
end)

LIPTeams:Button("Switch to Pets Team", function()
    player = game:GetService("Players").LocalPlayer
    player.TeamColor = game:GetService("Teams")["Pets"].TeamColor
    player:LoadCharacter()
end)

LIPUtilities:Textbox("Teleport to Player", "Username", true, function(t)
    players = game:GetService("Players")
    targetPlayer = players:FindFirstChild(t)
    players.LocalPlayer.Character:MoveTo(
        targetPlayer.Character.HumanoidRootPart.Position)
end)

LIPUtilities:Button('Btools', function()
    backpack = game:GetService("Players").LocalPlayer.Backpack

    hammer = Instance.new("HopperBin")
    hammer.Name = "Hammer"
    hammer.BinType = 4
    hammer.Parent = backpack

    cloneTool = Instance.new("HopperBin")
    cloneTool.Name = "Clone"
    cloneTool.BinType = 3
    cloneTool.Parent = backpack

    grabTool = Instance.new("HopperBin")
    grabTool.Name = "Grab"
    grabTool.BinType = 2
    grabTool.Parent = backpack
end)

LIPUtilities:Button('Fling', function()
    DiscordLib:Notification("Alert", "Script copied to clipboard", "Dismiss")
    setclipboard(
        "_G.KeyCode = \"X\" \nloadstring(game:HttpGet(\"https://shattered-gang.lol/scripts/fe/touch_fling.lua\"))()")
end)

LIPGeneral:Toggle("Invisible", false, function(bool)
    if bool == true then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 1 -- make it invisible
            end
        end

        char.Humanoid.DisplayDistanceType =
            Enum.HumanoidDisplayDistanceType.None
    elseif bool == false then
        char = game:GetService("Players").LocalPlayer.Character

        for i, v in pairs(char:GetDescendants()) do -- loop through everything in the character
            if v:IsA("BasePart") or v:IsA("Decal") then -- if it is a part
                v.Transparency = 0 -- make it invisible
            end
        end

        char.HumanoidRootPart.Transparency = 1
    end
end)

LIPGeneral:Toggle("Fly", false, function(bool)
    if bool == true then
        local Player = game.Players.LocalPlayer
        local Char = Player.Character
        while not Char do
            wait()
            Char = Player.Character
        end
        local Humanoid = Char:WaitForChild("Humanoid")
        local Root = Char:FindFirstChild("HumanoidRootPart")
        while not Root do
            wait()
            Root = Char:FindFirstChild("HumanoidRootPart")
        end
        local Mouse = Player:GetMouse()
        local Cam = game.Workspace.CurrentCamera

        local dir = {w = 0, s = 0, a = 0, d = 0}
        local spd = 2
        Mouse.KeyDown:connect(function(key)
            if key:lower() == "w" then
                dir.w = 1
            elseif key:lower() == "s" then
                dir.s = 1
            elseif key:lower() == "a" then
                dir.a = 1
            elseif key:lower() == "d" then
                dir.d = 1
            elseif key:lower() == "q" then
                spd = spd + 1
            elseif key:lower() == "e" then
                spd = spd - 1
            end
        end)
        Mouse.KeyUp:connect(function(key)
            if key:lower() == "w" then
                dir.w = 0
            elseif key:lower() == "s" then
                dir.s = 0
            elseif key:lower() == "a" then
                dir.a = 0
            elseif key:lower() == "d" then
                dir.d = 0
            end
        end)
        Root.Anchored = true
        Humanoid.PlatformStand = true
        Humanoid.Changed:connect(function() Humanoid.PlatformStand = true end)
        repeat
            wait(1 / 44)
            Root.CFrame = CFrame.new(Root.Position, Cam.CoordinateFrame.p) *
                              CFrame.Angles(0, math.rad(180), 0) *
                              CFrame.new((dir.d - dir.a) * spd, 0,
                                         (dir.s - dir.w) * spd)
        until nil
    elseif bool == false then
        player = game:GetService("Players").LocalPlayer
        playercurrentpositiongeneral = player.Character.HumanoidRootPart
                                           .Position

        player.Character.Humanoid.Health = 0
        wait(game:GetService("Players").RespawnTime + 2)
        player.Character:MoveTo(playercurrentpositiongeneral)
    end
end)

LIPGeneral:Seperator()

LIPGeneral:Slider("Walkspeed", 0, 500, 15, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.Humanoid.WalkSpeed = t
end)

LIPGeneral:Slider("Jump Power", 0, 1000, 50, function(t)
    player = game:GetService("Players").LocalPlayer
    player.Character.JumpPower = t
end)

--[[
    btns:Seperator()

btns:Button("Get max level", function()
    DiscordLib:Notification("Notification", "Max level!", "Okay!")
end)

local tgls = serv:Channel("Toggles")

tgls:Toggle("Auto-Farm", false, function(bool) print(bool) end)

local sldrs = serv:Channel("Sliders")



sldrs:Button("Change to 50", function() sldr:Change(50) end)

local drops = serv:Channel("Dropdowns")

local drop = drops:Dropdown("Pick me!", {
    "Option 1", "Option 2", "Option 3", "Option 4", "Option 5"
}, function(bool) print(bool) end)

drops:Button("Clear", function() drop:Clear() end)

drops:Button("Add option", function() drop:Add("Option") end)

local clrs = serv:Channel("Colorpickers")

clrs:Colorpicker("ESP Color", Color3.fromRGB(255, 1, 1),
                 function(t) print(t) end)

local textbs = serv:Channel("Textboxes")

textbs:Textbox("Gun power", "Type here!", true, function(t) print(t) end)

local lbls = serv:Channel("Labels")

lbls:Label("This is just a label.")

local bnds = serv:Channel("Binds")

bnds:Bind("Kill bind", Enum.KeyCode.RightShift,
          function() print("Killed everyone!") end)

serv:Channel("by dawid#7205")

]]

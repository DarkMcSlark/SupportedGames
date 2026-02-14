-- // Operation One Version 1.3.2
local TimeRightNow = os.clock()
if getgenv().ExecutedAlreadyCheckV1_3_2 == nil then
    getgenv().ExecutedAlreadyCheckV1_3_2 = 0
end
repeat wait() until game:IsLoaded()
-- // Game Services
local Players = cloneref(game:GetService("Players"))
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- // Unauthorized Execution Check
if not getfenv().Executed_From_Loader then
    Players.LocalPlayer:Kick("Darkizz Softworks | Use the Loader to execute this script.")
return end

if (game.PlaceId ~= 72920620366355) then
    Players.LocalPlayer:Kick("Darkizz Softworks | Use the Loader to execute this script.")
end

-- // Declared Variables
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character and Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character and Character:WaitForChild("HumanoidRootPart")
local CurrentCamera = workspace.CurrentCamera
local ViewportSize = CurrentCamera.ViewportSize
local Camera = workspace.Camera
local Mouse = LocalPlayer:GetMouse()

local NeverloseSound = Instance.new("Sound")
NeverloseSound.Parent = Camera
NeverloseSound.SoundId = "rbxassetid://97643101798871"
NeverloseSound.Volume = 5

local TracerPositions = {
    Vector2.new(ViewportSize.X / 2, ViewportSize.Y);
    Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2);
    Vector2.new(ViewportSize.X / 2, 0);
}

-- // Settings
local Settings = {
    ["Original_Head_Size"] = Vector3.new(1, 1, 1);
    ["Original_FOV"] = 70;
}

-- // Changeable Variables
local Firerate_Speed
local Recoil_Value
local V1Warn = 0
local V2Warn = 0

local KillCamAutoAdjust = false
local AimHold = false

local Head_Size_Multiplier = 1
local Head_Transparency = 0
local HighlightHeadEnabled = false
local HighlightColorHead = Color3.fromRGB(255,0,255)
local HeadSizeAutoKill = false

local WalkSpeedMultiply = false
local WalkSpeedPercentage = 25

local ModifyFOVEnabled = false
local ModifiedFieldOfView = 70

local Box_Thickness = 2
local Health_Text_Size = 12
local Tracer_Position = 2
local Name_Text_Size = 12

local ModCheck = false

local TeammateCheck = false
local ESP_Other = false
local ESP_Corner_Box = false
local Corner_Color = Color3.fromRGB(255,150,0)
local ESP_Box_Filled = false
local Fill_Color = Color3.fromRGB(255,255,255)
local ESP_Health_Bar = false
local ESP_Health_Text = false
local ESP_Name = false
local ESP_Tracer = false
local ESP_Drone = false
local ESP_Distance = false

-- // Data Tables
local ESP_Corner_Boxes1 = {}
local ESP_Corner_Boxes2 = {}
local ESP_Corner_Boxes3 = {}
local ESP_Corner_Boxes4 = {}
local ESP_Corner_Boxes5 = {}
local ESP_Corner_Boxes6 = {}
local ESP_Corner_Boxes7 = {}
local ESP_Corner_Boxes8 = {}
local ESP_Health_Bars = {}
local ESP_Health_Bars2 = {}
local ESP_Health_Texts = {}
local ESP_Tracers = {}
local ESP_Tracers_O = {}
local ESP_Names = {}
local ESP_Drones = {}
local ESP_Drones_O = {}
local ESP_Drones_T = {}
local ESP_Others = {}
local ESP_Others_O = {}
local ESP_Others_T = {}
local ESP_Boxes_O = {}
local ESP_Distances = {}

local Saved_Detections = {}

-- // UIS Check
UIS.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.UserInputType.MouseButton2 then
        AimHold = true
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.KeyCode == Enum.UserInputType.MouseButton2 then
        task.wait(.25)
        AimHold = false
    end
end)

-- // Notification Function
local NotificationScreenGui = Instance.new("ScreenGui")
NotificationScreenGui.Parent = gethui()
NotificationScreenGui.IgnoreGuiInset = true

local function CreateNotification(MessageType, Message, Duration)
    local TimeNowCheck = os.clock()
    if type(MessageType) ~= "string"
    or type(Message) ~= "string" 
    or type(Duration) ~= "number" then return end
    local TweenInfo1 = TweenInfo.new(.45, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out)
    local FinalTween = {Position = UDim2.new(.775, 0, .1, 0)}
    local FinalTween2 = {Position = UDim2.new(1.05, 0, .1, 0)}

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = NotificationScreenGui
    NotificationFrame.Size = UDim2.new(.21, 0, .075, 0)
    NotificationFrame.Position = UDim2.new(.775, 0, -.2, 0)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)

    local NotificationFrameCorner = Instance.new("UICorner")
    NotificationFrameCorner.Parent = NotificationFrame
    NotificationFrameCorner.CornerRadius = UDim.new(.06, 0)

    local NotificationFrameStroke = Instance.new("UIStroke")
    NotificationFrameStroke.Parent = NotificationFrame
    NotificationFrameStroke.Thickness = 2.5

    local TimeBar = Instance.new("Frame")
    TimeBar.Parent = NotificationFrame
    TimeBar.Size = UDim2.new(.95 - (os.clock() - TimeNowCheck) / Duration, 0, .125, 0)
    TimeBar.Position = UDim2.new(0.025, 0, .8, 0)
    TimeBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

    local TimeBarCorner = Instance.new("UICorner")
    TimeBarCorner.Parent = TimeBar
    TimeBarCorner.CornerRadius = UDim.new(0.3, 0)

    local TimeBarStroke = Instance.new("UIStroke")
    TimeBarStroke.Parent = TimeBar
    TimeBarStroke.Thickness = 1.5

    local NotificationText1 = Instance.new("TextLabel")
    NotificationText1.Parent = NotificationFrame
    NotificationText1.TextScaled = true
    NotificationText1.Size = UDim2.new(.9, 0, .25, 0)
    NotificationText1.Position = UDim2.new(.05, 0, .05, 0)
    NotificationText1.BackgroundTransparency = 1
    NotificationText1.Font = Enum.Font.SourceSansBold
    NotificationText1.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationText1.RichText = true
    NotificationText1.Text = "<font color='#00B9F7'>Darkizz Softworks</font> | " .. MessageType

    local NotificationText2 = Instance.new("TextLabel")
    NotificationText2.Parent = NotificationFrame
    NotificationText2.TextScaled = true
    NotificationText2.Size = UDim2.new(.95, 0, .3, 0)
    NotificationText2.Position = UDim2.new(.025, 0, .375, 0)
    NotificationText2.BackgroundTransparency = 1
    NotificationText2.Font = Enum.Font.GothamBold
    NotificationText2.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationText2.Text = Message

    local Tween = TweenService:Create(NotificationFrame, TweenInfo1, FinalTween)
    Tween:Play()
    Tween.Completed:Wait()
    repeat
        TimeBar.Size = UDim2.new(.95 - (os.clock() - TimeNowCheck) / Duration, 0, .125, 0)
        task.wait()
    until os.clock() - TimeNowCheck >= (Duration - Duration/21)
    task.wait(.05)
    local Tween2 = TweenService:Create(NotificationFrame, TweenInfo1, FinalTween2)
    Tween2:Play()
    task.wait(.4)
    NotificationFrame:Remove()
end

if getgenv().ExecutedAlreadyCheckV1_3_2 >= 1 then
    task.spawn(CreateNotification, "Important Information", "You already executed the script, please wait!", 6)
return end

-- // Anticheat Bypass
local function BypassClientAnticheat()
run_on_actor(getactors()[1], [[
    local DebugInfo = debug.info
    local TableFind = table.find
    local Registry = getreg()
    local BadPaths = {
        "ReplicatedStorage.Modules.Items.Item.Gun.Automatic.MP7.Animations.Reload",
        "ReplicatedStorage.Modules.Items.Item.Utility.Crowbar.Animations.TakeDown",
        "ReplicatedStorage.Modules.Items.Item.Gun.Semi.Shotgun.SPAS12.Animations.Reload",
        "ReplicatedStorage.Modules.Items.Item.Gun.Semi.Shotgun.SPAS12.Animations.Equip",
        "ReplicatedStorage.Modules.Items.Item.Gun.Semi.Shotgun.AA12.Animations.Equip",
        "ReplicatedStorage.Modules.Items.Item.Gun.Semi.DMR.M24.Animations.Reload",
        "ReplicatedStorage.Modules.Items.Item.Gun.Automatic.P90.Animations.Reload",
        "ReplicatedStorage.Modules.Items.Item.Utility.ReinforceItem.Animations.Place",
    }
    for _, Thread in Registry do
        if typeof(Thread) ~= "thread" then continue end
        local Source = DebugInfo(Thread, 1, "s")
        if Source and TableFind(BadPaths, Source) then
            coroutine.close(Thread)
        end
    end
]])
end
for i = 1,3 do
    BypassClientAnticheat()
    task.wait(.25)
end

-- // Remove Player Function
local function RemovePlayer(name)
    if ESP_Corner_Boxes1[name] then 
        ESP_Corner_Boxes1[name].Visible = false
        ESP_Corner_Boxes1[name]:Remove()
        ESP_Corner_Boxes1[name] = nil
    end
    if ESP_Corner_Boxes2[name] then 
        ESP_Corner_Boxes2[name].Visible = false
        ESP_Corner_Boxes2[name]:Remove()
        ESP_Corner_Boxes2[name] = nil
    end
    if ESP_Corner_Boxes3[name] then 
        ESP_Corner_Boxes3[name].Visible = false
        ESP_Corner_Boxes3[name]:Remove()
        ESP_Corner_Boxes3[name] = nil
    end
    if ESP_Corner_Boxes4[name] then 
        ESP_Corner_Boxes4[name].Visible = false
        ESP_Corner_Boxes4[name]:Remove()
        ESP_Corner_Boxes4[name] = nil
    end
    if ESP_Corner_Boxes5[name] then 
        ESP_Corner_Boxes5[name].Visible = false
        ESP_Corner_Boxes5[name]:Remove()
        ESP_Corner_Boxes5[name] = nil
    end
    if ESP_Corner_Boxes6[name] then 
        ESP_Corner_Boxes6[name].Visible = false
        ESP_Corner_Boxes6[name]:Remove()
        ESP_Corner_Boxes6[name] = nil
    end
    if ESP_Corner_Boxes7[name] then 
        ESP_Corner_Boxes7[name].Visible = false
        ESP_Corner_Boxes7[name]:Remove()
        ESP_Corner_Boxes7[name] = nil
    end
    if ESP_Corner_Boxes8[name] then 
        ESP_Corner_Boxes8[name].Visible = false
        ESP_Corner_Boxes8[name]:Remove()
        ESP_Corner_Boxes8[name] = nil
    end
    if ESP_Boxes_O[name] then
        ESP_Boxes_O[name].Visible = false
        ESP_Boxes_O[name]:Remove()
        ESP_Boxes_O[name] = nil
    end
    if ESP_Health_Bars[name] then 
        ESP_Health_Bars[name].Visible = false
        ESP_Health_Bars[name]:Remove()
        ESP_Health_Bars[name] = nil
    end
    if ESP_Health_Bars2[name] then 
        ESP_Health_Bars2[name].Visible = false
        ESP_Health_Bars2[name]:Remove()
        ESP_Health_Bars2[name] = nil
    end
    if ESP_Health_Texts[name] then 
        ESP_Health_Texts[name].Visible = false
        ESP_Health_Texts[name]:Remove()
        ESP_Health_Texts[name] = nil
    end
    if ESP_Tracers[name] then 
        ESP_Tracers[name].Visible = false
        ESP_Tracers[name]:Remove()
        ESP_Tracers[name] = nil
    end
    if ESP_Tracers_O[name] then 
        ESP_Tracers_O[name].Visible = false
        ESP_Tracers_O[name]:Remove()
        ESP_Tracers_O[name] = nil
    end
    if ESP_Names[name] then 
        ESP_Names[name].Visible = false
        ESP_Names[name]:Remove()
        ESP_Names[name] = nil
    end
    if ESP_Distances[name] then 
        ESP_Distances[name].Visible = false
        ESP_Distances[name]:Remove()
        ESP_Distances[name] = nil
    end
end

-- //  Remove Player Drone Function
local function RemovePlayerDrone(Drone)
    if ESP_Drones[Drone] then 
        ESP_Drones[Drone].Visible = false
        ESP_Drones[Drone]:Remove()
        ESP_Drones[Drone] = nil
    end
    if ESP_Drones_O[Drone] then 
        ESP_Drones_O[Drone].Visible = false
        ESP_Drones_O[Drone]:Remove()
        ESP_Drones_O[Drone] = nil
    end
    if ESP_Drones_T[Drone] then 
        ESP_Drones_T[Drone].Visible = false
        ESP_Drones_T[Drone]:Remove()
        ESP_Drones_T[Drone] = nil
    end
end

-- // Remove Others Function
local function RemovePlayerOthers(Other)
    if ESP_Others[Other] then 
        ESP_Others[Other].Visible = false
        ESP_Others[Other]:Remove()
        ESP_Others[Other] = nil
    end
    if ESP_Others_O[Other] then 
        ESP_Others_O[Other].Visible = false
        ESP_Others_O[Other]:Remove()
        ESP_Others_O[Other] = nil
    end
    if ESP_Others_T[Other] then 
        ESP_Others_T[Other].Visible = false
        ESP_Others_T[Other]:Remove()
        ESP_Others_T[Other] = nil
    end
end

-- // Get Enemies Function
local function GetEnemies()
    local Team = LocalPlayer.Team
    local Enemies = {}
    local RealPlayers = {}

    for i,v in next, Players:GetChildren() do
        if v.Character and Players[v.Name].Team ~= Team then
            for c,b in next, game.Workspace:GetChildren() do
                if b.Name == v.Name then
                    if b:FindFirstChild("Humanoid") then
                        local Humanoid = b:FindFirstChild("Humanoid")
                        if b:FindFirstChild("HumanoidRootPart") then
                            if b:FindFirstChild("HumanoidRootPart").Position ~= Vector3.new(0,0,0) then
                                for e,r in next, game.Workspace:WaitForChild("Viewmodels"):GetChildren() do
                                    if r.Name == "Viewmodel" and r:IsA("Model") then
                                        local Vm = r
                                        if Vm:FindFirstChild("head") then
                                            local head1 = Vm:FindFirstChild("head")
                                            if (head1.Position - b:FindFirstChild("HumanoidRootPart").Position).Magnitude < 4 then
                                                table.insert(RealPlayers, v)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    for i,v in next, RealPlayers do
        table.insert(Enemies, v.Character)
		table.insert(Enemies, v)
    end

    local Drones = {}
    local Others = {}

    for i,v in next, game.Workspace:GetChildren() do
        if v.Name == "Drone" then
            table.insert(Drones, v)
        end
        if v.Name == "FragGrenade" or v.Name == "SmokeGrenade" or v.Name == "StunGrenade" or v.Name == "EMPGrenade" or v.Name == "IncendiaryGrenade" or v.Name == "ImpactGrenade" or v.Name == "StickyCamera" or v.Name == "BulletproofCamera" or v.Name == "RemoteC4" or v.Name == "Claymore" or v.Name == "BreachCharge" or v.Name == "ProximityAlarm" or v.Name == "BarbedWire" or v.Name == "SignalDisruptor" or v.Name == "ThermiteCharge" or v.Name == "DeployableShield" or v.Name == "Defuser" then
            table.insert(Others, v)
        end
    end

    return Enemies, Drones, Others
end

-- // Character Minimum and Maximum Function
local function GetCharacterMinMax(Char)
    local MinimumX, MaximumX = math.huge, -math.huge
    local MinimumY, MaximumY = math.huge, -math.huge

    for i,v in next, Char:GetChildren() do
        if v:IsA("BasePart") then
            local Character_CFrame = v.CFrame
            local Character_Size = v.Size / 2

            local Corners =  {
                Vector3.new(-Character_Size.X, -Character_Size.Y, -Character_Size.Z),
                Vector3.new(-Character_Size.X, -Character_Size.Y, Character_Size.Z),
                Vector3.new(-Character_Size.X, Character_Size.Y, Character_Size.Z),
                Vector3.new(-Character_Size.X, Character_Size.Y, Character_Size.Z),
                Vector3.new(Character_Size.X, -Character_Size.Y, -Character_Size.Z),
                Vector3.new(Character_Size.X, -Character_Size.Y, Character_Size.Z),
                Vector3.new(Character_Size.X, Character_Size.Y, -Character_Size.Z),
                Vector3.new(Character_Size.X, Character_Size.Y, Character_Size.Z),
            }

            for i,v in next, Corners do
                local Corner_Position = Character_CFrame:PointToWorldSpace(v)
                local Tracer_Positions, On_Screen = Camera:WorldToViewportPoint(Corner_Position)

                if On_Screen then
                    MinimumX = math.min(MinimumX, Tracer_Positions.X)
                    MaximumX = math.max(MaximumX, Tracer_Positions.X)
                    MinimumY = math.min(MinimumY, Tracer_Positions.Y)
                    MaximumY = math.max(MaximumY, Tracer_Positions.Y)
                end
            end
        end
    end
    return MaximumX, MaximumY, MinimumX, MinimumY
end

-- // Calculating Health Bar Function
local function HealthBarCalculations(Char)
    local MaximumX, MaximumY, MinimumX, MinimumY = GetCharacterMinMax(Char)
    local Top_Left = Vector2.new(MinimumX, MinimumY)

    local Box_CFrame, Box_Size = Char:GetBoundingBox()
    local Top_Center_World = Box_CFrame.Position + Box_CFrame.UpVector * (Box_Size.Y / 2)

    local Left_Camera = -Camera.CFrame.RightVector
    local LK, KL = Camera:WorldToViewportPoint(Top_Center_World)
    local L0, K0 = Camera:WorldToViewportPoint(Top_Center_World + Left_Camera * .3)

    if not (KL and K0) then
        return Top_Left, Top_Left
    end

    local Left_Offset = Vector2.new(L0.X - LK.X, L0.Y - L0.Y)
    local Left_V2 = Top_Left + Left_Offset

    return Top_Left, Left_V2
end

-- // Implement Main ESP Function
local function MainESP(Target)
    if Target == nil or (not Target) then return end
    if not Target:IsA("Model") then return end

    local MaximumX, MaximumY, MinimumX, MinimumY = GetCharacterMinMax(Target)
    local Outlines

    if ESP_Boxes_O[Target.Name] then
        Outlines = ESP_Boxes_O[Target.Name]
        Outlines.Color = Fill_Color
        Outlines.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
        Outlines.Position = Vector2.new(MinimumX, MinimumY)
        Outlines.Thickness = (Box_Thickness / 1.25)
        Outlines.Visible = ESP_Box_Filled
    else
        Outlines = Drawing.new("Square")
        Outlines.Thickness = (Box_Thickness / 1.25)
        Outlines.Color = Color3.fromRGB(255,255,255)
        Outlines.Visible = ESP_Box_Filled
        Outlines.Filled = true
        Outlines.Transparency = .4
        Outlines.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
        Outlines.Position = Vector2.new(MinimumX, MinimumY)
        ESP_Boxes_O[Target.Name] = Outlines
    end

    local Corners
    if ESP_Corner_Boxes1[Target.Name] then
        Corners = ESP_Corner_Boxes1[Target.Name]
        Corners.From = Vector2.new(MinimumX, MinimumY)
        Corners.To = Vector2.new(MinimumX + (MaximumX - MinimumX) / 4, MinimumY)
        Corners.Color = Corner_Color
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = true
        Corners.From = Vector2.new(MinimumX, MinimumY)
        Corners.To = Vector2.new(MinimumX + (MaximumX - MinimumX) / 4, MinimumY)
        ESP_Corner_Boxes1[Target.Name] = Corners
    end
    if ESP_Corner_Boxes2[Target.Name] then
        Corners = ESP_Corner_Boxes2[Target.Name]
        Corners.From = Vector2.new(MinimumX, MinimumY)
        Corners.To = Vector2.new(MinimumX, MinimumY + (MaximumY - MinimumY) / 4)
        Corners.Color = Corner_Color
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MinimumX, MinimumY)
        Corners.To = Vector2.new(MinimumX, MinimumY + (MaximumY - MinimumY) / 4)
        ESP_Corner_Boxes2[Target.Name] = Corners
    end
    if ESP_Corner_Boxes3[Target.Name] then
        Corners = ESP_Corner_Boxes3[Target.Name]
        Corners.From = Vector2.new(MaximumX, MinimumY)
        Corners.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 4, MinimumY)
        Corners.Color = Corner_Color
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MinimumX, MinimumY)
        Corners.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 4, MinimumY)
        ESP_Corner_Boxes3[Target.Name] = Corners
    end
    if ESP_Corner_Boxes4[Target.Name] then
        Corners = ESP_Corner_Boxes4[Target.Name]
        Corners.From = Vector2.new(MaximumX, MinimumY)
        Corners.To = Vector2.new(MaximumX, MinimumY + (MaximumY - MinimumY) / 4)
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Corner_Color
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MaximumX, MinimumY)
        Corners.To = Vector2.new(MaximumX, MinimumY + (MaximumY - MinimumY) / 4)
        ESP_Corner_Boxes4[Target.Name] = Corners
    end
    if ESP_Corner_Boxes5[Target.Name] then
        Corners = ESP_Corner_Boxes5[Target.Name]
        Corners.From = Vector2.new(MinimumX, MaximumY)
        Corners.To = Vector2.new(MinimumX, MaximumY - (MaximumY - MinimumY) / 4)
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Corner_Color
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MinimumX, MaximumY)
        Corners.To = Vector2.new(MinimumX, MaximumY - (MaximumY - MinimumY) / 4)
        Corners.Color = Corner_Color
        ESP_Corner_Boxes5[Target.Name] = Corners
    end
    if ESP_Corner_Boxes6[Target.Name] then
        Corners = ESP_Corner_Boxes6[Target.Name]
        Corners.From = Vector2.new(MinimumX, MaximumY)
        Corners.To = Vector2.new(MinimumX + (MaximumX - MinimumX) / 4, MaximumY)
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Corner_Color
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MinimumX, MaximumY)
        Corners.To = Vector2.new(MinimumX + (MaximumX - MinimumX) / 4, MaximumY)
        ESP_Corner_Boxes6[Target.Name] = Corners
    end
    if ESP_Corner_Boxes7[Target.Name] then
        Corners = ESP_Corner_Boxes7[Target.Name]
        Corners.From = Vector2.new(MaximumX, MaximumY)
        Corners.To = Vector2.new(MaximumX, MaximumY - (MaximumY - MinimumY) / 4)
        Corners.Color = Corner_Color
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MaximumX, MaximumY)
        Corners.To = Vector2.new(MaximumX, MaximumY - (MaximumY - MinimumY) / 4)
        ESP_Corner_Boxes7[Target.Name] = Corners
    end
    if ESP_Corner_Boxes8[Target.Name] then
        Corners = ESP_Corner_Boxes8[Target.Name]
        Corners.From = Vector2.new(MaximumX, MaximumY)
        Corners.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 4, MaximumY)
        Corners.Color = Corner_Color
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Visible = ESP_Corner_Box
    else
        Corners = Drawing.new("Line")
        Corners.Thickness = (Box_Thickness / 2 + .75)
        Corners.Color = Color3.fromRGB(255,255,255)
        Corners.Visible = ESP_Corner_Box
        Corners.From = Vector2.new(MaximumX, MaximumY)
        Corners.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 4, MaximumY)
        ESP_Corner_Boxes8[Target.Name] = Corners
    end

    local Health_Bar
    local Top_Left, Width = HealthBarCalculations(Target)
    local hWidth  = (Top_Left - Width).Magnitude
    local Target_Health_Loss = Vector2.new(0, (MaximumY - MinimumY) * (1 - Target:WaitForChild("Humanoid").Health / 100))
    if ESP_Health_Bars[Target.Name] then
        Health_Bar = ESP_Health_Bars[Target.Name]
        Health_Bar.Size = Vector2.new(hWidth + 4, (MaximumY - MinimumY)) - Target_Health_Loss
        Health_Bar.Position = Vector2.new(Top_Left.X - 7 - hWidth, MinimumY) + Target_Health_Loss
        Health_Bar.Visible = ESP_Health_Bar
        if Target:WaitForChild("Humanoid").Health <= 100 and Target:WaitForChild("Humanoid").Health > 67  then
            Health_Bar.Color = Color3.fromRGB(0,255,0)
        elseif Target:WaitForChild("Humanoid").Health <= 67 and Target:WaitForChild("Humanoid").Health > 34  then
            Health_Bar.Color = Color3.fromRGB(255,255,0)
        elseif Target:WaitForChild("Humanoid").Health <= 34 then
            Health_Bar.Color = Color3.fromRGB(255,0,0)
        end
    else
        Health_Bar = Drawing.new("Square")
        Health_Bar.Visible = ESP_Health_Bar
        Health_Bar.Filled = true
        Health_Bar.Color = Color3.fromRGB(0,127,255)
        Health_Bar.Size = Vector2.new(hWidth + 4, (MaximumY - MinimumY)) - Target_Health_Loss
        Health_Bar.Position = Vector2.new(Top_Left.X - 7 - hWidth, MinimumY) + Target_Health_Loss
        ESP_Health_Bars[Target.Name] = Health_Bar
    end
    if ESP_Health_Bars2[Target.Name] then
        Outlines = ESP_Health_Bars2[Target.Name]
        Outlines.Visible = ESP_Health_Bar
        Outlines.Size = Vector2.new(hWidth + 4, (MaximumY - MinimumY)) - Target_Health_Loss
        Outlines.Position = Vector2.new(Top_Left.X - 7 - hWidth, MinimumY) + Target_Health_Loss
    else
        Outlines = Drawing.new("Square")
        Outlines.Visible = ESP_Health_Bar
        Outlines.Filled = false
        Outlines.Color = Color3.fromRGB(0,0,0)
        Outlines.Size = Vector2.new(hWidth + 4, (MaximumY - MinimumY)) - Target_Health_Loss
        Outlines.Position = Vector2.new(Top_Left.X - 7 - hWidth, MinimumY) + Target_Health_Loss
        Outlines.Thickness = 1.5
        ESP_Health_Bars2[Target.Name] = Outlines
    end

    local Health_Text
    if ESP_Health_Texts[Target.Name] then
        Health_Text = ESP_Health_Texts[Target.Name]
        Health_Text.Size = Health_Text_Size
        Health_Text.Visible = ESP_Health_Text
        Health_Text.Centered = true
        Health_Text.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MaximumY + Health_Text.TextBounds.Y / 5)
        Health_Text.Text = string.sub(tostring(Target:WaitForChild("Humanoid").Health), 1, 4)
        if Target:WaitForChild("Humanoid").Health <= 100 and Target:WaitForChild("Humanoid").Health > 67  then
            Health_Text.Color = Color3.fromRGB(0,255,0)
        elseif Target:WaitForChild("Humanoid").Health <= 67 and Target:WaitForChild("Humanoid").Health > 34  then
            Health_Text.Color = Color3.fromRGB(255,255,0)
        elseif Target:WaitForChild("Humanoid").Health <= 34 then
            Health_Text.Color = Color3.fromRGB(255,0,0)
        end
    else
        Health_Text = Drawing.new("Text")
        Health_Text.Text = string.sub(tostring(Target:WaitForChild("Humanoid").Health), 1, 3)
        Health_Text.Color = Color3.fromRGB(0,255,0)
        Health_Text.Outline = true
        Health_Text.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MaximumY + Health_Text.TextBounds.Y)
        Health_Text.Size = Health_Text_Size
        Health_Text.Visible = ESP_Health_Text
        Health_Text.OutlineColor = Color3.fromRGB(0,0,0)
        ESP_Health_Texts[Target.Name] = Health_Text
    end

    local Tracer
    if ESP_Tracers_O[Target.Name] then
        Outlines = ESP_Tracers_O[Target.Name]
        Outlines.Visible = ESP_Tracer
        Outlines.From = TracerPositions[Tracer_Position]
        Outlines.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 2, MinimumY + (MaximumY - MinimumY) / 8)
    else
        Outlines = Drawing.new("Line")
        Outlines.Thickness = 3
        Outlines.Color = Color3.fromRGB(0,0,0)
        Outlines.Visible = ESP_Tracer
        Outlines.From = TracerPositions[2]
        Outlines.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 2, MinimumY + (MaximumY - MinimumY) / 8)
        ESP_Tracers_O[Target.Name] = Outlines
    end
    if ESP_Tracers[Target.Name] then
        Tracer = ESP_Tracers[Target.Name]
        Tracer.Visible = ESP_Tracer
        Tracer.From = TracerPositions[2]
        Tracer.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 2, MinimumY + (MaximumY - MinimumY) / 8)
    else
        Tracer = Drawing.new("Line")
        Tracer.Thickness = 1.5
        Tracer.Color = Color3.fromRGB(255,255,255)
        Tracer.Visible = ESP_Tracer
        Tracer.From = TracerPositions[Tracer_Position]
        Tracer.To = Vector2.new(MaximumX - (MaximumX - MinimumX) / 2, MinimumY + (MaximumY - MinimumY) / 8)
        ESP_Tracers[Target.Name] = Tracer
    end

    local Name
    if ESP_Names[Target.Name] then
        Name = ESP_Names[Target.Name]
        Name.Visible = ESP_Name
        Name.Text = Target.Name
        Name.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MinimumY - Name.TextBounds.Y - 6)
        Name.Size = Name_Text_Size
    else
        Name = Drawing.new("Text")
        Name.Color = Color3.fromRGB(255,255,255)
        Name.Outline = true
        Name.OutlineColor = Color3.fromRGB(0,0,0)
        Name.Centered = true
        Name.Visible = ESP_Name
        Name.Text = Target.Name
        Name.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MinimumY - Name.TextBounds.Y - 4)
        Name.Size = Name_Text_Size
        ESP_Names[Target.Name] = Name
    end
    local Distance
    if ESP_Distances[Target.Name] then
        Distance = ESP_Distances[Target.Name]
        Distance.Visible = ESP_Distance
        if Target:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character then
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                Distance.Text = tostring(math.floor((Target.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) .. " studs")
            end
        else
            Distance.Text = "nil"
        end
        Distance.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MaximumY + Name.TextBounds.Y * 1.25)
        Distance.Size = 13
    else
        Distance = Drawing.new("Text")
        Distance.Color = Color3.fromRGB(255,255,255)
        Distance.Outline = true
        Distance.OutlineColor = Color3.fromRGB(0,0,0)
        Distance.Centered = true
        Distance.Visible = ESP_Name
        ESP_Distances[Target.Name] = Distance
    end
end

-- //  Drone Esp Function
local function DroneESP(Target)
    if Target == nil or (not Target) then return end
    if not Target:IsDescendantOf(workspace) then RemovePlayerDrone(Target); return end
    if not Target:IsA("Model") then return end
    local Teammates = {}
    for i,v in next, Players:GetPlayers() do
        local Team = LocalPlayer.Team
        if v.Character and v.Team == Team then
            table.insert(Teammates, v.Name)
        end
    end
    
    local MaximumX, MaximumY, MinimumX, MinimumY = GetCharacterMinMax(Target)
    
    local Outline
    local Box
    local NameText

    if ESP_Drones_O[Target] then
        Outline = ESP_Drones_O[Target]
    else
        Outline = Drawing.new("Square")
        Outline.Visible = ESP_Drone
        Outline.Color = Color3.fromRGB(0,0,0)
        Outline.Thickness = 4
        Outline.Filled = false
        ESP_Drones_O[Target] = Outline
    end

    if ESP_Drones[Target] then
        Box = ESP_Drones[Target]
    else
        Box = Drawing.new("Square")
        Box.Visible = ESP_Drone
        Box.Transparency = .5
        Box.Color = Color3.fromRGB(255,127,0)
        Box.Thickness = 1
        Box.Filled = true
        ESP_Drones[Target] = Box
    end
    if ESP_Drones_T[Target] then
        NameText = ESP_Drones_T[Target]
        NameText.Text = tostring(Target)
    else
        NameText = Drawing.new("Text")
        NameText.Size = 18
        NameText.Centered = true
        NameText.Outline = true
        NameText.OutlineColor = Color3.fromRGB(0,0,0)
        NameText.Color = Color3.fromRGB(255,127,0)
        NameText.Text = tostring(Target)
        ESP_Drones_T[Target] = NameText
    end
    NameText.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MinimumY - NameText.TextBounds.Y * 1.25)
    Box.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
    Box.Position = Vector2.new(MinimumX, MinimumY)
    Outline.Position = Vector2.new(MinimumX, MinimumY)
    Outline.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
    if ESP_Drone == true then
        if TeammateCheck == true then
            if Target:FindFirstChild("Owner") then
                if table.find(Teammates, Target:FindFirstChild("Owner").Username.Text) then
                    ESP_Drones[Target].Visible = false
                    ESP_Drones_O[Target].Visible = false
                    ESP_Drones_T[Target].Visible = false
                end
            else
                ESP_Drones[Target].Visible = true
                ESP_Drones_O[Target].Visible = true
                ESP_Drones_T[Target].Visible = true
            end
        else
            ESP_Drones[Target].Visible = true
            ESP_Drones_O[Target].Visible = true
            ESP_Drones_T[Target].Visible = true
        end
    else
        ESP_Drones[Target].Visible = false
        ESP_Drones_O[Target].Visible = false
        ESP_Drones_T[Target].Visible = false
    end
end

local function OthersESP(Target)
    if Target == nil or (not Target) then return end
    if not Target:IsDescendantOf(workspace) then RemovePlayerOthers(Target); return end
    if not Target:IsA("Model") then return end
    local Teammates = {}
    for i,v in next, Players:GetPlayers() do
        local Team = LocalPlayer.Team
        if v.Character and v.Team == Team then
            table.insert(Teammates, v.Name)
        end
    end
    
    local MaximumX, MaximumY, MinimumX, MinimumY = GetCharacterMinMax(Target)
    
    local Outline
    local Box
    local NameText

    if ESP_Others_O[Target] then
        Outline = ESP_Others_O[Target]
    else
        Outline = Drawing.new("Square")
        Outline.Visible = ESP_Other
        Outline.Color = Color3.fromRGB(0,0,0)
        Outline.Thickness = 4
        Outline.Filled = false
        ESP_Others_O[Target] = Outline
    end

    if ESP_Others[Target] then
        Box = ESP_Others[Target]
    else
        Box = Drawing.new("Square")
        Box.Visible = ESP_Other
        Box.Transparency = .5
        Box.Color = Color3.fromRGB(155,125,255)
        Box.Thickness = 1
        Box.Filled = true
        ESP_Others[Target] = Box
    end

    if ESP_Others_T[Target] then
        NameText = ESP_Others_T[Target]
        NameText.Text = tostring(Target)
    else
        NameText = Drawing.new("Text")
        NameText.Size = 18
        NameText.Centered = true
        NameText.Outline = true
        NameText.OutlineColor = Color3.fromRGB(0,0,0)
        NameText.Color = Color3.fromRGB(255,255,0)
        NameText.Text = tostring(Target)
        ESP_Others_T[Target] = NameText
    end
    NameText.Position = Vector2.new(MinimumX + (MaximumX - MinimumX) / 2, MinimumY - NameText.TextBounds.Y * 1.25)
    Box.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
    Box.Position = Vector2.new(MinimumX, MinimumY)
    Outline.Position = Vector2.new(MinimumX, MinimumY)
    Outline.Size = Vector2.new(MaximumX - MinimumX, MaximumY - MinimumY)
    if ESP_Other == true then
        if TeammateCheck == true then
            if Target:FindFirstChild("Owner") then
                if table.find(Teammates, Target:FindFirstChild("Owner").Username.Text) then
                    ESP_Others[Target].Visible = false
                    ESP_Others_O[Target].Visible = false
                    ESP_Others_T[Target].Visible = false
                end
            else
                ESP_Others[Target].Visible = true
                ESP_Others_O[Target].Visible = true
                ESP_Others_T[Target].Visible = true
            end
        else
            ESP_Others[Target].Visible = true
            ESP_Others_O[Target].Visible = true
            ESP_Others_T[Target].Visible = true
        end
    else
        ESP_Others[Target].Visible = false
        ESP_Others_O[Target].Visible = false
        ESP_Others_T[Target].Visible = false
    end
end

-- // Remove Player ESP Function
Players.PlayerRemoving:Connect(function(plr)
    RemovePlayer(plr.Name)
end)

-- // Character Hook Function
local function CharacterHook(plr)
    local Character = plr.Character
    if not Character then return end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid.Died:Connect(function()
            RemovePlayer(plr.Name)
        end)
    end
end

-- // Player Added Function
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(Character)
        CharacterHook(plr)
    end)
end)

-- // Players Function
for i,v in next, Players:GetPlayers() do
    if v.Character then
        CharacterHook(v)
    end
end

-- // Main ESP Loop Function
RunService.RenderStepped:Connect(function()
    local Enemies, Drones, Others = GetEnemies()

    local Alive = {}

    for i,v in next, Enemies do
        Alive[v.Name] = true
        MainESP(v)
    end
    for i,v in next, Drones do
        DroneESP(v)
    end
    for i,v in next, Others do
        OthersESP(v)
    end

	for i,v in next, ESP_Corner_Boxes1 do
		if not Alive[i] then RemovePlayer(i) end
	end
    for i,v in next, ESP_Health_Bars do
        if not Alive[i] then RemovePlayer(i) end
    end
    for i,v in next, ESP_Health_Texts do
        if not Alive[i] then RemovePlayer(i) end
    end
    for i,v in next, ESP_Tracers do
        if not Alive[i] then RemovePlayer(i) end
    end
    for i,v in next, ESP_Names do
        if not Alive[i] then RemovePlayer(i) end
    end
    for i,v in next, ESP_Drones do
        if not i or not i:IsDescendantOf(game.Workspace) then 
            RemovePlayerDrone(i) 
        end
    end
    for i,v in next, ESP_Others do
        if not i or not i:IsDescendantOf(game.Workspace) then 
            RemovePlayerOthers(i) 
        end
    end
end)

-- // Head Expander Function
local function HeadExpander()
    local Enemies, Drones = GetEnemies()
    repeat task.wait() until LocalPlayer.PlayerGui:FindFirstChild("KillCam")
    local KillCam = LocalPlayer.PlayerGui:FindFirstChild("KillCam")
    if workspace:FindFirstChild("Viewmodels") then
    local Player_Heads = workspace:FindFirstChild("Viewmodels")
    for i,v in next, Player_Heads:GetChildren() do
        if v.Name == "Viewmodel" then
            local ViewModel = v
            if ViewModel:FindFirstChild("head") and ViewModel:FindFirstChildOfClass("Model") then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = ViewModel.head
                Highlight.FillColor = HighlightColorHead
                Highlight.OutlineColor = Color3.fromRGB(0,0,0)
                Highlight.FillTransparency = .5
                if KillCamAutoAdjust == true then
                    if KillCam.Enabled == true then
                        Highlight.Enabled = false
                    else    
                        Highlight.Enabled = HighlightHeadEnabled
                    end
                else
                    Highlight.Enabled = HighlightHeadEnabled
                end
                if Head_Size_Multiplier == 1 then
                    if ViewModel:FindFirstChild("head") then
                        if ViewModel.head.Size ~= Settings["Original_Head_Size"] then
                            ViewModel.head.Size = Settings["Original_Head_Size"]
                        end
                        if HighlightHeadEnabled == false then
                            ViewModel.head.Transparency = Head_Transparency
                        else
                            ViewModel.head.Transparency = 0
                        end
                    end
                 elseif Head_Size_Multiplier > 1 then
                    if Players.LocalPlayer.Character then
                        if Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            if Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                                if KillCamAutoAdjust == true then
                                    if LocalPlayer.PlayerGui then
                                        if KillCam.Enabled then
                                            if ViewModel:FindFirstChild("head") then
                                                Highlight.Parent = nil
                                                Highlight:Remove()
                                                ViewModel.head.Size = Settings["Original_Head_Size"]
                                            end
                                        else
                                                if ViewModel:FindFirstChild("head") then
                                                    ViewModel.head.Size = Settings["Original_Head_Size"] * Head_Size_Multiplier
                                                end
                                            end
                                        end
                                    else
                                        if ViewModel:FindFirstChild("head") then
                                            ViewModel.head.Size = Settings["Original_Head_Size"] * Head_Size_Multiplier
                                        end
                                    end
                                elseif Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health <= 0 then
                                    if ViewModel:FindFirstChild("head") then
                                        ViewModel.head.Size = Settings["Original_Head_Size"]
                                    end
                                end
                            end
                        end
                    if ViewModel:FindFirstChild("head") then
                        if HighlightHeadEnabled == false then
                            ViewModel.head.Transparency = Head_Transparency
                        else
                            ViewModel.head.Transparency = 0
                        end
                    end
                else
                    if ViewModel:FindFirstChild("head") then
                        ViewModel:Destroy()
                    end
                end
                task.wait()
                Highlight.Parent = nil
                Highlight:Remove()
                end
            end
         end
    end
end

-- // Walkspeed Multipler Function
local function MultiplyWalkspeed()
    local PossiblePlayers = {}
    if (WalkSpeedMultiply == false) then return end
    for i,v in next, workspace:GetChildren() do
        if (v.Name == LocalPlayer.Name) then
            table.insert(PossiblePlayers, v)
            for c,b in next, PossiblePlayers do
                if b:FindFirstChild("Humanoid") then
                    local HumanoidGuy = b:FindFirstChild("Humanoid")
                    if (HumanoidGuy.WalkSpeed >= 13.5) then
                    else
                        HumanoidGuy.WalkSpeed = ((HumanoidGuy.WalkSpeed * WalkSpeedPercentage/2250) + HumanoidGuy.WalkSpeed)
                    end
                end
            end
        end
    end
end

if Camera then
    Settings["Original_FOV"] = Camera.FieldOfView
end
task.wait(.1)
-- // Modify Field Of View
local function ModifyFieldOfView()
    if AimHold == true then return end
    if (not Camera) then return end
    if (ModifyFOVEnabled == true) then
        Camera.FieldOfView = ModifiedFieldOfView
    end
    task.wait(.55)
    if (ModifyFOVEnabled == false) then Camera.FieldOfView = Settings["Original_FOV"] end
end

local function GetOldFOV()
    task.wait(.5)
    if ModifyFOVEnabled == false then
        if Camera then
            Settings["Original_FOV"] = Camera.FieldOfView
        end
    end
end

-- // Main Head Expander and Walkspeed and FOV and Mod Check loop
RunService.RenderStepped:Connect(function()
    if ModCheck == true then
        local plrs = {}
        for i,v in next, Players:GetPlayers() do
            table.insert(plrs, v)
        end
        if #plrs > 8 then
            if workspace:FindFirstChild("WarehouseMenu") then
            else
                LocalPlayer:Kick("Darkizz Softworks | Operation One: Game-Moderator detected ingame.")
            end
        end
    end

    HeadExpander()
    MultiplyWalkspeed()
end)

-- // Modifying Firerate Speed -- // Possibly Detected!
local function ModifyFirerateSpeed(New_Firerate_Speed)
    if V1Warn == 0 then
        V1Warn += 1
        task.spawn(CreateNotification, "Important Information", "This feature is POSSIBLY detected, press the button again to use it.", 5)
    else
    local Actor = getactors()[1]
    run_on_actor(Actor, [[
        for i,v in next, getgc(true) do
            if (typeof(v) ~= "table") then
                continue;
            end;

            local Flash = rawget(v, "flash");
            if (Flash) then
                local Old; Old = hookfunction(v.recoil_function, function(gun_table, gun_instance)
                    local weapon_states = gun_table["object"]["states"];
                    weapon_states["firerate"]:set(tonumber(2500))
                    return Old(gun_table, gun_instance)
                end);
            end;
        end;
    ]])
    end
end

-- // Modifying Firerate Speed -- // Possibly Detected!
local function ModifyRecoilValue(New_Recoil_Value)
    if V2Warn == 0 then
        V2Warn += 1
        task.spawn(CreateNotification, "Important Information", "This feature is POSSIBLY detected, press the button again to use it.", 5)
    else
    local Actor = getactors()[1]
    run_on_actor(Actor, [[
        for i,v in next, getgc(true) do
            if type(v) ~= "table" then
                continue;
            end;

            local Flash = rawget(v, "flash");
            if (Flash) then
                local Old; Old = hookfunction(v.recoil_function, function(gun_table, gun_instance)
                    local weapon_states = gun_table["object"]["states"];
                    weapon_states["recoil_up"]:set(tonumber(0))
                    weapon_states["recoil_side"]:set(tonumber(0))
                    return Old(gun_table, gun_instance)
                end);
            end;
        end;
    ]])
    end
end

getgenv().ExecutedAlreadyCheckV1_3_2 += 1

-- // Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Operation One V1.3.2",
   Icon = 0,
   LoadingTitle = "Operation One V1.3.2",
   LoadingSubtitle = "Darkizz Softworks",
   ShowText = "Darkizz Softworks",
   Theme = "Default", 

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Darkizz Softworks"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true 
   },

   KeySystem = false, 
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})

-- // ESP Tab
local ESPTab = Window:CreateTab("Extra Sensory Perception", "eye")

local ESPSection1 = ESPTab:CreateSection("ESP Boxes")
local ESPToggle1 = ESPTab:CreateToggle({
   Name = "ESP Corner Boxes",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
    ESP_Corner_Box = Value
   end,
})
local ESPColorPicker1 = ESPTab:CreateColorPicker({
    Name = "Corner Box Color",
    Color = Color3.fromRGB(255,150,0),
    Flag = "ColorPicker1",
    Callback = function(Value)
     Corner_Color = Value
    end
})
local ESPToggle2 = ESPTab:CreateToggle({
   Name = "Boxes Filled",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
    ESP_Box_Filled = Value
   end,
})
local ESPColorPicker2 = ESPTab:CreateColorPicker({
    Name = "Fill Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker2",
    Callback = function(Value)
     Fill_Color = Value
    end
})

local ESPDivider1 = ESPTab:CreateDivider()
local ESPSection1 = ESPTab:CreateSection("ESP Names")
local ESPToggle3 = ESPTab:CreateToggle({
   Name = "ESP Names",
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(Value)
    ESP_Name = Value
   end,
})
local ESPSlider1 = ESPTab:CreateSlider({
   Name = "Name Text Size",
   Range = {12, 18},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 12,
   Flag = "Slider1",
   Callback = function(Value)
    Name_Text_Size = Value
   end,
})

local ESPDivider2 = ESPTab:CreateDivider()
local ESPSection2 = ESPTab:CreateSection("ESP Health")
local ESPToggle4 = ESPTab:CreateToggle({
   Name = "ESP Health Bars",
   CurrentValue = false,
   Flag = "Toggle4",
   Callback = function(Value)
    ESP_Health_Bar = Value
   end,
})
local ESPToggle5 = ESPTab:CreateToggle({
   Name = "ESP Health Texts",
   CurrentValue = false,
   Flag = "Toggle5",
   Callback = function(Value)
    ESP_Health_Text = Value
   end,
})
local ESPSlider2 = ESPTab:CreateSlider({
   Name = "Health Text Size",
   Range = {12, 18},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 12,
   Flag = "Slider2",
   Callback = function(Value)
    Health_Text_Size = Value
   end,
})

local ESPDivider3 = ESPTab:CreateDivider()
local ESPSection3 = ESPTab:CreateSection("ESP Tracers and Distance")

local ESPToggle6 = ESPTab:CreateToggle({
   Name = "ESP Tracers",
   CurrentValue = false,
   Flag = "Toggle6",
   Callback = function(Value)
    ESP_Tracer = Value
   end,
})

local ESPToggle7 = ESPTab:CreateToggle({
   Name = "ESP Distances",
   CurrentValue = false,
   Flag = "Toggle7",
   Callback = function(Value)
    ESP_Distance = Value
   end,
})

local ESPDivider4 = ESPTab:CreateDivider()
local ESPSection4 = ESPTab:CreateSection("ESP Drones and Gadgets")

local ESPToggle8 = ESPTab:CreateToggle({
   Name = "ESP Drones",
   CurrentValue = false,
   Flag = "Toggle8",
   Callback = function(Value)
    ESP_Drone = Value
   end,
})
local ESPToggle9 = ESPTab:CreateToggle({
   Name = "ESP Others",
   CurrentValue = false,
   Flag = "Toggle9",
   Callback = function(Value)
    ESP_Other = Value
   end,
})
local ESPToggle10 = ESPTab:CreateToggle({
   Name = "Teammate Check",
   CurrentValue = false,
   Flag = "Toggle10",
   Callback = function(Value)
    TeammateCheck = Value
   end,
})
local ESPDivider5 = ESPTab:CreateDivider()

local HitboxTab = Window:CreateTab("Hitbox Expander", "expand")
local HitboxSection1 = HitboxTab:CreateSection("Head Expansion Options")
local HitboxToggle1 = HitboxTab:CreateToggle({
   Name = "Highlight Heads",
   CurrentValue = false,
   Flag = "Toggle11",
   Callback = function(Value)
    HighlightHeadEnabled = Value
   end,
})
local HitboxColorPicker1 = HitboxTab:CreateColorPicker({
    Name = "Highlight Color",
    Color = Color3.fromRGB(255,0,255),
    Flag = "ColorPicker3",
    Callback = function(Value)
        HighlightColorHead = Value
    end
})

local HitboxSlider1 = HitboxTab:CreateSlider({
   Name = "Head Size",
   Range = {1, 6},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 1,
   Flag = "Slider3",
   Callback = function(Value)
    Head_Size_Multiplier = Value
   end,
})
local HitboxSlider2 = HitboxTab:CreateSlider({
   Name = "Head Transparency",
   Range = {0,1},
   Increment = .05,
   Suffix = "Transparency",
   CurrentValue = 0,
   Flag = "Slider4",
   Callback = function(Value)
    Head_Transparency = Value
   end,
})

local HitboxSection2 = HitboxTab:CreateSection("Killcam Auto-Adjust")
local HitboxToggle2 = HitboxTab:CreateToggle({
   Name = "Auto-Adjust Head Size",
   CurrentValue = false,
   Flag = "Toggle12",
   Callback = function(Value)
    KillCamAutoAdjust = Value
   end,
})

local HitboxDivider1 = HitboxTab:CreateDivider()

local PlayerModTab = Window:CreateTab("Local Player", "user-cog")
local PlayerModSection1 = PlayerModTab:CreateSection("Walkspeed")
local PlayerModToggle1 = PlayerModTab:CreateToggle({
   Name = "Modify Walkspeed",
   CurrentValue = false,
   Flag = "Toggle13",
   Callback = function(Value)
    WalkSpeedMultiply = Value
   end,
})
local PlayerModSlider1 = PlayerModTab:CreateSlider({
   Name = "Walkspeed Percentage",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Percentage",
   CurrentValue = 25,
   Flag = "Slider5",
   Callback = function(Value)
    WalkSpeedPercentage = Value
   end,
})

local PlayerModSection3 = PlayerModTab:CreateSection("Field Of View")
local PlayerModToggle3 = PlayerModTab:CreateToggle({
   Name = "Modify FOV",
   CurrentValue = false,
   Flag = "Toggle13",
   Callback = function(Value)
    ModifyFOVEnabled = Value
   end,
})
local PlayerModSlider2 = PlayerModTab:CreateSlider({
   Name = "Field Of View",
   Range = {70, 120},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = 70,
   Flag = "Slider6",
   Callback = function(Value)
    ModifiedFieldOfView = Value
   end,
})

local PlayerModSection4 = PlayerModTab:CreateSection("Moderation Protection")
local PlayerModToggle4 = PlayerModTab:CreateToggle({
   Name = "Auto-Kick",
   CurrentValue = false,
   Flag = "Toggle15",
   Callback = function(Value)
    ModCheck = Value
   end,
})

local PlayerModDivider1 = PlayerModTab:CreateDivider()

local DetectedFeaturesTab = Window:CreateTab("Detected Features", "circle-alert")
local DetectedFeaturesSection1 = DetectedFeaturesTab:CreateSection("WARNING : THESE FEATURES ARE DETECTED!")

local DetectFeaturesButton1 = DetectedFeaturesTab:CreateButton({
   Name = "Modify Firerate: Sets it to 2500, FAST.",
   Callback = function()
    ModifyFirerateSpeed()
   end,
})

local DetectFeaturesButton2 = DetectedFeaturesTab:CreateButton({
   Name = "Modify Recoil: Sets it to 0, NO RECOIL.",
   Callback = function()
    ModifyRecoilValue()
   end,
})

task.spawn(CreateNotification, "Script Loader", "Operation One script successfully loaded in " .. string.sub(tostring(os.clock() - TimeRightNow), 1, 5) .. " seconds.", 6)
NeverloseSound:Play()
task.wait(1.1)
NeverloseSound.Parent = nil
NeverloseSound:Remove()

while true do
    task.spawn(GetOldFOV)
    task.spawn(ModifyFieldOfView)
    task.wait(.55)
end

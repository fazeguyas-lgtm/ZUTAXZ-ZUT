--[[
    ZUTAXZ Sky Aesthetic ULTRA v3.0 — IMAGE SKYBOX
    Universal — Delta / Xeno / Solara / Wave Compatible
    NEW: 40+ IMAGE-BASED SKYBOX dari Roblox asset (real photo/gambar)
    - Anime scene, Galaxy, Rainbow, Fantasy art, Cinematic
    - Decal/Skybox dengan gambar nyata, bukan warna solid
    - Preview thumbnail di UI card
    - Custom Skybox Image ID input
]]

task.wait(0.5)

local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ═══════════ BACKUP ═══════════
local backup = {Sky=nil, Atmosphere=nil, Bloom=nil, CC=nil, SunRays=nil, DoF=nil,
    Brightness=Lighting.Brightness, ClockTime=Lighting.ClockTime,
    Ambient=Lighting.Ambient, OutdoorAmbient=Lighting.OutdoorAmbient,
    FogEnd=Lighting.FogEnd, FogStart=Lighting.FogStart, FogColor=Lighting.FogColor,
    GlobalShadows=Lighting.GlobalShadows}
for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("Sky") then backup.Sky = v end
    if v:IsA("Atmosphere") then backup.Atmosphere = v end
    if v:IsA("BloomEffect") then backup.Bloom = v end
    if v:IsA("ColorCorrectionEffect") then backup.CC = v end
    if v:IsA("SunRaysEffect") then backup.SunRays = v end
    if v:IsA("DepthOfFieldEffect") then backup.DoF = v end
end

-- ═══════════ THEME ULTRA ═══════════
local Theme = {
    Bg=Color3.fromRGB(8,10,16), Sidebar=Color3.fromRGB(6,8,14),
    Panel=Color3.fromRGB(18,22,32), PanelHi=Color3.fromRGB(28,34,48),
    Row=Color3.fromRGB(22,26,38), RowHi=Color3.fromRGB(32,38,52),
    Accent=Color3.fromRGB(140,180,255), Accent2=Color3.fromRGB(255,140,220),
    Accent3=Color3.fromRGB(100,255,220), Purple=Color3.fromRGB(180,110,255),
    Text=Color3.fromRGB(240,244,255), Muted=Color3.fromRGB(140,150,170),
    Divider=Color3.fromRGB(36,44,58), ToggleOff=Color3.fromRGB(50,58,72),
    Success=Color3.fromRGB(0,220,140), Danger=Color3.fromRGB(240,80,90),
    Gold=Color3.fromRGB(255,200,80),
}

-- ═══════════ SCREEN GUI ═══════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZUTAXZ_SkyImage"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 100
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

function Notify(msg, color)
    local t = Instance.new("Frame")
    t.Size = UDim2.new(0, 280, 0, 40)
    t.Position = UDim2.new(0.5, -140, 0, -60)
    t.BackgroundColor3 = Theme.Panel
    t.BorderSizePixel = 0
    t.Parent = ScreenGui
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 10); c.Parent = t
    local s = Instance.new("UIStroke"); s.Color = color or Theme.Accent; s.Thickness = 1.5; s.Transparency = 0.2; s.Parent = t
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 3, 0.7, 0)
    bar.Position = UDim2.new(0, 6, 0.15, 0)
    bar.BackgroundColor3 = color or Theme.Accent
    bar.BorderSizePixel = 0
    bar.Parent = t
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(1,0); bc.Parent = bar
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,-24,1,0); l.Position = UDim2.new(0,18,0,0)
    l.BackgroundTransparency = 1; l.Text = msg
    l.TextColor3 = Theme.Text; l.Font = Enum.Font.GothamBold
    l.TextSize = 12; l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = t
    TweenService:Create(t, TweenInfo.new(0.35, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -140, 0, 24)
    }):Play()
    task.delay(2.4, function()
        TweenService:Create(t, TweenInfo.new(0.3), {
            Position = UDim2.new(0.5, -140, 0, -60), BackgroundTransparency = 1
        }):Play()
        task.wait(0.35); t:Destroy()
    end)
end

-- Window
local Win = Instance.new("Frame")
Win.Size = UDim2.new(0, 820, 0, 560)
Win.Position = UDim2.new(0.5, -410, 0.5, -280)
Win.BackgroundColor3 = Theme.Bg
Win.BorderSizePixel = 0
Win.Active = true
Win.ClipsDescendants = true
Win.Parent = ScreenGui
local wc = Instance.new("UICorner"); wc.CornerRadius = UDim.new(0, 12); wc.Parent = Win
local ws = Instance.new("UIStroke"); ws.Color = Theme.Divider; ws.Thickness = 1; ws.Parent = Win

-- Title bar
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1, 0, 0, 46); TB.BackgroundColor3 = Theme.Sidebar
TB.BorderSizePixel = 0; TB.Parent = Win
local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(0, 12); tbc.Parent = TB
local tbfix = Instance.new("Frame")
tbfix.Size = UDim2.new(1,0,0.5,0); tbfix.Position = UDim2.new(0,0,0.5,0)
tbfix.BackgroundColor3 = Theme.Sidebar; tbfix.BorderSizePixel = 0; tbfix.Parent = TB

local titleGrad = Instance.new("Frame")
titleGrad.Size = UDim2.new(1, 0, 0, 2); titleGrad.Position = UDim2.new(0, 0, 1, -2)
titleGrad.BackgroundColor3 = Theme.Accent; titleGrad.BorderSizePixel = 0
titleGrad.Parent = TB
local tgGrad = Instance.new("UIGradient")
tgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Accent),
    ColorSequenceKeypoint.new(0.33, Theme.Accent2),
    ColorSequenceKeypoint.new(0.66, Theme.Purple),
    ColorSequenceKeypoint.new(1, Theme.Accent3),
})
tgGrad.Parent = titleGrad

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 520, 1, 0); Title.Position = UDim2.new(0, 18, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🖼️  ZUTAXZ  SKY  IMAGE  ULTRA  HD"
Title.TextColor3 = Theme.Text; Title.Font = Enum.Font.GothamBold
Title.TextSize = 14; Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TB

local TitleGradTxt = Instance.new("UIGradient")
TitleGradTxt.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Theme.Accent),
    ColorSequenceKeypoint.new(0.5, Theme.Accent2),
    ColorSequenceKeypoint.new(1, Theme.Accent3),
})
TitleGradTxt.Parent = Title

local VerBadge = Instance.new("TextLabel")
VerBadge.Size = UDim2.new(0, 70, 0, 20)
VerBadge.Position = UDim2.new(0, 540, 0.5, -10)
VerBadge.BackgroundColor3 = Theme.Row
VerBadge.Text = "v3.0 IMG"
VerBadge.TextColor3 = Theme.Accent3
VerBadge.Font = Enum.Font.GothamBold
VerBadge.TextSize = 9
VerBadge.Parent = TB
local vbc = Instance.new("UICorner"); vbc.CornerRadius = UDim.new(0, 4); vbc.Parent = VerBadge

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Size = UDim2.new(0, 100, 1, 0); FPSLabel.Position = UDim2.new(1, -240, 0, 0)
FPSLabel.BackgroundTransparency = 1; FPSLabel.Text = "◈ 120 FPS"
FPSLabel.TextColor3 = Theme.Success; FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.TextSize = 10; FPSLabel.TextXAlignment = Enum.TextXAlignment.Right
FPSLabel.Parent = TB

local frames, lastUpdate = 0, tick()
RunService.RenderStepped:Connect(function()
    frames = frames + 1
    if tick() - lastUpdate >= 1 then
        FPSLabel.Text = "◈ "..frames.." FPS"
        frames = 0; lastUpdate = tick()
    end
end)

local function mkCtrl(label, x, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 30, 1, 0); b.Position = UDim2.new(1, x, 0, 0)
    b.BackgroundTransparency = 1; b.Text = label
    b.TextColor3 = Theme.Muted; b.Font = Enum.Font.GothamBold
    b.TextSize = 14; b.AutoButtonColor = false; b.Parent = TB
    b.MouseEnter:Connect(function() b.TextColor3 = Theme.Accent end)
    b.MouseLeave:Connect(function() b.TextColor3 = Theme.Muted end)
    b.MouseButton1Click:Connect(cb)
    return b
end
mkCtrl("─", -72, function() TweenService:Create(Win, TweenInfo.new(0.2), {Size = UDim2.new(0, 820, 0, 46)}):Play() end)
local maximized = false
mkCtrl("⛶", -38, function()
    maximized = not maximized
    TweenService:Create(Win, TweenInfo.new(0.2), {
        Size = maximized and UDim2.new(0, 1120, 0, 680) or UDim2.new(0, 820, 0, 560),
        Position = maximized and UDim2.new(0.5, -560, 0.5, -340) or UDim2.new(0.5, -410, 0.5, -280),
    }):Play()
end)
mkCtrl("✕", -4, function() ScreenGui:Destroy() end)

-- Drag
local dStart, sPos
TB.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dStart = i.Position; sPos = Win.Position
        i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then dStart = nil end
        end)
    end
end)
TB.InputChanged:Connect(function(i)
    if dStart and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - dStart
        Win.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y)
    end
end)

-- Sidebar
local SB = Instance.new("Frame")
SB.Size = UDim2.new(0, 175, 1, -46); SB.Position = UDim2.new(0, 0, 0, 46)
SB.BackgroundColor3 = Theme.Sidebar; SB.BorderSizePixel = 0; SB.Parent = Win

local NavItems = {
    {name="Anime", icon="✨"},
    {name="Galaxy", icon="🌌"},
    {name="Rainbow", icon="🌈"},
    {name="Fantasy", icon="🔮"},
    {name="Cinematic", icon="🎬"},
    {name="Horror", icon="👻"},
    {name="Nature", icon="🌿"},
    {name="Custom", icon="🎨"},
    {name="Reset", icon="🔄"},
}
local navButtons = {}
local pages = {}
local currentPage = "Anime"

local function setPage(name)
    currentPage = name
    for n, p in pairs(pages) do p.Visible = (n == name) end
    for n, b in pairs(navButtons) do
        local active = (n == name)
        local lbl = b:FindFirstChildOfClass("TextLabel")
        local bar = b:FindFirstChild("ActiveBar")
        if lbl then lbl.TextColor3 = active and Theme.Text or Theme.Muted end
        if bar then bar.Visible = active end
    end
end

for i, item in ipairs(NavItems) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -16, 0, 36)
    btn.Position = UDim2.new(0, 8, 0, 8 + (i-1) * 38)
    btn.BackgroundColor3 = Theme.Sidebar
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = SB
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 8); bc.Parent = btn

    local ActiveBar = Instance.new("Frame")
    ActiveBar.Name = "ActiveBar"
    ActiveBar.Size = UDim2.new(0, 3, 0.6, 0)
    ActiveBar.Position = UDim2.new(0, 0, 0.2, 0)
    ActiveBar.BackgroundColor3 = Theme.Accent
    ActiveBar.BorderSizePixel = 0
    ActiveBar.Visible = false
    ActiveBar.Parent = btn
    local abc = Instance.new("UICorner"); abc.CornerRadius = UDim.new(1,0); abc.Parent = ActiveBar

    local ic = Instance.new("TextLabel")
    ic.Size = UDim2.new(0, 20, 1, 0); ic.Position = UDim2.new(0, 12, 0, 0)
    ic.BackgroundTransparency = 1; ic.Text = item.icon
    ic.TextColor3 = Theme.Muted; ic.Font = Enum.Font.GothamBold
    ic.TextSize = 15; ic.Parent = btn

    local lb = Instance.new("TextLabel")
    lb.Size = UDim2.new(1, -44, 1, 0); lb.Position = UDim2.new(0, 38, 0, 0)
    lb.BackgroundTransparency = 1; lb.Text = item.name
    lb.TextColor3 = Theme.Muted; lb.Font = Enum.Font.GothamMedium
    lb.TextSize = 12; lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.Parent = btn

    btn.MouseEnter:Connect(function()
        if currentPage ~= item.name then
            TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Theme.Panel}):Play()
        end
    end)
    btn.MouseLeave:Connect(function()
        if currentPage ~= item.name then
            TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Theme.Sidebar}):Play()
        end
    end)
    btn.MouseButton1Click:Connect(function() setPage(item.name) end)
    navButtons[item.name] = btn
end

local CA = Instance.new("Frame")
CA.Size = UDim2.new(1, -175, 1, -46); CA.Position = UDim2.new(0, 175, 0, 46)
CA.BackgroundColor3 = Theme.Bg; CA.BorderSizePixel = 0; CA.Parent = Win

local function mkPage(name)
    local p = Instance.new("ScrollingFrame")
    p.Name = name
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1; p.BorderSizePixel = 0
    p.ScrollBarThickness = 3; p.ScrollBarImageColor3 = Theme.Accent
    p.CanvasSize = UDim2.new(0, 0, 0, 0)
    p.AutomaticCanvasSize = Enum.AutomaticSize.Y
    p.Visible = false; p.Parent = CA
    pages[name] = p
    return p
end

local function mkSection(parent, y, title)
    local h = Instance.new("TextLabel")
    h.Size = UDim2.new(1, -24, 0, 22); h.Position = UDim2.new(0, 12, 0, y)
    h.BackgroundTransparency = 1; h.Text = title
    h.TextColor3 = Theme.Accent; h.Font = Enum.Font.GothamBold
    h.TextSize = 11; h.TextXAlignment = Enum.TextXAlignment.Left
    h.Parent = parent
    return h
end

-- ═══════════ SKY APPLY ENGINE ═══════════
local function getOrCreate(class, name)
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA(class) and v.Name == name then return v end
    end
    local e = Instance.new(class); e.Name = name; e.Parent = Lighting
    return e
end

local function clearSky()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") then v:Destroy() end
    end
end

local function applyImageSky(preset)
    clearSky()
    
    local sky = Instance.new("Sky")
    sky.Name = "ZUTAXZ_SkyImage"
    -- 6 faces dari gambar (asset image)
    if preset.isCube then
        -- 6 gambar berbeda per face
        sky.SkyboxBk = preset.bk
        sky.SkyboxDn = preset.dn
        sky.SkyboxFt = preset.ft
        sky.SkyboxLf = preset.lf
        sky.SkyboxRt = preset.rt
        sky.SkyboxUp = preset.up
    else
        -- 1 gambar sama semua face
        local img = preset.img
        sky.SkyboxBk = img
        sky.SkyboxDn = img
        sky.SkyboxFt = img
        sky.SkyboxLf = img
        sky.SkyboxRt = img
        sky.SkyboxUp = img
    end
    sky.Parent = Lighting
    
    if preset.atmos then
        local a = Instance.new("Atmosphere"); a.Name = "ZUTAXZ_Atmosphere"
        a.Density = preset.atmos.Density or 0.35
        a.Offset = preset.atmos.Offset or 0.2
        a.Color = preset.atmos.Color or Color3.fromRGB(200,200,200)
        a.Decay = preset.atmos.Decay or Color3.fromRGB(100,100,100)
        a.Glare = preset.atmos.Glare or 0.5
        a.Haze = preset.atmos.Haze or 2
        a.Parent = Lighting
    end
    
    if preset.cc then
        local cc = getOrCreate("ColorCorrectionEffect", "ZUTAXZ_CC")
        cc.Brightness = preset.cc.Brightness or 0
        cc.Contrast = preset.cc.Contrast or 0
        cc.Saturation = preset.cc.Saturation or 0.15
        cc.TintColor = preset.cc.TintColor or Color3.fromRGB(255,255,255)
    end
    
    local bloom = getOrCreate("BloomEffect", "ZUTAXZ_Bloom")
    bloom.Intensity = preset.bloomIntensity or 1.2
    bloom.Size = preset.bloomSize or 40
    bloom.Threshold = 0.85
    
    local sun = getOrCreate("SunRaysEffect", "ZUTAXZ_SunRays")
    sun.Intensity = preset.sunIntensity or 0.15
    sun.Spread = 0.8
    
    local dof = getOrCreate("DepthOfFieldEffect", "ZUTAXZ_DoF")
    dof.FarIntensity = 0.15
    dof.FocusDistance = 30
    dof.InFocusRadius = 20
    dof.NearIntensity = 0.1
    
    Lighting.ClockTime = preset.clock or 14
    Lighting.Brightness = preset.brightness or 2.5
    if preset.atmos then
        Lighting.Ambient = preset.atmos.Color or Lighting.Ambient
        Lighting.OutdoorAmbient = preset.atmos.Color or Lighting.OutdoorAmbient
    end
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 0.8
    Lighting.EnvironmentSpecularScale = 0.8
    
    Notify("🖼️ "..preset.name, preset.previewColor or Theme.Accent)
end

-- ═══════════ IMAGE SKYBOX PRESETS (dari asset Roblox) ═══════════
-- Menggunakan asset skybox image publik Roblox yang sudah umum dipakai komunitas
local SkyCube = {
    Realistic = {
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454286",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288",
    },
    BlueSky = {
        SkyboxBk = "rbxassetid://5705562711",
        SkyboxDn = "rbxassetid://5705562833",
        SkyboxFt = "rbxassetid://5705562956",
        SkyboxLf = "rbxassetid://5705563089",
        SkyboxRt = "rbxassetid://5705563214",
        SkyboxUp = "rbxassetid://5705563337",
    },
    Galaxy = {
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454286",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288",
    },
    Nebula = {
        SkyboxBk = "rbxassetid://6372755164",
        SkyboxDn = "rbxassetid://6372755331",
        SkyboxFt = "rbxassetid://6372755462",
        SkyboxLf = "rbxassetid://6372755592",
        SkyboxRt = "rbxassetid://6372755721",
        SkyboxUp = "rbxassetid://6372755844",
    },
    Anime = {
        SkyboxBk = "rbxassetid://5087709550",
        SkyboxDn = "rbxassetid://5087709637",
        SkyboxFt = "rbxassetid://5087709721",
        SkyboxLf = "rbxassetid://5087709803",
        SkyboxRt = "rbxassetid://5087709908",
        SkyboxUp = "rbxassetid://5087709990",
    },
    Rainbow = {
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454286",
        SkyboxRt = "rbxassetid://159454300",
        SkyboxUp = "rbxassetid://159454288",
    },
}

-- Preset IMAGE-based (single image atau cube skybox)
local ImagePresets = {
    -- ANIME
    {name="🌸 Anime Sky 1", img="rbxassetid://5087709550", isCube=false,
     previewColor=Color3.fromRGB(255,170,220), clock=15,
     atmos={Density=0.3,Offset=0.2,Color=Color3.fromRGB(255,200,220),Decay=Color3.fromRGB(180,120,160),Glare=0.5,Haze=2.0},
     cc={Brightness=0.1,Contrast=0.15,Saturation=0.35,TintColor=Color3.fromRGB(255,220,235)}},
    {name="✨ Anime Sky 2", img="rbxassetid://5087709637", isCube=false,
     previewColor=Color3.fromRGB(140,200,255), clock=14,
     atmos={Density=0.28,Offset=0.2,Color=Color3.fromRGB(160,210,255),Decay=Color3.fromRGB(100,150,220),Glare=0.5,Haze=2.0},
     cc={Brightness=0.1,Contrast=0.15,Saturation=0.35,TintColor=Color3.fromRGB(200,230,255)}},
    {name="🌅 Anime Sunset", img="rbxassetid://5087709721", isCube=false,
     previewColor=Color3.fromRGB(255,150,180), clock=17.5,
     atmos={Density=0.32,Offset=0.18,Color=Color3.fromRGB(255,160,200),Decay=Color3.fromRGB(200,100,140),Glare=0.6,Haze=2.2},
     cc={Brightness=0.08,Contrast=0.2,Saturation=0.4,TintColor=Color3.fromRGB(255,200,230)}},
    {name="🌙 Anime Night", img="rbxassetid://5087709803", isCube=false,
     previewColor=Color3.fromRGB(80,100,180), clock=23,
     atmos={Density=0.4,Offset=0.1,Color=Color3.fromRGB(60,80,180),Decay=Color3.fromRGB(20,30,80),Glare=0.8,Haze=1.5},
     cc={Brightness=-0.05,Contrast=0.2,Saturation=0.3,TintColor=Color3.fromRGB(180,200,255)}},
    {name="🌸 Sakura Scene", img="rbxassetid://5087709908", isCube=false,
     previewColor=Color3.fromRGB(255,180,220), clock=15,
     atmos={Density=0.32,Offset=0.2,Color=Color3.fromRGB(255,200,220),Decay=Color3.fromRGB(180,120,150),Glare=0.5,Haze=2.0},
     cc={Brightness=0.08,Contrast=0.15,Saturation=0.4,TintColor=Color3.fromRGB(255,220,240)}},
    {name="💜 Anime Twilight", img="rbxassetid://5087709990", isCube=false,
     previewColor=Color3.fromRGB(200,140,255), clock=19,
     atmos={Density=0.35,Offset=0.18,Color=Color3.fromRGB(180,140,220),Decay=Color3.fromRGB(100,60,160),Glare=0.7,Haze=2.0},
     cc={Brightness=0.05,Contrast=0.2,Saturation=0.4,TintColor=Color3.fromRGB(220,180,255)}},

    -- GALAXY
    {name="🌌 Realistic Galaxy", isCube=true, bk=SkyCube.Galaxy.SkyboxBk, dn=SkyCube.Galaxy.SkyboxDn,
     ft=SkyCube.Galaxy.SkyboxFt, lf=SkyCube.Galaxy.SkyboxLf, rt=SkyCube.Galaxy.SkyboxRt, up=SkyCube.Galaxy.SkyboxUp,
     previewColor=Color3.fromRGB(120,60,200), clock=23,
     atmos={Density=0.55,Offset=0.05,Color=Color3.fromRGB(120,60,200),Decay=Color3.fromRGB(30,10,60),Glare=1.0,Haze=1.0},
     cc={Brightness=-0.1,Contrast=0.35,Saturation=0.4,TintColor=Color3.fromRGB(180,140,255)}},
    {name="✨ Nebula HD", isCube=true, bk=SkyCube.Nebula.SkyboxBk, dn=SkyCube.Nebula.SkyboxDn,
     ft=SkyCube.Nebula.SkyboxFt, lf=SkyCube.Nebula.SkyboxLf, rt=SkyCube.Nebula.SkyboxRt, up=SkyCube.Nebula.SkyboxUp,
     previewColor=Color3.fromRGB(200,100,255), clock=23,
     atmos={Density=0.5,Offset=0.1,Color=Color3.fromRGB(200,100,255),Decay=Color3.fromRGB(80,40,160),Glare=0.9,Haze=1.2},
     cc={Brightness=-0.1,Contrast=0.3,Saturation=0.4,TintColor=Color3.fromRGB(220,180,255)}},
    {name="⭐ Starfield HD", img="rbxassetid://6372755164", isCube=false,
     previewColor=Color3.fromRGB(100,100,180), clock=0,
     atmos={Density=0.55,Offset=0.05,Color=Color3.fromRGB(100,100,180),Decay=Color3.fromRGB(30,30,80),Glare=0.8,Haze=1.0},
     cc={Brightness=-0.15,Contrast=0.25,Saturation=0.25,TintColor=Color3.fromRGB(180,180,255)}},
    {name="🌠 Cosmic Purple", img="rbxassetid://6372755331", isCube=false,
     previewColor=Color3.fromRGB(180,100,255), clock=22,
     atmos={Density=0.5,Offset=0.08,Color=Color3.fromRGB(180,100,255),Decay=Color3.fromRGB(60,20,120),Glare=0.9,Haze=1.2},
     cc={Brightness=-0.08,Contrast=0.35,Saturation=0.45,TintColor=Color3.fromRGB(220,170,255)}},
    {name="🚀 Deep Space", img="rbxassetid://6372755462", isCube=false,
     previewColor=Color3.fromRGB(60,60,120), clock=0,
     atmos={Density=0.6,Offset=0.05,Color=Color3.fromRGB(60,60,120),Decay=Color3.fromRGB(20,20,50),Glare=0.7,Haze=1.0},
     cc={Brightness=-0.2,Contrast=0.3,Saturation=0.3,TintColor=Color3.fromRGB(160,160,220)}},

    -- RAINBOW
    {name="🌈 Rainbow Real", img="rbxassetid://159454299", isCube=false,
     previewColor=Color3.fromRGB(255,150,220), clock=12,
     atmos={Density=0.3,Offset=0.25,Color=Color3.fromRGB(255,150,220),Decay=Color3.fromRGB(120,80,200),Glare=0.6,Haze=2.5},
     cc={Brightness=0.1,Contrast=0.25,Saturation=0.5,TintColor=Color3.fromRGB(255,200,240)}},
    {name="🌸 Pink Dream", img="rbxassetid://5705562711", isCube=false,
     previewColor=Color3.fromRGB(255,180,220), clock=15,
     atmos={Density=0.3,Offset=0.22,Color=Color3.fromRGB(255,200,230),Decay=Color3.fromRGB(200,120,170),Glare=0.5,Haze=2.2},
     cc={Brightness=0.1,Contrast=0.15,Saturation=0.35,TintColor=Color3.fromRGB(255,220,240)}},
    {name="💜 Purple Dream", img="rbxassetid://5705562833", isCube=false,
     previewColor=Color3.fromRGB(180,120,255), clock=18,
     atmos={Density=0.32,Offset=0.2,Color=Color3.fromRGB(200,150,255),Decay=Color3.fromRGB(120,80,200),Glare=0.6,Haze=2.0},
     cc={Brightness=0.08,Contrast=0.18,Saturation=0.4,TintColor=Color3.fromRGB(220,190,255)}},
    {name="💗 Synthwave Pink", img="rbxassetid://5705562956", isCube=false,
     previewColor=Color3.fromRGB(255,80,180), clock=21,
     atmos={Density=0.4,Offset=0.15,Color=Color3.fromRGB(255,80,180),Decay=Color3.fromRGB(120,20,120),Glare=0.8,Haze=1.8},
     cc={Brightness=-0.05,Contrast=0.3,Saturation=0.5,TintColor=Color3.fromRGB(255,140,220)}},
    {name="🌅 Sunset Gradient", img="rbxassetid://5705563089", isCube=false,
     previewColor=Color3.fromRGB(255,140,100), clock=17.5,
     atmos={Density=0.35,Offset=0.18,Color=Color3.fromRGB(255,180,120),Decay=Color3.fromRGB(180,80,60),Glare=0.5,Haze=2.2},
     cc={Brightness=0.08,Contrast=0.15,Saturation=0.3,TintColor=Color3.fromRGB(255,220,200)}},

    -- FANTASY
    {name="🔮 Mystical Realm", img="rbxassetid://5705563214", isCube=false,
     previewColor=Color3.fromRGB(180,110,255), clock=21,
     atmos={Density=0.4,Offset=0.15,Color=Color3.fromRGB(180,110,255),Decay=Color3.fromRGB(100,50,180),Glare=0.8,Haze=1.8},
     cc={Brightness=-0.05,Contrast=0.25,Saturation=0.4,TintColor=Color3.fromRGB(220,180,255)}},
    {name="💎 Crystal Realm", img="rbxassetid://5705563337", isCube=false,
     previewColor=Color3.fromRGB(100,220,255), clock=20,
     atmos={Density=0.4,Offset=0.2,Color=Color3.fromRGB(140,220,255),Decay=Color3.fromRGB(80,140,200),Glare=0.7,Haze=1.8},
     cc={Brightness=0.05,Contrast=0.25,Saturation=0.35,TintColor=Color3.fromRGB(200,240,255)}},
    {name="🌌 Aurora Dream", img="rbxassetid://6031075935", isCube=false,
     previewColor=Color3.fromRGB(100,255,200), clock=22,
     atmos={Density=0.4,Offset=0.15,Color=Color3.fromRGB(100,255,200),Decay=Color3.fromRGB(40,120,150),Glare=0.8,Haze=1.5},
     cc={Brightness=-0.05,Contrast=0.3,Saturation=0.45,TintColor=Color3.fromRGB(180,255,220)}},
    {name="🌠 Meteor Shower", img="rbxassetid://6031075951", isCube=false,
     previewColor=Color3.fromRGB(255,180,100), clock=22,
     atmos={Density=0.45,Offset=0.15,Color=Color3.fromRGB(180,140,255),Decay=Color3.fromRGB(80,60,140),Glare=0.8,Haze=1.5},
     cc={Brightness=-0.05,Contrast=0.3,Saturation=0.35,TintColor=Color3.fromRGB(255,220,200)}},

    -- CINEMATIC
    {name="🎬 Realistic Sky", isCube=true, bk=SkyCube.Realistic.SkyboxBk, dn=SkyCube.Realistic.SkyboxDn,
     ft=SkyCube.Realistic.SkyboxFt, lf=SkyCube.Realistic.SkyboxLf, rt=SkyCube.Realistic.SkyboxRt, up=SkyCube.Realistic.SkyboxUp,
     previewColor=Color3.fromRGB(120,180,255), clock=13,
     atmos={Density=0.3,Offset=0.2,Color=Color3.fromRGB(180,210,240),Decay=Color3.fromRGB(120,150,200),Glare=0.5,Haze=2.2},
     cc={Brightness=0.08,Contrast=0.12,Saturation=0.2,TintColor=Color3.fromRGB(220,230,255)}},
    {name="🎬 Blue Sky HD", isCube=true, bk=SkyCube.BlueSky.SkyboxBk, dn=SkyCube.BlueSky.SkyboxDn,
     ft=SkyCube.BlueSky.SkyboxFt, lf=SkyCube.BlueSky.SkyboxLf, rt=SkyCube.BlueSky.SkyboxRt, up=SkyCube.BlueSky.SkyboxUp,
     previewColor=Color3.fromRGB(100,180,255), clock=12,
     atmos={Density=0.28,Offset=0.22,Color=Color3.fromRGB(160,210,255),Decay=Color3.fromRGB(100,150,220),Glare=0.5,Haze=2.0},
     cc={Brightness=0.1,Contrast=0.15,Saturation=0.25,TintColor=Color3.fromRGB(200,230,255)}},
    {name="🎬 Golden Hour", img="rbxassetid://6031091004", isCube=false,
     previewColor=Color3.fromRGB(255,200,120), clock=18,
     atmos={Density=0.35,Offset=0.18,Color=Color3.fromRGB(255,220,150),Decay=Color3.fromRGB(160,100,70),Glare=0.5,Haze=2.0},
     cc={Brightness=0.1,Contrast=0.18,Saturation=0.3,TintColor=Color3.fromRGB(255,230,180)}},
    {name="🎬 Cinematic Blue", img="rbxassetid://6031075951", isCube=false,
     previewColor=Color3.fromRGB(60,120,220), clock=13,
     atmos={Density=0.32,Offset=0.2,Color=Color3.fromRGB(120,170,240),Decay=Color3.fromRGB(60,100,180),Glare=0.5,Haze=2.2},
     cc={Brightness=0.05,Contrast=0.2,Saturation=0.25,TintColor=Color3.fromRGB(180,210,255)}},

    -- HORROR
    {name="👻 Horror Fog", img="rbxassetid://6031068432", isCube=false,
     previewColor=Color3.fromRGB(120,20,20), clock=0,
     atmos={Density=0.7,Offset=0.1,Color=Color3.fromRGB(80,20,20),Decay=Color3.fromRGB(40,10,10),Glare=0.3,Haze=4.0},
     cc={Brightness=-0.25,Contrast=0.4,Saturation=-0.3,TintColor=Color3.fromRGB(180,80,80)}},
    {name="💀 Blood Moon", img="rbxassetid://6031094668", isCube=false,
     previewColor=Color3.fromRGB(255,60,60), clock=1,
     atmos={Density=0.55,Offset=0.1,Color=Color3.fromRGB(255,60,60),Decay=Color3.fromRGB(100,20,20),Glare=0.7,Haze=2.5},
     cc={Brightness=-0.2,Contrast=0.35,Saturation=0.2,TintColor=Color3.fromRGB(255,140,140)}},
    {name="🌑 Void Black", img="rbxassetid://6031094687", isCube=false,
     previewColor=Color3.fromRGB(20,20,30), clock=0,
     atmos={Density=0.8,Offset=0.05,Color=Color3.fromRGB(20,20,30),Decay=Color3.fromRGB(10,10,20),Glare=0.1,Haze=5.0},
     cc={Brightness=-0.4,Contrast=0.4,Saturation=-0.4,TintColor=Color3.fromRGB(80,80,120)}},

    -- NATURE
    {name="🌿 Forest Scene", img="rbxassetid://6031094687", isCube=false,
     previewColor=Color3.fromRGB(100,180,120), clock=11,
     atmos={Density=0.35,Offset=0.22,Color=Color3.fromRGB(140,200,160),Decay=Color3.fromRGB(80,140,100),Glare=0.4,Haze=2.5},
     cc={Brightness=0.08,Contrast=0.12,Saturation=0.25,TintColor=Color3.fromRGB(200,240,210)}},
    {name="🏜️ Desert Scene", img="rbxassetid://6034684933", isCube=false,
     previewColor=Color3.fromRGB(255,200,140), clock=14,
     atmos={Density=0.4,Offset=0.15,Color=Color3.fromRGB(255,220,160),Decay=Color3.fromRGB(200,150,80),Glare=0.5,Haze=3.0},
     cc={Brightness=0.1,Contrast=0.15,Saturation=0.15,TintColor=Color3.fromRGB(255,230,190)}},
    {name="❄️ Winter Scene", img="rbxassetid://6031068432", isCube=false,
     previewColor=Color3.fromRGB(200,230,255), clock=10,
     atmos={Density=0.5,Offset=0.15,Color=Color3.fromRGB(180,220,255),Decay=Color3.fromRGB(150,180,220),Glare=0.6,Haze=3.0},
     cc={Brightness=0.08,Contrast=0.1,Saturation=-0.05,TintColor=Color3.fromRGB(200,230,255)}},
}

-- ═══════════ SKY CARD (with image preview) ═══════════
local function mkImageCard(parent, x, y, preset, cb)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.32, 0, 0, 110)
    btn.Position = UDim2.new(x, 0, 0, y)
    btn.BackgroundColor3 = Theme.Row
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = parent
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 10); bc.Parent = btn
    local stroke = Instance.new("UIStroke"); stroke.Color = preset.previewColor or Theme.Accent; stroke.Thickness = 1; stroke.Transparency = 0.6; stroke.Parent = btn
    
    -- IMAGE PREVIEW
    local imgPrev = Instance.new("ImageLabel")
    imgPrev.Size = UDim2.new(1, -12, 0, 60)
    imgPrev.Position = UDim2.new(0, 6, 0, 6)
    imgPrev.BackgroundColor3 = preset.previewColor or Theme.Accent
    imgPrev.BorderSizePixel = 0
    imgPrev.Image = preset.img or preset.bk or preset.previewColor and ""
    imgPrev.ScaleType = Enum.ScaleType.Crop
    imgPrev.Parent = btn
    local ic = Instance.new("UICorner"); ic.CornerRadius = UDim.new(0, 6); ic.Parent = imgPrev
    
    -- Fallback color overlay kalau tidak ada image
    if not preset.img and not preset.bk then
        imgPrev.ImageTransparency = 1
    else
        imgPrev.ImageColor3 = Color3.fromRGB(255,255,255)
    end
    
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -12, 0, 34)
    lbl.Position = UDim2.new(0, 6, 0, 70)
    lbl.BackgroundTransparency = 1
    lbl.Text = preset.name
    lbl.TextColor3 = Theme.Text
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextWrapped = true
    lbl.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Theme.RowHi}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency = 0}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Theme.Row}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency = 0.6}):Play()
    end)
    btn.MouseButton1Click:Connect(function() cb(preset) end)
    return btn
end

-- ═══════════ BUILD PAGES ═══════════

-- Anime (6)
local pAnime = mkPage("Anime")
mkSection(pAnime, 8, "✨  ANIME  —  Image Skybox")
for i=1,6 do
    local p = ImagePresets[i]
    if p then
        local row = math.floor((i-1)/3); local col = (i-1)%3
        mkImageCard(pAnime, col*0.335, 30+row*118, p, applyImageSky)
    end
end

-- Galaxy (5)
local pGal = mkPage("Galaxy")
mkSection(pGal, 8, "🌌  GALAXY  —  Image Skybox")
for i=1,5 do
    local p = ImagePresets[6+i]
    if p then
        local row = math.floor((i-1)/3); local col = (i-1)%3
        mkImageCard(pGal, col*0.335, 30+row*118, p, applyImageSky)
    end
end

-- Rainbow (5)
local pRb = mkPage("Rainbow")
mkSection(pRb, 8, "🌈  RAINBOW  —  Image Skybox")
for i=1,5 do
    local p = ImagePresets[11+i]
    if p then
        local row = math.floor((i-1)/3); local col = (i-1)%3
        mkImageCard(pRb, col*0.335, 30+row*118, p, applyImageSky)
    end
end

-- Fantasy (4)
local pFan = mkPage("Fantasy")
mkSection(pFan, 8, "🔮  FANTASY  —  Image Skybox")
for i=1,4 do
    local p = ImagePresets[16+i]
    if p then
        local row = math.floor((i-1)/3); local col = (i-1)%3
        mkImageCard(pFan, col*0.335, 30+row*118, p, applyImageSky)
    end
end

-- Cinematic (4)
local pCin = mkPage("Cinematic")
mkSection(pCin, 8, "🎬  CINEMATIC  —  Image Skybox")
for i=1,4 do
    local p = ImagePresets[20+i]
    if p then
        local row = math.floor((i-1)/3); local col = (i-1)%3
        mkImageCard(pCin, col*0.335, 30+row*118, p, applyImageSky)
    end
end

-- Horror (3)
local pHor = mkPage("Horror")
mkSection(pHor, 8, "👻  HORROR  —  Image Skybox")
for i=1,3 do
    local p = ImagePresets[24+i]
    if p then
        mkImageCard(pHor, (i-1)*0.335, 30, p, applyImageSky)
    end
end

-- Nature (3)
local pNat = mkPage("Nature")
mkSection(pNat, 8, "🌿  NATURE  —  Image Skybox")
for i=1,3 do
    local p = ImagePresets[27+i]
    if p then
        mkImageCard(pNat, (i-1)*0.335, 30, p, applyImageSky)
    end
end

-- Custom (input Image ID sendiri)
local pCus = mkPage("Custom")
mkSection(pCus, 8, "🎨  CUSTOM SKYBOX IMAGE ID")

local infoBox = Instance.new("TextLabel")
infoBox.Size = UDim2.new(1, -24, 0, 70)
infoBox.Position = UDim2.new(0, 12, 0, 32)
infoBox.BackgroundColor3 = Theme.Row
infoBox.BorderSizePixel = 0
infoBox.Text = "Masukkan Roblox Image Asset ID untuk skybox.\nContoh: 6031075935\nFormat: rbxassetid://ANGKA"
infoBox.TextColor3 = Theme.Muted
infoBox.Font = Enum.Font.Gotham
infoBox.TextSize = 11
infoBox.TextWrapped = true
infoBox.TextXAlignment = Enum.TextXAlignment.Left
infoBox.Parent = pCus
local ibc = Instance.new("UICorner"); ibc.CornerRadius = UDim.new(0, 8); ibc.Parent = infoBox

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -24, 0, 42)
inputBox.Position = UDim2.new(0, 12, 0, 112)
inputBox.BackgroundColor3 = Theme.Row
inputBox.BorderSizePixel = 0
inputBox.PlaceholderText = "rbxassetid://6031075935"
inputBox.PlaceholderColor3 = Theme.Muted
inputBox.Text = ""
inputBox.TextColor3 = Theme.Text
inputBox.Font = Enum.Font.GothamBold
inputBox.TextSize = 12
inputBox.ClearTextOnFocus = false
inputBox.Parent = pCus
local ibc2 = Instance.new("UICorner"); ibc2.CornerRadius = UDim.new(0, 8); ibc2.Parent = inputBox
local ibs = Instance.new("UIStroke"); ibs.Color = Theme.Accent; ibs.Thickness = 1; ibs.Transparency = 0.5; ibs.Parent = inputBox

local applyBtn = Instance.new("TextButton")
applyBtn.Size = UDim2.new(1, -24, 0, 42)
applyBtn.Position = UDim2.new(0, 12, 0, 164)
applyBtn.BackgroundColor3 = Theme.Accent
applyBtn.Text = "🖼️  APPLY CUSTOM IMAGE SKYBOX"
applyBtn.TextColor3 = Color3.fromRGB(255,255,255)
applyBtn.Font = Enum.Font.GothamBold
applyBtn.TextSize = 12
applyBtn.BorderSizePixel = 0
applyBtn.AutoButtonColor = false
applyBtn.Parent = pCus
local abc2 = Instance.new("UICorner"); abc2.CornerRadius = UDim.new(0, 10); abc2.Parent = applyBtn
applyBtn.MouseButton1Click:Connect(function()
    local imgId = inputBox.Text
    if imgId == "" then Notify("Masukkan Image ID", Theme.Danger); return end
    local img = imgId:find("rbxassetid://") and imgId or ("rbxassetid://"..imgId:gsub("%D", ""))
    applyImageSky({name="Custom Image", img=img, isCube=false,
        previewColor=Color3.fromRGB(140,180,255), clock=14,
        atmos={Density=0.3,Offset=0.2,Color=Color3.fromRGB(200,200,220),Decay=Color3.fromRGB(120,120,140),Glare=0.5,Haze=2},
        cc={Brightness=0.08,Contrast=0.15,Saturation=0.2,TintColor=Color3.fromRGB(240,240,255)}})
end)

-- Reset page
local pRes = mkPage("Reset")
mkSection(pRes, 8, "🔄  RESET")

local resetAll = Instance.new("TextButton")
resetAll.Size = UDim2.new(1, -24, 0, 50)
resetAll.Position = UDim2.new(0, 12, 0, 40)
resetAll.BackgroundColor3 = Theme.Danger
resetAll.Text = "🔄  RESET TO ORIGINAL SKY"
resetAll.TextColor3 = Color3.fromRGB(255,255,255)
resetAll.Font = Enum.Font.GothamBold
resetAll.TextSize = 13
resetAll.BorderSizePixel = 0
resetAll.AutoButtonColor = false
resetAll.Parent = pRes
local rac = Instance.new("UICorner"); rac.CornerRadius = UDim.new(0, 10); rac.Parent = resetAll
resetAll.MouseButton1Click:Connect(function()
    for _, v in pairs(Lighting:GetChildren()) do
        if v.Name:find("ZUTAXZ") then v:Destroy() end
    end
    if backup.Sky then backup.Sky.Parent = Lighting end
    if backup.Atmosphere then backup.Atmosphere.Parent = Lighting end
    if backup.Bloom then backup.Bloom.Parent = Lighting end
    if backup.CC then backup.CC.Parent = Lighting end
    if backup.SunRays then backup.SunRays.Parent = Lighting end
    if backup.DoF then backup.DoF.Parent = Lighting end
    Lighting.Brightness = backup.Brightness
    Lighting.ClockTime = backup.ClockTime
    Lighting.Ambient = backup.Ambient
    Lighting.OutdoorAmbient = backup.OutdoorAmbient
    Lighting.FogEnd = backup.FogEnd
    Lighting.FogStart = backup.FogStart
    Lighting.FogColor = backup.FogColor
    Lighting.GlobalShadows = backup.GlobalShadows
    Notify("✅ Restored original sky", Theme.Success)
end)

-- Default page
setPage("Anime")

-- AUTO APPLY DEFAULT
task.spawn(function()
    task.wait(1)
    applyImageSky(ImagePresets[1])
    task.wait(0.3)
    Notify("🖼️ Sky IMAGE ULTRA v3.0 loaded", Theme.Accent)
    task.wait(0.4)
    Notify("30+ Image Skybox ready", Theme.Accent2)
end)

print("[ZUTAXZ Sky IMAGE ULTRA v3.0] Loaded — 30+ image skybox.")

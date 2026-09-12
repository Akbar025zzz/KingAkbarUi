--[[
    ╔═══════════════════════════════════════════════════════════╗
    ║   KingAkbarUI  ·  v1.0.0                                  ║
    ║   Premium Roblox UI Library                               ║
    ║   Author  : King Akbar                                    ║
    ║   License : MIT                                           ║
    ╚═══════════════════════════════════════════════════════════╝

    Quick start:
        local King = loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/main/KingAkbarUI.lua"))()
        local UI   = King({ Theme = "Royal" })
        local Win  = UI:CreateWindow({ Title = "King Panel" })
        local Tab  = Win:Tab({ Name = "Main", Icon = "◆" })
        Tab:Button({ Name = "Click Me", Callback = function() print("hi") end })
]]

--====================================================================
-- // SERVICES
--====================================================================
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local HttpService      = game:GetService("HttpService")
local TextService      = game:GetService("TextService")
local LocalPlayer      = Players.LocalPlayer

--====================================================================
-- // 1. CONFIG
--====================================================================
local Config = {
    Version = "1.0.0",
    Prefix  = "KingAkbarUI_",

    Fonts = {
        Regular = Enum.Font.Gotham,
        Medium  = Enum.Font.GothamMedium,
        Bold    = Enum.Font.GothamBold,
        Black   = Enum.Font.GothamBlack,
        Mono    = Enum.Font.Code,
    },

    TextSize = { Title = 16, Subtitle = 12, Body = 13, Small = 11, Tiny = 10 },

    Spacing = { XS = 4, S = 6, M = 10, L = 14, XL = 20 },

    Radius = { S = 4, M = 8, L = 12, XL = 16, Pill = 999 },

    Animation = {
        Fast   = TweenInfo.new(0.12, Enum.EasingStyle.Quad,   Enum.EasingDirection.Out),
        Normal = TweenInfo.new(0.22, Enum.EasingStyle.Quart,  Enum.EasingDirection.Out),
        Slow   = TweenInfo.new(0.38, Enum.EasingStyle.Quart,  Enum.EasingDirection.Out),
        Spring = TweenInfo.new(0.48, Enum.EasingStyle.Back,   Enum.EasingDirection.Out),
        Bounce = TweenInfo.new(0.55, Enum.EasingStyle.Elastic,Enum.EasingDirection.Out),
    },

    Defaults = {
        WindowSize    = Vector2.new(580, 420),
        MinSize       = Vector2.new(400, 300),
        MaxSize       = Vector2.new(1500, 950),
        NotifWidth    = 320,
        NotifDuration = 4,
    },

    Performance = {
        TooltipDelay     = 0.35,
        MaxNotifications = 5,
        EnableShadows    = true,
    },
}

--====================================================================
-- // 2. THEME
--====================================================================
local Theme = {}
Theme.__index = Theme

Theme.Palettes = {
    Royal = {
        Background   = Color3.fromRGB(18, 20, 32),
        Surface      = Color3.fromRGB(26, 29, 46),
        SurfaceAlt   = Color3.fromRGB(34, 38, 60),
        SurfaceHover = Color3.fromRGB(44, 49, 78),
        Border       = Color3.fromRGB(60, 66, 100),
        Text         = Color3.fromRGB(245, 246, 250),
        TextMuted    = Color3.fromRGB(155, 162, 190),
        Accent       = Color3.fromRGB(220, 180, 90),
        AccentHover  = Color3.fromRGB(240, 200, 110),
        AccentPress  = Color3.fromRGB(190, 150, 70),
        AccentAlt    = Color3.fromRGB(120, 90, 220),
        Success      = Color3.fromRGB(74, 201, 133),
        Warning      = Color3.fromRGB(240, 180, 70),
        Error        = Color3.fromRGB(240, 96, 96),
        Shadow       = Color3.fromRGB(0, 0, 0),
        Glow         = Color3.fromRGB(220, 180, 90),
    },
    Dark = {
        Background   = Color3.fromRGB(22, 23, 28),
        Surface      = Color3.fromRGB(30, 32, 38),
        SurfaceAlt   = Color3.fromRGB(38, 41, 48),
        SurfaceHover = Color3.fromRGB(46, 49, 58),
        Border       = Color3.fromRGB(52, 56, 66),
        Text         = Color3.fromRGB(238, 240, 245),
        TextMuted    = Color3.fromRGB(150, 155, 168),
        Accent       = Color3.fromRGB(99, 132, 255),
        AccentHover  = Color3.fromRGB(122, 152, 255),
        AccentPress  = Color3.fromRGB(78, 108, 230),
        AccentAlt    = Color3.fromRGB(168, 100, 255),
        Success      = Color3.fromRGB(74, 201, 133),
        Warning      = Color3.fromRGB(240, 180, 70),
        Error        = Color3.fromRGB(240, 96, 96),
        Shadow       = Color3.fromRGB(0, 0, 0),
        Glow         = Color3.fromRGB(99, 132, 255),
    },
    Light = {
        Background   = Color3.fromRGB(247, 248, 251),
        Surface      = Color3.fromRGB(255, 255, 255),
        SurfaceAlt   = Color3.fromRGB(240, 242, 247),
        SurfaceHover = Color3.fromRGB(230, 233, 240),
        Border       = Color3.fromRGB(214, 218, 228),
        Text         = Color3.fromRGB(24, 27, 34),
        TextMuted    = Color3.fromRGB(108, 114, 128),
        Accent       = Color3.fromRGB(72, 104, 240),
        AccentHover  = Color3.fromRGB(94, 124, 250),
        AccentPress  = Color3.fromRGB(56, 86, 210),
        AccentAlt    = Color3.fromRGB(140, 80, 220),
        Success      = Color3.fromRGB(40, 175, 106),
        Warning      = Color3.fromRGB(214, 148, 40),
        Error        = Color3.fromRGB(214, 70, 70),
        Shadow       = Color3.fromRGB(80, 90, 110),
        Glow         = Color3.fromRGB(72, 104, 240),
    },
    Midnight = {
        Background   = Color3.fromRGB(10, 8, 22),
        Surface      = Color3.fromRGB(20, 16, 42),
        SurfaceAlt   = Color3.fromRGB(28, 22, 56),
        SurfaceHover = Color3.fromRGB(40, 32, 76),
        Border       = Color3.fromRGB(58, 48, 100),
        Text         = Color3.fromRGB(242, 240, 255),
        TextMuted    = Color3.fromRGB(160, 150, 210),
        Accent       = Color3.fromRGB(168, 100, 255),
        AccentHover  = Color3.fromRGB(190, 130, 255),
        AccentPress  = Color3.fromRGB(140, 80, 220),
        AccentAlt    = Color3.fromRGB(255, 100, 200),
        Success      = Color3.fromRGB(90, 220, 160),
        Warning      = Color3.fromRGB(255, 190, 90),
        Error        = Color3.fromRGB(255, 110, 130),
        Shadow       = Color3.fromRGB(0, 0, 0),
        Glow         = Color3.fromRGB(168, 100, 255),
    },
}

function Theme.new(mode)
    local self = setmetatable({}, Theme)
    self.Mode     = mode or "Royal"
    self.Palette  = {}
    self._signals = {}
    for k, v in pairs(Theme.Palettes[self.Mode]) do self.Palette[k] = v end
    return self
end

function Theme:Get(key) return self.Palette[key] or Color3.new(1, 1, 1) end

function Theme:Set(key, value)
    self.Palette[key] = value
    self:_emit()
end

function Theme:SetMode(mode)
    if not Theme.Palettes[mode] then return end
    self.Mode = mode
    for k, v in pairs(Theme.Palettes[mode]) do self.Palette[k] = v end
    self:_emit()
end

function Theme:ToggleMode()
    local order = { "Royal", "Dark", "Light", "Midnight" }
    local idx = 1
    for i, m in ipairs(order) do if m == self.Mode then idx = i; break end end
    self:SetMode(order[(idx % #order) + 1])
end

function Theme:OnChanged(fn)
    table.insert(self._signals, fn)
    return function()
        for i, f in ipairs(self._signals) do
            if f == fn then table.remove(self._signals, i); break end
        end
    end
end

function Theme:_emit()
    for _, fn in ipairs(self._signals) do task.spawn(fn, self) end
end

--====================================================================
-- // 3. UTIL
--====================================================================
local Util = {}

function Util.create(class, props, children)
    local inst = Instance.new(class)
    if props then
        for k, v in pairs(props) do
            if k ~= "Parent" then inst[k] = v end
        end
    end
    if props and props.Parent then inst.Parent = props.Parent end
    if children then
        for _, c in ipairs(children) do c.Parent = inst end
    end
    return inst
end

function Util.corner(parent, radius)
    return Util.create("UICorner", { CornerRadius = UDim.new(0, radius or 8), Parent = parent })
end

function Util.stroke(parent, color, thickness, transparency)
    return Util.create("UIStroke", {
        Color = color or Color3.new(1, 1, 1),
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = parent,
    })
end

function Util.padding(parent, t, r, b, l)
    r = r or t; b = b or t; l = l or r
    return Util.create("UIPadding", {
        PaddingTop    = UDim.new(0, t),
        PaddingRight  = UDim.new(0, r),
        PaddingBottom = UDim.new(0, b),
        PaddingLeft   = UDim.new(0, l),
        Parent = parent,
    })
end

function Util.list(parent, direction, gap, hAlign, vAlign)
    return Util.create("UIListLayout", {
        FillDirection = direction or Enum.FillDirection.Vertical,
        Padding = UDim.new(0, gap or 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = hAlign or Enum.HorizontalAlignment.Left,
        VerticalAlignment   = vAlign or Enum.VerticalAlignment.Top,
        Parent = parent,
    })
end

function Util.tween(inst, info, goal)
    local t = TweenService:Create(inst, info, goal)
    t:Play()
    return t
end

function Util.clamp(v, a, b) return math.max(a, math.min(b, v)) end
function Util.round(n, d) local m = 10 ^ (d or 0); return math.floor(n * m + 0.5) / m end
function Util.guid() return HttpService:GenerateGUID(false) end

function Util.disconnectAll(conns)
    for _, c in ipairs(conns) do
        if c and typeof(c) == "RBXScriptConnection" then
            pcall(function() c:Disconnect() end)
        elseif type(c) == "function" then
            pcall(c)
        end
    end
    table.clear(conns)
end

--====================================================================
-- // 4. SIGNAL
--====================================================================
local Signal = {}
Signal.__index = Signal

function Signal.new() return setmetatable({ _h = {} }, Signal) end

function Signal:Connect(fn)
    local conn = { Connected = true, _fn = fn, _self = self }
    table.insert(self._h, conn)
    function conn:Disconnect()
        if not self.Connected then return end
        self.Connected = false
        for i, c in ipairs(self._self._h) do
            if c == self then table.remove(self._self._h, i); break end
        end
    end
    return conn
end

function Signal:Fire(...)
    for _, c in ipairs(self._h) do
        if c.Connected then task.spawn(c._fn, ...) end
    end
end

function Signal:Destroy()
    for _, c in ipairs(self._h) do c.Connected = false end
    table.clear(self._h)
end

--====================================================================
-- // 5. ANIMATION HELPERS
--====================================================================
local Anims = {}

function Anims.ripple(parent, x, y, color)
    local r = Util.create("Frame", {
        BackgroundColor3 = color or Color3.new(1, 1, 1),
        BackgroundTransparency = 0.82,
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(0, 0),
        Position = UDim2.fromOffset(x, y),
        AnchorPoint = Vector2.new(0.5, 0.5),
        ZIndex = 5,
        Parent = parent,
    })
    Util.corner(r, Config.Radius.Pill)
    local diag = math.sqrt(parent.AbsoluteSize.X ^ 2 + parent.AbsoluteSize.Y ^ 2) * 2.2
    Util.tween(r, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.fromOffset(diag, diag),
        BackgroundTransparency = 1,
    })
    task.delay(0.65, function() if r and r.Parent then r:Destroy() end end)
end

--====================================================================
-- // 6. SAFE CALL WRAPPER
--====================================================================
local function safeCall(fn, ...)
    if type(fn) ~= "function" then return end
    local ok, err = pcall(fn, ...)
    if not ok then warn("[KingAkbarUI] Callback error: " .. tostring(err)) end
end

--====================================================================
-- // 7. COMPONENT BASE
--====================================================================
local Component = {}
Component.__index = Component

function Component:Destroy()
    if self._inst then self._inst:Destroy() end
end

--====================================================================
-- // 8. KING ROOT
--====================================================================
local King = {}
King.__index = King

King.Config  = Config
King.Theme   = Theme
King.Signal  = Signal
King.Util    = Util
King.Version = Config.Version

function King.new(opts)
    opts = opts or {}
    local self = setmetatable({}, King)
    self.Theme         = Theme.new(opts.Theme or "Royal")
    self.Windows       = {}
    self.Notifications = {}
    self._tooltipParent = nil
    return self
end

--====================================================================
-- // 9. WINDOW
--====================================================================
local Window = {}
Window.__index = Window

function King:CreateWindow(opts)
    opts = opts or {}
    local parent = opts.Parent
    if not parent then
        local ok, cg = pcall(function() return game:GetService("CoreGui") end)
        parent = ok and cg or LocalPlayer:WaitForChild("PlayerGui")
    end

    local win = setmetatable({}, Window)
    win.King      = self
    win.UI        = self
    win.Parent    = parent
    win.ThemeRef  = self.Theme
    win.Theme     = self.Theme
    win.Tabs      = {}
    win.Conn      = {}
    win.Minimized = false
    win:_build(opts)
    win:_bindTheme()
    table.insert(self.Windows, win)
    return win
end

function Window:_build(opts)
    local t = self.ThemeRef
    local size = opts.Size or Config.Defaults.WindowSize

    self.ScreenGui = Util.create("ScreenGui", {
        Name = Config.Prefix .. "Screen_" .. Util.guid():sub(1, 8),
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = opts.DisplayOrder or 10,
        Parent = self.Parent,
    })

    -- Main frame
    local main = Util.create("Frame", {
        Name = "KingWindow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = opts.Position or UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(size.X, size.Y),
        BackgroundColor3 = t:Get("Background"),
        BorderSizePixel = 0,
        ClipsDescendants = false,
        Parent = self.ScreenGui,
    })
    Util.corner(main, Config.Radius.XL)
    Util.stroke(main, t:Get("Border"), 1, 0.4)
    self.Main = main

    -- Glow accent
    local glow = Util.create("Frame", {
        Name = "Glow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 6, 1, 6),
        BackgroundColor3 = t:Get("Glow"),
        BackgroundTransparency = 0.85,
        BorderSizePixel = 0,
        ZIndex = -2,
        Parent = main,
    })
    Util.corner(glow, Config.Radius.XL + 4)
    self.Glow = glow

    -- Drop shadow
    if Config.Performance.EnableShadows then
        local shadow = Util.create("Frame", {
            Name = "Shadow",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.53),
            Size = UDim2.new(1, 10, 1, 12),
            BackgroundColor3 = t:Get("Shadow"),
            BackgroundTransparency = 0.72,
            BorderSizePixel = 0,
            ZIndex = -3,
            Parent = main,
        })
        Util.corner(shadow, Config.Radius.XL + 6)
        self.Shadow = shadow
    end

    -- Topbar
    local topbar = Util.create("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = main,
    })
    self.Topbar = topbar

    -- Crown icon
    self.Crown = Util.create("TextLabel", {
        Position = UDim2.new(0, 14, 0, 0),
        Size = UDim2.new(0, 22, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = 18,
        TextColor3 = t:Get("Accent"),
        Text = "♛",
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = topbar,
    })

    -- Title
    self.TitleLabel = Util.create("TextLabel", {
        Name = "Title",
        Position = UDim2.new(0, 40, 0, 0),
        Size = UDim2.new(1, -140, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = Config.TextSize.Title,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Title or "KingAkbarUI",
        Parent = topbar,
    })

    -- Divider
    self.Divider = Util.create("Frame", {
        Size = UDim2.new(1, -20, 0, 1),
        Position = UDim2.new(0, 10, 0, 46),
        BackgroundColor3 = t:Get("Border"),
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Parent = main,
    })

    -- Controls
    local controls = Util.create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(100, 28),
        BackgroundTransparency = 1,
        Parent = topbar,
    })
    Util.list(controls, Enum.FillDirection.Horizontal, 6,
              Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Center)

    local function makeCtrl(label, hoverColor, callback)
        local btn = Util.create("TextButton", {
            Size = UDim2.fromOffset(28, 28),
            BackgroundColor3 = t:Get("SurfaceAlt"),
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Font = Config.Fonts.Bold,
            Text = label, TextSize = 13,
            TextColor3 = t:Get("TextMuted"),
            AutoButtonColor = false,
            Parent = controls,
        })
        Util.corner(btn, Config.Radius.S)
        btn.MouseEnter:Connect(function()
            Util.tween(btn, Config.Animation.Fast, {
                BackgroundColor3 = hoverColor or t:Get("SurfaceHover"),
                TextColor3 = t:Get("Text"),
            })
        end)
        btn.MouseLeave:Connect(function()
            Util.tween(btn, Config.Animation.Fast, {
                BackgroundColor3 = t:Get("SurfaceAlt"),
                TextColor3 = t:Get("TextMuted"),
            })
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    makeCtrl("◐", nil, function() self.ThemeRef:ToggleMode() end)
    makeCtrl("—", nil, function() self:ToggleMinimize() end)
    makeCtrl("✕", t:Get("Error"), function() self:Destroy() end)

    -- Body
    local body = Util.create("Frame", {
        Name = "Body",
        Position = UDim2.new(0, 0, 0, 47),
        Size = UDim2.new(1, 0, 1, -47),
        BackgroundTransparency = 1,
        Parent = main,
    })
    self.Body = body

    -- Sidebar
    local sidebar = Util.create("ScrollingFrame", {
        Name = "Sidebar",
        Size = UDim2.new(0, 170, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = t:Get("Border"),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = body,
    })
    Util.padding(sidebar, 10, 6, 10, 10)
    Util.list(sidebar, Enum.FillDirection.Vertical, 4)
    self.Sidebar = sidebar

    -- Side divider
    self.SideDivider = Util.create("Frame", {
        Size = UDim2.new(0, 1, 1, -16),
        Position = UDim2.new(0, 170, 0, 8),
        BackgroundColor3 = t:Get("Border"),
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = body,
    })

    -- Content
    local content = Util.create("ScrollingFrame", {
        Name = "Content",
        Position = UDim2.new(0, 171, 0, 0),
        Size = UDim2.new(1, -171, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = t:Get("Border"),
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Parent = body,
    })
    Util.padding(content, 14, 14, 14, 14)
    Util.list(content, Enum.FillDirection.Vertical, 8)
    self.Content = content

    -- Resize handle
    self.Resize = Util.create("TextButton", {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        Parent = main,
    })

    self:_enableDrag()
    self:_enableResize()
end

function Window:_enableDrag()
    local dragging, dragStart, startPos = false, nil, nil
    local topbar = self.Topbar

    table.insert(self.Conn, topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos  = self.Main.Position
        end
    end))
    table.insert(self.Conn, UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            self.Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end))
    table.insert(self.Conn, UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end))
end

function Window:_enableResize()
    local resizing, startPos, startSize = false, nil, nil
    table.insert(self.Conn, self.Resize.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            resizing  = true
            startPos  = input.Position
            startSize = self.Main.AbsoluteSize
        end
    end))
    table.insert(self.Conn, UserInputService.InputChanged:Connect(function(input)
        if not resizing then return end
        local delta = input.Position - startPos
        local w = Util.clamp(startSize.X + delta.X, Config.Defaults.MinSize.X, Config.Defaults.MaxSize.X)
        local h = Util.clamp(startSize.Y + delta.Y, Config.Defaults.MinSize.Y, Config.Defaults.MaxSize.Y)
        self.Main.Size = UDim2.fromOffset(w, h)
    end))
    table.insert(self.Conn, UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
        end
    end))
end

function Window:_bindTheme()
    self._themeDisconnect = self.ThemeRef:OnChanged(function()
        local t = self.ThemeRef
        Util.tween(self.Main, Config.Animation.Normal, { BackgroundColor3 = t:Get("Background") })
        self.TitleLabel.TextColor3 = t:Get("Text")
        self.Crown.TextColor3 = t:Get("Accent")
        self.Divider.BackgroundColor3 = t:Get("Border")
        self.SideDivider.BackgroundColor3 = t:Get("Border")
        if self.Shadow then self.Shadow.BackgroundColor3 = t:Get("Shadow") end
        if self.Glow then self.Glow.BackgroundColor3 = t:Get("Glow") end
        for _, tab in ipairs(self.Tabs) do
            local isActive = (self.CurrentTab == tab)
            tab.Label.TextColor3 = isActive and t:Get("Text") or t:Get("TextMuted")
            if tab.IconLabel then
                tab.IconLabel.TextColor3 = isActive and t:Get("Accent") or t:Get("TextMuted")
            end
        end
    end)
end

function Window:ToggleMinimize()
    self.Minimized = not self.Minimized
    if self.Minimized then
        self._restoreSize = self.Main.Size
        self.Main.ClipsDescendants = true
        Util.tween(self.Main, Config.Animation.Normal, {
            Size = UDim2.new(self.Main.Size.X.Scale, self.Main.Size.X.Offset, 0, 47),
        })
    else
        local target = self._restoreSize or UDim2.fromOffset(Config.Defaults.WindowSize.X, Config.Defaults.WindowSize.Y)
        Util.tween(self.Main, Config.Animation.Normal, { Size = target })
        task.delay(0.25, function() self.Main.ClipsDescendants = false end)
    end
end

function Window:SetVisible(v)
    self.ScreenGui.Enabled = v and true or false
end

function Window:Destroy()
    Util.disconnectAll(self.Conn)
    if self._themeDisconnect then self._themeDisconnect() end
    if self.ScreenGui then self.ScreenGui:Destroy() end
end

--====================================================================
-- // 10. TAB
--====================================================================
local Tab = {}
Tab.__index = Tab

function Window:Tab(opts)
    opts = opts or {}
    local tab = setmetatable({}, Tab)
    tab.Window = self
    tab.Name   = opts.Name or "Tab"
    tab.Icon   = opts.Icon or ""
    tab.Items  = {}

    local t = self.ThemeRef

    local btn = Util.create("TextButton", {
        Name = "Tab_" .. tab.Name,
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = self.Sidebar,
    })
    Util.corner(btn, Config.Radius.M)

    local label = Util.create("TextLabel", {
        Position = UDim2.new(0, opts.Icon and 34 or 12, 0, 0),
        Size = UDim2.new(1, -44, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("TextMuted"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = tab.Name,
        Parent = btn,
    })
    tab.Button = btn
    tab.Label  = label

    if opts.Icon then
        tab.IconLabel = Util.create("TextLabel", {
            Position = UDim2.new(0, 10, 0, 0),
            Size = UDim2.fromOffset(20, 34),
            BackgroundTransparency = 1,
            Font = Config.Fonts.Medium,
            TextSize = 15,
            TextColor3 = t:Get("TextMuted"),
            Text = opts.Icon,
            Parent = btn,
        })
    end

    local content = Util.create("Frame", {
        Name = "TabContent_" .. tab.Name,
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = self.Content,
    })
    Util.list(content, Enum.FillDirection.Vertical, 8)
    tab.Container = content

    btn.MouseEnter:Connect(function()
        if self.CurrentTab == tab then return end
        Util.tween(btn, Config.Animation.Fast, {
            BackgroundTransparency = 0.6,
            BackgroundColor3 = t:Get("SurfaceHover"),
        })
        Util.tween(label, Config.Animation.Fast, { TextColor3 = t:Get("Text") })
        if tab.IconLabel then
            Util.tween(tab.IconLabel, Config.Animation.Fast, { TextColor3 = t:Get("Text") })
        end
    end)
    btn.MouseLeave:Connect(function()
        if self.CurrentTab == tab then return end
        Util.tween(btn, Config.Animation.Fast, { BackgroundTransparency = 1 })
        Util.tween(label, Config.Animation.Fast, { TextColor3 = t:Get("TextMuted") })
        if tab.IconLabel then
            Util.tween(tab.IconLabel, Config.Animation.Fast, { TextColor3 = t:Get("TextMuted") })
        end
    end)
    btn.MouseButton1Click:Connect(function() self:SelectTab(tab) end)

    table.insert(self.Tabs, tab)
    if #self.Tabs == 1 then self:SelectTab(tab) end
    return tab
end

function Window:SelectTab(tab)
    if self.CurrentTab == tab then return end
    local t = self.ThemeRef
    if self.CurrentTab then
        local prev = self.CurrentTab
        prev.Container.Visible = false
        Util.tween(prev.Button, Config.Animation.Fast, { BackgroundTransparency = 1 })
        Util.tween(prev.Label, Config.Animation.Fast, { TextColor3 = t:Get("TextMuted") })
        if prev.IconLabel then
            Util.tween(prev.IconLabel, Config.Animation.Fast, { TextColor3 = t:Get("TextMuted") })
        end
    end
    self.CurrentTab = tab
    tab.Container.Visible = true
    Util.tween(tab.Button, Config.Animation.Fast, {
        BackgroundTransparency = 0,
        BackgroundColor3 = t:Get("SurfaceAlt"),
    })
    Util.tween(tab.Label, Config.Animation.Fast, { TextColor3 = t:Get("Text") })
    if tab.IconLabel then
        Util.tween(tab.IconLabel, Config.Animation.Fast, { TextColor3 = t:Get("Accent") })
    end
end

--====================================================================
-- // 11. COMPONENTS
--====================================================================

-- 11.1 LABEL --------------------------------------------------------
function Tab:Label(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local lbl = Util.create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Text or "Label",
        Parent = self.Container,
    })
    local api = setmetatable({ _inst = lbl, _theme = t }, Component)
    function api:Set(text) lbl.Text = text end
    function api:Get() return lbl.Text end
    return api
end

-- 11.2 PARAGRAPH ---------------------------------------------------
function Tab:Paragraph(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local title = Util.create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Title or "Paragraph",
        Parent = self.Container,
    })
    local body = Util.create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Font = Config.Fonts.Regular,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("TextMuted"),
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Text = opts.Text or "",
        Parent = self.Container,
    })
    return setmetatable({ _inst = title, _body = body, _theme = t }, Component)
end

-- 11.3 BUTTON ------------------------------------------------------
function Tab:Button(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local style  = opts.Style or "Solid"
    local height = opts.Height or 36

    local btn = Util.create("TextButton", {
        Size = UDim2.new(1, 0, 0, height),
        BackgroundColor3 = (style == "Outline" or style == "Ghost") and t:Get("Surface") or t:Get("Accent"),
        BackgroundTransparency = style == "Ghost" and 1 or 0,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        ClipsDescendants = true,
        Parent = self.Container,
    })
    Util.corner(btn, Config.Radius.M)

    if style == "Gradient" then
        btn.BackgroundColor3 = t:Get("Accent")
        Util.create("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, t:Get("Accent")),
                ColorSequenceKeypoint.new(1, t:Get("AccentAlt")),
            }),
            Parent = btn,
        })
    end

    local label = Util.create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = Config.TextSize.Body,
        TextColor3 = (style == "Outline") and t:Get("Accent") or t:Get("Text"),
        Text = opts.Name or "Button",
        Parent = btn,
    })

    if style == "Outline" then
        Util.stroke(btn, t:Get("Accent"), 1.2, 0.15)
    end

    btn.MouseEnter:Connect(function()
        if style == "Solid" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundColor3 = t:Get("AccentHover") })
        elseif style == "Outline" or style == "Ghost" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundTransparency = 0.85 })
        elseif style == "Gradient" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundTransparency = 0 })
        end
    end)
    btn.MouseLeave:Connect(function()
        if style == "Solid" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundColor3 = t:Get("Accent") })
        elseif style == "Outline" or style == "Ghost" then
            Util.tween(btn, Config.Animation.Fast, {
                BackgroundTransparency = style == "Ghost" and 1 or 1,
            })
        elseif style == "Gradient" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundTransparency = 0.1 })
        end
    end)
    btn.MouseButton1Down:Connect(function()
        if style == "Solid" then
            Util.tween(btn, Config.Animation.Fast, { BackgroundColor3 = t:Get("AccentPress") })
        end
    end)
    btn.MouseButton1Click:Connect(function()
        local pos = UserInputService:GetMouseLocation()
        local abs = btn.AbsolutePosition
        Anims.ripple(btn, pos.X - abs.X, pos.Y - abs.Y, Color3.new(1, 1, 1))
        safeCall(opts.Callback)
    end)

    local api = setmetatable({ _inst = btn, _theme = t }, Component)
    function api:SetText(text) label.Text = text end
    function api:SetEnabled(v) btn.Active = v; label.TextTransparency = v and 0 or 0.55 end
    return api
end

-- 11.4 TOGGLE ------------------------------------------------------
function Tab:Toggle(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local state = opts.Default or false

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })
    Util.create("TextLabel", {
        Size = UDim2.new(1, -64, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Toggle",
        Parent = row,
    })

    local track = Util.create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        Size = UDim2.fromOffset(42, 22),
        BackgroundColor3 = state and t:Get("Accent") or t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(track, Config.Radius.Pill)

    local knob = Util.create("Frame", {
        AnchorPoint = state and Vector2.new(1, 0.5) or Vector2.new(0, 0.5),
        Position = state and UDim2.new(1, -3, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = track,
    })
    Util.corner(knob, Config.Radius.Pill)

    local function render(anim)
        if state then
            Util.tween(track, anim, { BackgroundColor3 = t:Get("Accent") })
            Util.tween(knob, anim, {
                Position = UDim2.new(1, -3, 0.5, 0),
                AnchorPoint = Vector2.new(1, 0.5),
            })
        else
            Util.tween(track, anim, { BackgroundColor3 = t:Get("SurfaceAlt") })
            Util.tween(knob, anim, {
                Position = UDim2.new(0, 3, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
            })
        end
    end

    local function set(v, fire)
        state = v
        render(Config.Animation.Spring)
        if fire then safeCall(opts.Callback, state) end
    end

    track.MouseButton1Click:Connect(function() set(not state, true) end)

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) set(v, true) end
    function api:Get() return state end
    return api
end

-- 11.5 CHECKBOX ----------------------------------------------------
function Tab:Checkbox(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local state = opts.Default or false

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })
    local box = Util.create("TextButton", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(0, 0, 0.5, -10),
        BackgroundColor3 = state and t:Get("Accent") or t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(box, Config.Radius.S)
    Util.stroke(box, t:Get("Border"), 1, 0.3)

    local check = Util.create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        Text = "✓",
        TextSize = 14,
        TextColor3 = Color3.new(1, 1, 1),
        TextTransparency = state and 0 or 1,
        Parent = box,
    })

    local label = Util.create("TextButton", {
        Position = UDim2.new(0, 28, 0, 0),
        Size = UDim2.new(1, -28, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Checkbox",
        AutoButtonColor = false,
        Parent = row,
    })

    local function render()
        Util.tween(box, Config.Animation.Normal, {
            BackgroundColor3 = state and t:Get("Accent") or t:Get("SurfaceAlt"),
        })
        Util.tween(check, Config.Animation.Fast, { TextTransparency = state and 0 or 1 })
    end

    local function set(v, fire)
        state = v
        render()
        if fire then safeCall(opts.Callback, state) end
    end

    box.MouseButton1Click:Connect(function() set(not state, true) end)
    label.MouseButton1Click:Connect(function() set(not state, true) end)

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) set(v, true) end
    function api:Get() return state end
    return api
end

-- 11.6 RADIO -------------------------------------------------------
local RadioGroups = {}

function Tab:Radio(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local groupName = opts.Group or "__default_" .. self.Name
    if not RadioGroups[groupName] then
        RadioGroups[groupName] = { items = {}, selected = nil }
    end
    local group = RadioGroups[groupName]

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 26),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })

    local circle = Util.create("TextButton", {
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(0, 0, 0.5, -10),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(circle, Config.Radius.Pill)
    Util.stroke(circle, t:Get("Border"), 1, 0.2)

    local dot = Util.create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = circle,
    })
    Util.corner(dot, Config.Radius.Pill)

    local label = Util.create("TextButton", {
        Position = UDim2.new(0, 28, 0, 0),
        Size = UDim2.new(1, -28, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Option",
        AutoButtonColor = false,
        Parent = row,
    })

    local item = {
        row = row, circle = circle, dot = dot,
        value = opts.Value or opts.Name,
    }

    function item.deselect()
        Util.tween(dot, Config.Animation.Fast, { Size = UDim2.fromOffset(0, 0) })
        Util.tween(circle, Config.Animation.Fast, { BackgroundColor3 = t:Get("SurfaceAlt") })
    end
    function item.select()
        Util.tween(dot, Config.Animation.Spring, { Size = UDim2.fromOffset(10, 10) })
        Util.tween(circle, Config.Animation.Fast, { BackgroundColor3 = t:Get("Accent") })
    end

    local function pick()
        if group.selected == item then return end
        if group.selected and group.selected.deselect then group.selected.deselect() end
        group.selected = item
        item.select()
        safeCall(opts.Callback, item.value)
    end

    circle.MouseButton1Click:Connect(pick)
    label.MouseButton1Click:Connect(pick)

    table.insert(group.items, item)
    if opts.Default or #group.items == 1 then pick() end

    return setmetatable({ _inst = row, _item = item, _theme = t, _group = group }, Component)
end

-- 11.7 SLIDER ------------------------------------------------------
function Tab:Slider(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local min, max = opts.Min or 0, opts.Max or 100
    local step = opts.Step or 1
    local value = opts.Default or min
    local suffix = opts.Suffix or ""

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })
    Util.create("TextLabel", {
        Size = UDim2.new(1, -80, 0, 18),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Slider",
        Parent = row,
    })
    local valueLabel = Util.create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.fromOffset(80, 18),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Mono,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("TextMuted"),
        TextXAlignment = Enum.TextXAlignment.Right,
        Text = tostring(value) .. suffix,
        Parent = row,
    })

    local track = Util.create("TextButton", {
        Position = UDim2.new(0, 0, 0, 26),
        Size = UDim2.new(1, 0, 0, 6),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(track, 3)

    local fill = Util.create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = t:Get("Accent"),
        BorderSizePixel = 0,
        Parent = track,
    })
    Util.corner(fill, 3)

    local knob = Util.create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = track,
    })
    Util.corner(knob, Config.Radius.Pill)
    Util.stroke(knob, t:Get("Accent"), 2)

    local function render()
        local pct = (value - min) / (max - min)
        Util.tween(fill, Config.Animation.Fast, { Size = UDim2.new(pct, 0, 1, 0) })
        Util.tween(knob, Config.Animation.Fast, { Position = UDim2.new(pct, 0, 0.5, 0) })
        valueLabel.Text = tostring(Util.round(value, 2)) .. suffix
    end

    local dragging = false
    local function setFromX(x)
        local abs = track.AbsolutePosition.X
        local w = track.AbsoluteSize.X
        local pct = Util.clamp((x - abs) / w, 0, 1)
        local raw = min + pct * (max - min)
        value = math.floor(raw / step + 0.5) * step
        render()
        safeCall(opts.OnChanged, value)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            if dragging then
                dragging = false
                safeCall(opts.Callback, value)
            end
        end
    end)

    render()

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) value = Util.clamp(v, min, max); render(); safeCall(opts.Callback, value) end
    function api:Get() return value end
    return api
end

-- 11.8 TEXTBOX -----------------------------------------------------
function Tab:Textbox(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })

    local box = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Parent = row,
    })
    Util.corner(box, Config.Radius.M)
    local stroke = Util.stroke(box, t:Get("Border"), 1, 0.5)

    local input = Util.create("TextBox", {
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, -44, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Regular,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        PlaceholderText = opts.Placeholder or "Enter text…",
        PlaceholderColor3 = t:Get("TextMuted"),
        Text = opts.Default or "",
        ClearTextOnFocus = false,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = box,
    })

    local clearBtn = Util.create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -6, 0.5, 0),
        Size = UDim2.fromOffset(24, 24),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = 14,
        TextColor3 = t:Get("TextMuted"),
        Text = "✕",
        AutoButtonColor = false,
        Visible = input.Text ~= "",
        Parent = box,
    })

    clearBtn.MouseButton1Click:Connect(function()
        input.Text = ""
        clearBtn.Visible = false
        safeCall(opts.Callback, "")
    end)

    input:GetPropertyChangedSignal("Text"):Connect(function()
        clearBtn.Visible = input.Text ~= ""
        if opts.Validation and not opts.Validation(input.Text) then
            input.TextColor3 = t:Get("Error")
        else
            input.TextColor3 = t:Get("Text")
        end
        safeCall(opts.OnChanged, input.Text)
    end)

    input.Focused:Connect(function()
        Util.tween(box, Config.Animation.Fast, { BackgroundColor3 = t:Get("SurfaceHover") })
        Util.tween(stroke, Config.Animation.Fast, { Color = t:Get("Accent"), Transparency = 0 })
    end)
    input.FocusLost:Connect(function(enterPressed)
        Util.tween(box, Config.Animation.Fast, { BackgroundColor3 = t:Get("SurfaceAlt") })
        Util.tween(stroke, Config.Animation.Fast, { Color = t:Get("Border"), Transparency = 0.5 })
        safeCall(opts.Callback, input.Text, enterPressed)
    end)

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) input.Text = v end
    function api:Get() return input.Text end
    function api:Focus() input:CaptureFocus() end
    return api
end

-- 11.9 DROPDOWN ----------------------------------------------------
function Tab:Dropdown(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local items = opts.Options or {}
    local selected = {}
    local open = false

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Container,
    })
    Util.list(row, Enum.FillDirection.Vertical, 4)

    local box = Util.create("TextButton", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(box, Config.Radius.M)
    Util.stroke(box, t:Get("Border"), 1, 0.5)

    local label = Util.create("TextLabel", {
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(1, -34, 1, 0),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("TextMuted"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Select…",
        Parent = box,
    })
    Util.create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(18, 18),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = 12,
        TextColor3 = t:Get("TextMuted"),
        Text = "▾",
        Parent = box,
    })

    local popup = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(0, 0, 0, 40),
        BackgroundColor3 = t:Get("Surface"),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 50,
        Parent = row,
    })
    Util.corner(popup, Config.Radius.M)
    Util.stroke(popup, t:Get("Border"), 1, 0.4)
    Util.padding(popup, 6, 6, 6, 6)
    Util.list(popup, Enum.FillDirection.Vertical, 3)

    local search = Util.create("TextBox", {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Font = Config.Fonts.Regular,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("Text"),
        PlaceholderText = "Cari…",
        PlaceholderColor3 = t:Get("TextMuted"),
        Text = "",
        ClearTextOnFocus = false,
        Visible = opts.Search ~= false,
        Parent = popup,
    })
    Util.corner(search, Config.Radius.S)
    Util.padding(search, 0, 8, 0, 8)

    local optionContainer = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Parent = popup,
    })
    Util.list(optionContainer, Enum.FillDirection.Vertical, 3)

    local function updateLabel()
        if #selected == 0 then
            label.Text = opts.Name or "Select…"
            label.TextColor3 = t:Get("TextMuted")
        else
            label.Text = table.concat(selected, ", ")
            label.TextColor3 = t:Get("Text")
        end
    end

    local optionButtons = {}
    local function render(filter)
        for _, b in ipairs(optionButtons) do b:Destroy() end
        optionButtons = {}
        local list = items
        if filter and filter ~= "" then
            list = {}
            for _, v in ipairs(items) do
                if tostring(v):lower():find(filter:lower(), 1, true) then
                    table.insert(list, v)
                end
            end
        end
        for _, itemName in ipairs(list) do
            local isSel = table.find(selected, itemName) ~= nil
            local opt = Util.create("TextButton", {
                Size = UDim2.new(1, 0, 0, 28),
                BackgroundColor3 = isSel and t:Get("Accent") or t:Get("SurfaceAlt"),
                BackgroundTransparency = isSel and 0 or 1,
                BorderSizePixel = 0,
                Font = Config.Fonts.Medium,
                TextSize = Config.TextSize.Small,
                TextColor3 = isSel and Color3.new(1, 1, 1) or t:Get("Text"),
                TextXAlignment = Enum.TextXAlignment.Left,
                Text = "   " .. tostring(itemName),
                AutoButtonColor = false,
                Parent = optionContainer,
            })
            Util.corner(opt, Config.Radius.S)
            opt.MouseEnter:Connect(function()
                if not isSel then
                    Util.tween(opt, Config.Animation.Fast, { BackgroundTransparency = 0.5 })
                end
            end)
            opt.MouseLeave:Connect(function()
                if not isSel then
                    Util.tween(opt, Config.Animation.Fast, { BackgroundTransparency = 1 })
                end
            end)
            opt.MouseButton1Click:Connect(function()
                if opts.Multi then
                    local idx = table.find(selected, itemName)
                    if idx then table.remove(selected, idx) else table.insert(selected, itemName) end
                else
                    selected = { itemName }
                end
                updateLabel()
                render(search.Text)
                safeCall(opts.Callback, opts.Multi and selected or selected[1])
                if not opts.Multi then
                    open = false
                    Util.tween(popup, Config.Animation.Fast, { Size = UDim2.new(1, 0, 0, 0) })
                    task.delay(0.22, function() popup.Visible = false end)
                end
            end)
            table.insert(optionButtons, opt)
        end
    end

    search:GetPropertyChangedSignal("Text"):Connect(function() render(search.Text) end)

    box.MouseButton1Click:Connect(function()
        open = not open
        popup.Visible = true
        render(search.Text)
        task.wait()
        local baseH = search.Visible and 38 or 8
        local targetH = math.min(baseH + #optionButtons * 31, 200)
        Util.tween(popup, Config.Animation.Normal, { Size = UDim2.new(1, 0, 0, open and targetH or 0) })
        if not open then task.delay(0.22, function() popup.Visible = open end) end
    end)

    updateLabel()

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) selected = { v }; updateLabel(); safeCall(opts.Callback, v) end
    function api:Get() return opts.Multi and selected or selected[1] end
    function api:SetOptions(list) items = list; render() end
    return api
end

-- 11.10 COLOR PICKER -----------------------------------------------
function Tab:ColorPicker(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local color = opts.Default or Color3.fromRGB(220, 180, 90)

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })

    local swatch = Util.create("TextButton", {
        Size = UDim2.fromOffset(36, 36),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        Text = "",
        AutoButtonColor = false,
        Parent = row,
    })
    Util.corner(swatch, Config.Radius.M)
    Util.stroke(swatch, t:Get("Border"), 1, 0.4)

    local hexBox = Util.create("TextBox", {
        Position = UDim2.new(0, 46, 0, 0),
        Size = UDim2.new(1, -46, 1, 0),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Font = Config.Fonts.Mono,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("Text"),
        PlaceholderText = "#RRGGBB",
        PlaceholderColor3 = t:Get("TextMuted"),
        ClearTextOnFocus = false,
        Parent = row,
    })
    Util.corner(hexBox, Config.Radius.M)
    Util.padding(hexBox, 0, 10, 0, 10)

    local function toHex(c)
        return string.format("#%02X%02X%02X",
            math.floor(c.R * 255 + 0.5),
            math.floor(c.G * 255 + 0.5),
            math.floor(c.B * 255 + 0.5))
    end
    hexBox.Text = toHex(color)

    local function fromHex(s)
        s = s:gsub("#", "")
        if #s == 6 and s:match("^%x+$") then
            return Color3.fromRGB(
                tonumber(s:sub(1, 2), 16),
                tonumber(s:sub(3, 4), 16),
                tonumber(s:sub(5, 6), 16))
        end
    end

    hexBox:GetPropertyChangedSignal("Text"):Connect(function()
        local c = fromHex(hexBox.Text)
        if c then
            color = c
            swatch.BackgroundColor3 = c
            safeCall(opts.Callback, c)
        end
    end)

    local popup = Util.create("Frame", {
        Position = UDim2.new(0, 0, 1, 6),
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundColor3 = t:Get("Surface"),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 100,
        Parent = row,
    })
    Util.corner(popup, Config.Radius.M)
    Util.padding(popup, 8, 8, 8, 8)
    Util.create("UIGridLayout", {
        CellSize = UDim2.fromOffset(24, 24),
        CellPadding = UDim2.fromOffset(6, 6),
        Parent = popup,
    })

    local presets = {
        Color3.fromRGB(220, 180, 90), Color3.fromRGB(240, 96, 96),
        Color3.fromRGB(74, 201, 133), Color3.fromRGB(240, 180, 70),
        Color3.fromRGB(168, 100, 255), Color3.fromRGB(255, 140, 60),
        Color3.fromRGB(80, 200, 220), Color3.fromRGB(255, 105, 180),
        Color3.fromRGB(120, 120, 140),
    }
    for _, c in ipairs(presets) do
        local b = Util.create("TextButton", {
            BackgroundColor3 = c,
            BorderSizePixel = 0,
            Text = "",
            AutoButtonColor = false,
            Parent = popup,
        })
        Util.corner(b, Config.Radius.S)
        b.MouseButton1Click:Connect(function()
            color = c
            swatch.BackgroundColor3 = c
            hexBox.Text = toHex(c)
            safeCall(opts.Callback, c)
            popup.Visible = false
            Util.tween(popup, Config.Animation.Fast, { Size = UDim2.new(1, 0, 0, 0) })
        end)
    end

    swatch.MouseButton1Click:Connect(function()
        local show = not popup.Visible
        popup.Visible = true
        local h = math.ceil(#presets / 8) * 30 + 16
        Util.tween(popup, Config.Animation.Normal, { Size = UDim2.new(1, 0, 0, show and h or 0) })
        if not show then task.delay(0.2, function() popup.Visible = false end) end
    end)

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(c) color = c; swatch.BackgroundColor3 = c; hexBox.Text = toHex(c) end
    function api:Get() return color end
    return api
end

-- 11.11 PROGRESS BAR -----------------------------------------------
function Tab:ProgressBar(opts)
    opts = opts or {}
    local t = self.Window.ThemeRef
    local value, max = opts.Default or 0, opts.Max or 100

    local row = Util.create("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        Parent = self.Container,
    })
    Util.create("TextLabel", {
        Size = UDim2.new(1, -60, 0, 16),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Medium,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Name or "Progress",
        Parent = row,
    })
    local pctLabel = Util.create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.fromOffset(60, 16),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Mono,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("TextMuted"),
        TextXAlignment = Enum.TextXAlignment.Right,
        Text = "0%",
        Parent = row,
    })
    local track = Util.create("Frame", {
        Position = UDim2.new(0, 0, 0, 22),
        Size = UDim2.new(1, 0, 0, 8),
        BackgroundColor3 = t:Get("SurfaceAlt"),
        BorderSizePixel = 0,
        Parent = row,
    })
    Util.corner(track, 4)

    local fill = Util.create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = t:Get("Accent"),
        BorderSizePixel = 0,
        Parent = track,
    })
    Util.corner(fill, 4)

    local function render(animated)
        local pct = Util.clamp(value / max, 0, 1)
        local info = animated ~= false and Config.Animation.Normal or TweenInfo.new(0)
        Util.tween(fill, info, { Size = UDim2.new(pct, 0, 1, 0) })
        pctLabel.Text = math.floor(pct * 100 + 0.5) .. "%"
    end
    render(false)

    local api = setmetatable({ _inst = row, _theme = t }, Component)
    function api:Set(v) value = Util.clamp(v, 0, max); render() end
    function api:Get() return value end
    return api
end

--====================================================================
-- // 12. TOOLTIP
--====================================================================
function King:AttachTooltip(inst, text)
    local pending, tooltip
    local function show()
        if tooltip then tooltip:Destroy() end
        if not self._tooltipParent or not self._tooltipParent.Parent then
            local ok, cg = pcall(function() return game:GetService("CoreGui") end)
            self._tooltipParent = ok and cg or LocalPlayer:WaitForChild("PlayerGui")
        end
        tooltip = Util.create("TextLabel", {
            BackgroundColor3 = self.Theme:Get("Surface"),
            BorderSizePixel = 0,
            Font = Config.Fonts.Medium,
            TextSize = Config.TextSize.Small,
            TextColor3 = self.Theme:Get("Text"),
            Text = text,
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromOffset(0, 0),
            ZIndex = 500,
            Parent = self._tooltipParent,
        })
        Util.corner(tooltip, Config.Radius.S)
        Util.stroke(tooltip, self.Theme:Get("Border"), 1, 0.4)
        Util.padding(tooltip, 6, 10, 6, 10)
        local mp = UserInputService:GetMouseLocation()
        tooltip.Position = UDim2.fromOffset(mp.X + 14, mp.Y + 14)
    end
    local function hide()
        if tooltip then tooltip:Destroy(); tooltip = nil end
        if pending then task.cancel(pending); pending = nil end
    end
    inst.MouseEnter:Connect(function()
        pending = task.delay(Config.Performance.TooltipDelay, show)
    end)
    inst.MouseLeave:Connect(hide)
    return hide
end

--====================================================================
-- // 13. NOTIFICATIONS
--====================================================================
local Notification = {}
Notification.__index = Notification
local notifContainer

function King:_ensureNotifContainer()
    if notifContainer and notifContainer.Parent then return notifContainer end
    local ok, cg = pcall(function() return game:GetService("CoreGui") end)
    local parent = ok and cg or LocalPlayer:WaitForChild("PlayerGui")
    notifContainer = Util.create("ScreenGui", {
        Name = Config.Prefix .. "Notifications",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 100,
        Parent = parent,
    })
    return notifContainer
end

function King:Notify(opts)
    opts = opts or {}
    local t = self.Theme
    local container = self:_ensureNotifContainer()
    local duration = opts.Duration or Config.Defaults.NotifDuration
    local kind = (opts.Type or "info"):lower()
    local accents = {
        info    = t:Get("Accent"),
        success = t:Get("Success"),
        warning = t:Get("Warning"),
        error   = t:Get("Error"),
    }
    local accent = accents[kind] or t:Get("Accent")
    local icons  = { info = "i", success = "✓", warning = "!", error = "✕" }

    local holder = Util.create("Frame", {
        Name = "Notif",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 20, 0, 20),
        Size = UDim2.fromOffset(Config.Defaults.NotifWidth, 68),
        BackgroundColor3 = t:Get("Surface"),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = container,
    })
    Util.corner(holder, Config.Radius.L)
    Util.stroke(holder, t:Get("Border"), 1, 0.4)

    Util.create("Frame", {
        Size = UDim2.new(0, 4, 1, 0),
        BackgroundColor3 = accent,
        BorderSizePixel = 0,
        Parent = holder,
    })

    local iconFrame = Util.create("TextLabel", {
        Position = UDim2.new(0, 14, 0, 12),
        Size = UDim2.fromOffset(24, 24),
        BackgroundColor3 = accent,
        BackgroundTransparency = 0.12,
        BorderSizePixel = 0,
        Font = Config.Fonts.Bold,
        TextSize = 14,
        TextColor3 = Color3.new(1, 1, 1),
        Text = icons[kind] or "i",
        Parent = holder,
    })
    Util.corner(iconFrame, Config.Radius.Pill)

    Util.create("TextLabel", {
        Position = UDim2.new(0, 46, 0, 12),
        Size = UDim2.new(1, -58, 0, 18),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Bold,
        TextSize = Config.TextSize.Body,
        TextColor3 = t:Get("Text"),
        TextXAlignment = Enum.TextXAlignment.Left,
        Text = opts.Title or "Notice",
        Parent = holder,
    })
    Util.create("TextLabel", {
        Position = UDim2.new(0, 46, 0, 30),
        Size = UDim2.new(1, -58, 0, 28),
        BackgroundTransparency = 1,
        Font = Config.Fonts.Regular,
        TextSize = Config.TextSize.Small,
        TextColor3 = t:Get("TextMuted"),
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Text = opts.Content or "",
        Parent = holder,
    })

    local progress = Util.create("Frame", {
        Position = UDim2.new(0, 4, 1, -3),
        Size = UDim2.new(0, 0, 0, 2),
        BackgroundColor3 = accent,
        BorderSizePixel = 0,
        Parent = holder,
    })

    local api = setmetatable({ _inst = holder, _destroyed = false }, Notification)

    function api:Close()
        if self._destroyed then return end
        self._destroyed = true
        Util.tween(holder, Config.Animation.Normal, {
            Position = UDim2.new(1, 20, 0, holder.Position.Y.Offset),
            BackgroundTransparency = 1,
        })
        task.delay(0.3, function() if holder then holder:Destroy() end end)
    end

    local yOffset = 20 + #self.Notifications * 76
    Util.tween(holder, Config.Animation.Spring, {
        Position = UDim2.new(1, -20, 0, yOffset),
    })
    table.insert(self.Notifications, api)

    Util.tween(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, -4, 0, 2),
    })

    task.delay(duration, function() api:Close() end)

    holder.InputBegan:Connect(function(ip)
        if ip.UserInputType == Enum.UserInputType.MouseButton1 then api:Close() end
    end)

    task.delay(duration + 0.35, function()
        for i, n in ipairs(self.Notifications) do
            if n == api then table.remove(self.Notifications, i); break end
        end
        local y = 20
        for _, n in ipairs(self.Notifications) do
            if n._inst and n._inst.Parent then
                Util.tween(n._inst, Config.Animation.Normal, {
                    Position = UDim2.new(1, -20, 0, y),
                })
                y = y + 76
            end
        end
    end)

    return api
end

--====================================================================
-- // 14. RETURN ENTRY POINT
--====================================================================
return King.new

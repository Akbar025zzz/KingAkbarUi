--[[
    KingAkbarUI — Demo lengkap semua komponen.
    Letakkan sebagai LocalScript di StarterPlayerScripts.
]]
local King = loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/main/KingAkbarUI.lua"))()
local UI   = King({ Theme = "Royal" })

local Win = UI:CreateWindow({
    Title = "KingAkbarUI · Demo Panel",
    Size  = Vector2.new(640, 460),
})

--=========== TAB 1 : OVERVIEW ===========
local T1 = Win:Tab({ Name = "Overview", Icon = "◆" })

T1:Paragraph({
    Title = "Selamat datang di KingAkbarUI",
    Text  = "Library premium dengan 4 tema (Royal, Dark, Light, Midnight), " ..
            "animasi halus, dan API OOP yang clean.",
})

T1:Button({ Name = "Solid Button",    Style = "Solid",    Callback = function()
    UI:Notify({ Title = "Sukses", Content = "Solid ditekan", Type = "success" })
end })
T1:Button({ Name = "Gradient Button", Style = "Gradient", Callback = function()
    UI:Notify({ Title = "Gradient", Content = "Gradient ditekan", Type = "info" })
end })
T1:Button({ Name = "Outline Button",  Style = "Outline",  Callback = function()
    UI:Notify({ Title = "Outline", Content = "Outline ditekan", Type = "warning" })
end })
T1:Button({ Name = "Ghost Button",    Style = "Ghost",    Callback = function()
    UI:Notify({ Title = "Ghost", Content = "Ghost ditekan", Type = "info" })
end })

T1:Toggle({ Name = "Aktifkan Fitur Utama", Default = true, Callback = function(v)
    UI:Notify({ Title = "Toggle", Content = "= " .. tostring(v), Type = v and "success" or "warning" })
end })

T1:Checkbox({ Name = "Saya setuju", Default = false })
T1:Checkbox({ Name = "Kirim statistik", Default = true })

--=========== TAB 2 : INPUT ===========
local T2 = Win:Tab({ Name = "Input", Icon = "✎" })

T2:Textbox({
    Placeholder = "Masukkan nama...",
    Callback    = function(text) print("[Textbox]", text) end,
    Validation  = function(s) return #s >= 3 end,
})

T2:Slider({
    Name = "Volume", Min = 0, Max = 100, Default = 45, Suffix = "%",
    Callback = function(v) print("[Slider]", v) end,
})

T2:Dropdown({
    Name = "Pilih senjata",
    Options = { "Sword", "Bow", "Staff", "Dagger", "Axe" },
    Search = true,
    Callback = function(v) print("[Dropdown]", tostring(v)) end,
})

T2:Dropdown({
    Name = "Warna (multi-select)",
    Options = { "Merah", "Hijau", "Biru", "Kuning" },
    Multi = true,
    Callback = function(t) print("[Multi]", table.concat(t, ", ")) end,
})

T2:ColorPicker({
    Default = Color3.fromRGB(220, 180, 90),
    Callback = function(c) print("[ColorPicker]", tostring(c)) end,
})

--=========== TAB 3 : ADVANCED ===========
local T3 = Win:Tab({ Name = "Advanced", Icon = "⚙" })

T3:Label({ Text = "Pilih difficulty:" })
T3:Radio({ Name = "Easy",   Group = "diff", Default = true })
T3:Radio({ Name = "Normal", Group = "diff" })
T3:Radio({ Name = "Hard",   Group = "diff" })

local pb = T3:ProgressBar({ Name = "Loading", Default = 0, Max = 100 })

T3:Button({ Name = "Simulate Load", Callback = function()
    task.spawn(function()
        for i = 0, 100, 4 do
            pb:Set(i); task.wait(0.04)
        end
        UI:Notify({ Title = "Selesai", Content = "Loading complete!", Type = "success" })
    end)
end })

local lbl = T3:Label({ Text = "Hover aku untuk tooltip!" })
UI:AttachTooltip(lbl._inst, "Ini tooltip dari KingAkbarUI ✨")

T3:Button({ Name = "Test Semua Notifikasi", Callback = function()
    UI:Notify({ Title = "Info",    Content = "Notifikasi info",    Type = "info" })
    task.wait(0.15)
    UI:Notify({ Title = "Success", Content = "Notifikasi sukses",  Type = "success" })
    task.wait(0.15)
    UI:Notify({ Title = "Warning", Content = "Notifikasi warning", Type = "warning" })
    task.wait(0.15)
    UI:Notify({ Title = "Error",   Content = "Notifikasi error",   Type = "error" })
end })

T3:Button({ Name = "Ganti Tema", Callback = function()
    UI.Theme:ToggleMode()
    UI:Notify({ Title = "Tema", Content = "Mode: " .. UI.Theme.Mode, Type = "info" })
end })

print("[KingAkbarUI] Demo ready. Version:", UI.Config.Version)

# King Akbar UI

> Framework UI modern untuk Roblox Luau. Dilengkapi manajemen window, sistem tab adaptif, 13 elemen interaktif, integrasi ikon Lucide, serta transisi animasi halus[span_1](start_span)[span_1](end_span).

```lua
local KingAkbarUI = loadstring(game:HttpGet("[https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/refs/heads/main/KingAkbarUI.lua](https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/refs/heads/main/KingAkbarUI.lua)"))()
```

Setiap konstruktor elemen dapat dipanggil langsung tanpa prefix `Create` (contoh: `Tab:Toggle` ekuivalen dengan `Tab:CreateToggle`)[span_2](start_span)[span_2](end_span). Setiap elemen memiliki method `:Destroy()` untuk menghapus kartu tampilan, memutuskan event listener, dan membersihkan flag terkait[span_3](start_span)[span_3](end_span).

---

## Window

Kontainer utama yang mencakup *sidebar* tab, area konten, tombol penutup (*close button*), dan tumpukan notifikasi toast[span_4](start_span)[span_4](end_span).

```lua
local Window = KingAkbarUI:CreateWindow({
    Name                = "King Akbar UI",
    LoadingSubtitle     = "by King Akbar",
    Icon                = "crown",
    ToggleUIKeybind     = "RightControl",
    Size                = UDim2.fromOffset(640, 480),
    MinSize             = Vector2.new(480, 360),
    MaxSize             = Vector2.new(1000, 700),
    MaxNotifications    = 4,
    KeepOnScreen        = true,
    OpenButton          = { Title = "King Akbar UI", Icon = "crown" },
    Loading = {
        Enabled         = true,
        Title           = "King Akbar UI",
        Text            = "Starting...",
        Steps           = { "Preparing interface", "Loading icons", "Almost ready" },
        Duration        = 1.6,
    },
    ConfigurationSaving = {
        Enabled         = true,
        FolderName      = "KingAkbarUI",
        FileName        = "default",
    },
    Home = {
        Name            = "Home",
        Welcome         = "Hello, ",
        Stats           = { "FPS", "Ping", "Executor", "Game", "Region", "Time" },
        Pages           = {
            {
                Name    = "Changelog",
                Icon    = "scroll-text",
                Entries = {
                    { Title = "v1.2", Tag = "Latest", Changes = { "Added home dashboard", "Dynamic input resize" } },
                },
            },
            {
                Name    = "Info",
                Icon    = "info",
                Content = "King Akbar UI official framework interface.",
            },
        },
    },
    Parent              = game:GetService("CoreGui"),
})

Window:Toggle(false)
```

### Properti Window

| Nama Parameter       | Tipe Data         | Default               | Deskripsi                                                                    |
| :------------------- | :---------------- | :-------------------- | :--------------------------------------------------------------------------- |
| `Name`               | string            | `"King Akbar UI"`     | Judul utama pada header sidebar dan penamaan ScreenGui[span_5](start_span)[span_5](end_span).                     |
| `LoadingSubtitle`    | string            | `nil`                 | Teks sekunder kecil di bawah judul[span_6](start_span)[span_6](end_span).                                         |
| `Icon`               | string \| table   | logo bawaan           | Nama ikon Lucide, path `rbxassetid://`, atau tabel sprite rect[span_7](start_span)[span_7](end_span).             |
| `ToggleUIKeybind`    | string \| KeyCode | `"RightControl"`      | Tombol pintas menyembunyikan/menampilkan UI[span_8](start_span)[span_8](end_span).                                |
| `Size`               | UDim2             | `UDim2(0,640, 0,480)` | Dimensi awal jendela[span_9](start_span)[span_9](end_span).                                                       |
| `MinSize`            | Vector2           | `Vector2(480, 360)`   | Batas resolusi minimum saat di-resize[span_10](start_span)[span_10](end_span).                                      |
| `MaxSize`            | Vector2           | unlimited             | Batas resolusi maksimum saat di-resize[span_11](start_span)[span_11](end_span).                                     |
| `MaxNotifications`   | number            | `4`                   | Kapasitas maksimal tumpukan notifikasi aktif[span_12](start_span)[span_12](end_span).                               |
| `KeepOnScreen`       | boolean           | `true`                | Menjaga posisi jendela tetap berada di dalam viewport layar[span_13](start_span)[span_13](end_span).                |
| `OpenButton`         | boolean \| table  | otomatis di sentuh    | Widget pill melayang untuk membuka UI kembali di perangkat mobile[span_14](start_span)[span_14](end_span).          |
| `Loading`            | boolean \| table  | `true`                | Menampilkan kartu splash loading sebelum UI dimunculkan[span_15](start_span)[span_15](end_span).                    |
| `ConfigurationSaving`| table             | `{}`                  | Konfigurasi auto-save JSON berbasis flags[span_16](start_span)[span_16](end_span).                                  |
| `Home`               | boolean \| table  | `nil`                 | Menambahkan tab dashboard utama berisi sesi profil dan analitik[span_17](start_span)[span_17](end_span).            |
| `Parent`             | Instance          | `gethui()` / CoreGui  | Target penempatan ScreenGui (fallback otomatis ke PlayerGui)[span_18](start_span)[span_18](end_span).               |

### Metode Window

| Method                      | Deskripsi                                                                     |
| :-------------------------- | :---------------------------------------------------------------------------- |
| `Window:Toggle(state?)`     | Mengubah visibilitas antarmuka (tampilkan, sembunyikan, atau toggle balik)[span_19](start_span)[span_19](end_span).   |
| `Window:SetKeybind(keyCode)`| Memperbarui tombol pintas penutup UI dan menyinkronkan label footer[span_20](start_span)[span_20](end_span).         |
| `Window:SetKeepOnScreen(b)` | Mengaktifkan/menonaktifkan pembatasan pergerakan dalam batas layar[span_21](start_span)[span_21](end_span).          |
| `Window:SelectTab(tab)`     | Berpindah ke tab target secara programatis[span_22](start_span)[span_22](end_span).                                  |
| `Window:CreateTab(opts)`    | Menginisialisasi halaman tab baru di sidebar[span_23](start_span)[span_23](end_span).                                |
| `Window:Notify(opts)`       | Mengirimkan pop-up toast notification[span_24](start_span)[span_24](end_span).                                       |
| `Window:Confirm(opts)`      | Menampilkan dialog modal konfirmasi pilihan aksi[span_25](start_span)[span_25](end_span).                            |
| `Window:Dialog(opts)`       | Membuka jendela dialog interaktif kustom[span_26](start_span)[span_26](end_span).                                    |
| `Window:SaveConfig(name?)`  | Menyimpan nilai seluruh elemen ber-flag ke file JSON[span_27](start_span)[span_27](end_span).                        |
| `Window:LoadConfig(name?)`  | Memuat konfigurasi dari penyimpanan lokal[span_28](start_span)[span_28](end_span).                                   |
| `Window:DeleteConfig(name)` | Menghapus berkas konfigurasi tertentu[span_29](start_span)[span_29](end_span).                                       |
| `Window:ListConfigs()`      | Mengembalikan array daftar konfigurasi tersimpan[span_30](start_span)[span_30](end_span).                            |
| `Window:Destroy()`          | Menutup koneksi event, menghapus instance UI, dan membersihkan memori[span_31](start_span)[span_31](end_span).       |

---

## Home Dashboard

Tab opsional yang menampilkan kartu profil pengguna, analitik metrik sesi live (*FPS, Ping, Executor, Region, Uptime*), dan sub-halaman kustom[span_32](start_span)[span_32](end_span).

```lua
Home = {
    Name        = "Home",
    Desc        = "Session Overview",
    Icon        = "layout-dashboard",
    Welcome     = "Selamat datang, ",
    Greeting    = "King Akbar Hub active.",
    SectionName = "System Telemetry",
    Stats       = { "FPS", "Ping", "Executor", "Game", "Region", "Time", "Players", "Uptime" },
    TimeFormat  = "%H:%M",
    Pages       = {
        {
            Name    = "Changelog",
            Icon    = "scroll-text",
            Entries = {
                { Title = "v1.2", Tag = "Stable", Changes = { "Optimasi rendering", "Smooth tweening" } },
                { Title = "v1.1", Date = "Sep 2026", Content = "Penambahan sistem konfigurasi otomatis." },
            },
        },
        { Name = "Credits", Icon = "info", Content = "Dibuat khusus untuk ekosistem King Akbar." },
        { Name = "Custom",  Icon = "wrench", Build = function(frame) end },
    },
}
```

---

## Tab & Kontrol UI

### 1. Inisialisasi Tab

```lua
local Tab = Window:CreateTab({
    Name      = "Main",
    Desc      = "Kumpulan fitur esensial",
    Icon      = "zap",
    EmptyText = "Belum ada item di tab ini",
})
```

---

### 2. Section & Divider

Pemisah visual berbasis teks kategori dan garis pembatas[span_33](start_span)[span_33](end_span).

```lua
local Section = Tab:CreateSection("Kategori Aksi")
Section:Set("Label Kategori Baru")

Tab:CreateDivider()
```

---

### 3. Button

Kartu tombol interaktif dengan animasi efek gelombang (*ripple effect*)[span_34](start_span)[span_34](end_span).

```lua
local Button = Tab:CreateButton({
    Name     = "Reset Karakter",
    Desc     = "Mengembalikan karakter ke posisi spawn",
    Icon     = "refresh-cw",
    Style    = "Primary", -- Pilihan: "Default" atau "Primary"
    Callback = function()
        print("Karakter di-reset")
    end,
})

Button:SetText("Respawn Sekarang")
```

---

### 4. Toggle

Sakelar status *true/false* dengan indikator visual dan animasi pill[span_35](start_span)[span_35](end_span).

```lua
local Toggle = Tab:CreateToggle({
    Name         = "Auto Sprint",
    Desc         = "Otomatis lari cepat saat bergerak",
    CurrentValue = true,
    Flag         = "AutoSprintFlag",
    Callback     = function(Value)
        print("Status Sprint:", Value)
    end,
})

Toggle:Set(false)
print("Nilai Toggle:", Toggle:Get())
```

---

### 5. Slider

Penggeser numerik dengan input manual terintegrasi dan pembulatan langkah (*step*) presisi[span_36](start_span)[span_36](end_span).

```lua
local Slider = Tab:CreateSlider({
    Name         = "WalkSpeed",
    Desc         = "Kecepatan jalan karakter",
    Range        = { 16, 250 },
    Increment    = 1,
    Suffix       = " sps",
    CurrentValue = 16,
    Flag         = "WalkSpeedFlag",
    Callback     = function(Value)
        print("WalkSpeed diatur ke:", Value)
    end,
})

Slider:Set(50)
print("Nilai Slider:", Slider:Get())
```

---

### 6. Stepper

Pengatur angka inkremental dengan tombol minus (−) dan plus (+) yang mendukung *hold-to-repeat*[span_37](start_span)[span_37](end_span).

```lua
local Stepper = Tab:CreateStepper({
    Name         = "Lompatan Multiplier",
    Desc         = "Tingkat kekuatan lompatan",
    Range        = { 1, 10 },
    Increment    = 1,
    Suffix       = "x",
    CurrentValue = 1,
    Flag         = "JumpStepFlag",
    Callback     = function(Value)
        print("Multiplier:", Value)
    end,
})

Stepper:Set(3)
```

---

### 7. Dropdown

Menu pilihan tunggal atau multi-pilihan dengan fitur pencarian instan[span_38](start_span)[span_38](end_span).

```lua
local Dropdown = Tab:CreateDropdown({
    Name            = "Target Teleport",
    Desc            = "Pilih lokasi tujuan",
    Options         = { "Lobby", "Arena", "Zona Aman", "Toko", "Tambang" },
    CurrentOption   = "Lobby",
    MultipleOptions = false,
    SearchAfter     = 5,
    Flag            = "TeleportLocation",
    Callback        = function(Option)
        print("Lokasi terpilih:", Option)
    end,
})

Dropdown:Set("Arena")
Dropdown:Refresh({ "Lobby", "Arena", "Base 1", "Base 2" }, true)
```

---

### 8. Input Box

Kotak input teks adaptif yang memperlebar ukuran sesuai panjang pengetikan secara dinamis[span_39](start_span)[span_39](end_span).

```lua
local Input = Tab:CreateInput({
    Name            = "Teleport ke Player",
    Desc            = "Ketik nama lengkap atau sebagian",
    Icon            = "user",
    PlaceholderText = "Ketik username...",
    CurrentValue    = "",
    Numeric         = false,
    Flag            = "TargetPlayerInput",
    Callback        = function(Text, EnterPressed)
        print("Target:", Text, "Enter ditekan:", EnterPressed)
    end,
})

Input:Set("Akbar")
```

---

### 9. Keybind

Pengikatan tombol keyboard secara dinamis dengan deteksi klik rebind[span_40](start_span)[span_40](end_span).

```lua
local Keybind = Tab:CreateKeybind({
    Name           = "Pintas Menu",
    Desc           = "Tekan tombol untuk aksi cepat",
    CurrentKeybind = "E",
    Flag           = "QuickActionKey",
    Callback       = function(Key)
        print("Keybind ditekan:", Key.Name)
    end,
    OnChanged      = function(Key)
        print("Tombol diubah ke:", Key.Name)
    end,
})

Keybind:Set(Enum.KeyCode.G)
```

---

### 10. ColorPicker

Pemilih warna lengkap dengan palet SV, slider Hue vertikal, input Hex, dan indikator RGB[span_41](start_span)[span_41](end_span).

```lua
local ColorPicker = Tab:CreateColorPicker({
    Name     = "Warna ESP",
    Desc     = "Warna visual box karakter",
    Color    = Color3.fromRGB(235, 199, 246),
    Flag     = "ESPColorFlag",
    Callback = function(Color)
        print("Warna baru:", Color)
    end,
})

ColorPicker:Set(Color3.fromRGB(0, 255, 170))
```

---

### 11. Progress Bar

Bilah progres status visual (0.0 sampai 1.0) dengan interpolasi gerakan halus[span_42](start_span)[span_42](end_span).

```lua
local Progress = Tab:CreateProgress({
    Name         = "Cooldown Aksi",
    Desc         = "Status pemulihan kemampuan",
    CurrentValue = 0.5,
    Color        = KingAkbarUI.Theme.Accent,
    Format       = function(Fraction)
        return math.floor(Fraction * 100) .. "%"
    end,
    Callback     = function(Fraction)
        print("Progres:", Fraction)
    end,
})

Progress:Set(1.0)
```

---

### 12. Label & Paragraph

Elemen kartu informasi teks statis atau dinamis berbasis *auto-update timer*[span_43](start_span)[span_43](end_span).

```lua
local DynamicLabel = Tab:CreateLabel({
    Text       = "Pemain Aktif: 0",
    Color      = KingAkbarUI.Theme.Text,
    UpdateRate = 2,
    Update     = function()
        return "Pemain Aktif: " .. #game:GetService("Players"):GetPlayers()
    end,
})

local Paragraph = Tab:CreateParagraph({
    Title   = "Panduan Singkat",
    Content = "Gunakan King Akbar UI untuk mengontrol seluruh fitur automasi game dengan mudah.",
})

Paragraph:Set("Pembaruan instruksi telah diterapkan.")
```

---

## Notifikasi & Dialog Modal

Toast notification dan modal konfirmasi aksi kritis[span_44](start_span)[span_44](end_span):

```lua
-- Toast Notification
KingAkbarUI:Notify({
    Title    = "Berhasil",
    Content  = "Skrip King Akbar berhasil diaktifkan!",
    Icon     = "check",
    Type     = "Success", -- Pilihan: "Info", "Success", "Warning", "Error"
    Duration = 3.5,
})

-- Dialog Konfirmasi Aksi
KingAkbarUI:Confirm({
    Title       = "Konfirmasi Reset",
    Content     = "Apakah Anda yakin ingin memuat ulang pengaturan default?",
    Icon        = "alert-triangle",
    ConfirmText = "Ya, Lanjutkan",
    CancelText  = "Batal",
    Callback    = function()
        print("Pengaturan di-reset")
    end,
})
```

---

## Manajemen Konfigurasi (Save / Load)

King Akbar UI mendukung serialisasi otomatis seluruh kontrol berbasis atribut `Flag` ke file JSON pada storage executor[span_45](start_span)[span_45](end_span):

```lua
-- Pemanggilan manual lewat kode
Window:SaveConfig("Profil1")
Window:LoadConfig("Profil1")
Window:DeleteConfig("Profil1")

-- Integrasi UI bawaan untuk pengaturan simpan/muat konfigurasi
local SettingsTab = Window:CreateTab({ Name = "Settings", Icon = "settings" })
SettingsTab:CreateConfigManager({ Name = "Daftar Profil" })
```

---

## Kustomisasi Tema & Aset

Anda dapat menimpa warna atau font tema bawaan sebelum memanggil `CreateWindow`[span_46](start_span)[span_46](end_span):

```lua
KingAkbarUI.Theme.Background = Color3.fromRGB(18, 14, 18)
KingAkbarUI.Theme.Surface    = Color3.fromRGB(22, 18, 22)
KingAkbarUI.Theme.Surface2   = Color3.fromRGB(26, 21, 26)
KingAkbarUI.Theme.Accent     = Color3.fromRGB(235, 199, 246)
KingAkbarUI.Theme.Text       = Color3.fromRGB(235, 230, 235)
KingAkbarUI.Theme.Muted      = Color3.fromRGB(130, 120, 130)

-- Unduh font custom opsional
KingAkbarUI:LoadFont({ Name = "ValleySans", Folder = "KingAkbarFonts" })
```

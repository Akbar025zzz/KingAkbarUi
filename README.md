# King Akbar UI

> A UI library for Roblox. Windows, tabs and thirteen elements with lucide icons and eased motion[span_1](start_span)[span_1](end_span).

```lua
local KingAkbarUI = loadstring(game:HttpGet("[https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/refs/heads/main/KingAkbarUI.lua](https://raw.githubusercontent.com/Akbar025zzz/KingAkbarUi/refs/heads/main/KingAkbarUI.lua)"))()
```

Every constructor also works without the `Create` prefix[span_2](start_span)[span_2](end_span). `Tab:Toggle` is the same as `Tab:CreateToggle`[span_3](start_span)[span_3](end_span). Every element handle also has `Destroy()`, which removes the card, its listeners and its flag[span_4](start_span)[span_4](end_span).

---

## Window

> The root container. Sidebar with tabs, a content area, the close button and the notification stack[span_5](start_span)[span_5](end_span).

```lua
local Window = KingAkbarUI:CreateWindow({
    Name = "King Akbar UI",
    LoadingSubtitle = "by King Akbar",
    Icon = "crown",
    ToggleUIKeybind = "RightControl",
    Size = UDim2.fromOffset(640, 480),
    MinSize = Vector2.new(480, 360),
    MaxSize = Vector2.new(1000, 700),
    MaxNotifications = 4,
    KeepOnScreen = true,
    OpenButton = { Title = "King Akbar UI", Icon = "crown" },
    Loading = {
        Enabled = true,
        Title = "King Akbar UI",
        Text = "Starting",
        Steps = { "Preparing interface", "Loading icons", "Almost there" },
        Duration = 1.6,
    },
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KingAkbarUI",
        FileName = "default",
    },
    Home = {
        Name = "Home",
        Welcome = "Hello, ",
        Stats = { "FPS", "Ping", "Executor", "Game", "Region", "Time" },
        Pages = {
            {
                Name = "Changelog",
                Icon = "scroll-text",
                Entries = {
                    { Title = "v1.2", Tag = "Latest", Changes = { "Added the home tab", "Faster dropdowns" } },
                },
            },
            { Name = "Info", Icon = "info", Content = "Any text you want on its own tab." },
        },
    },
    Parent = game:GetService("CoreGui"),
})

Window:Toggle(false)
```

Drag any empty area to move it and the grip in the bottom-right corner to resize it[span_6](start_span)[span_6](end_span). It scales itself down on small screens and stays inside the viewport[span_7](start_span)[span_7](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"King Akbar UI"` | Title in the sidebar header. Also names the ScreenGui[span_8](start_span)[span_8](end_span). |
| `LoadingSubtitle` | string | — | Small line under the title[span_9](start_span)[span_9](end_span). |
| `Icon` | string \| table | logo bawaan | Lucide name, `rbxassetid://` string, or `{ Image, RectOffset, RectSize }`[span_10](start_span)[span_10](end_span). |
| `ToggleUIKeybind` | string \| KeyCode | `"RightControl"` | Hides and shows the window. `"RightShift"`, `"LeftAlt"`, `"Insert"`, `"F1"`, or an `Enum.KeyCode`[span_11](start_span)[span_11](end_span). |
| `Size` | UDim2 | `640 × 480` | Starting size[span_12](start_span)[span_12](end_span). |
| `MinSize` | Vector2 | `480 × 360` | Smallest size the resize grip allows[span_13](start_span)[span_13](end_span). |
| `MaxSize` | Vector2 | unlimited | Largest size the resize grip allows[span_14](start_span)[span_14](end_span). |
| `MaxNotifications` | number | `4` | Oldest toast is dismissed past this[span_15](start_span)[span_15](end_span). |
| `KeepOnScreen` | boolean | `true` | Nudge the window back inside the viewport after a drag, resize or screen change[span_16](start_span)[span_16](end_span). |
| `OpenButton` | boolean \| table | touch-only devices | Floating pill that reopens the window. `true` / `false` to force, `{ Title, Icon }` to customise[span_17](start_span)[span_17](end_span). |
| `Loading` | boolean \| table | `true` | Loading card before the window morphs in. `false` skips it[span_18](start_span)[span_18](end_span). |
| `Loading.Title` | string | `Name` | Title on the card[span_19](start_span)[span_19](end_span). |
| `Loading.Text` | string | `LoadingSubtitle` | First status line[span_20](start_span)[span_20](end_span). |
| `Loading.Steps` | table | 3 built-in lines | Status lines cycled over the duration[span_21](start_span)[span_21](end_span). |
| `Loading.Duration` | number | `1.6` | Seconds before the window appears[span_22](start_span)[span_22](end_span). |
| `ConfigurationSaving` | table | — | See [Configs](#configs)[span_23](start_span)[span_23](end_span). |
| `Home` | boolean \| table | — | Adds a first tab with a greeting and live session stats. See [Home](#home)[span_24](start_span)[span_24](end_span). |
| `Parent` | Instance | `gethui()` / CoreGui | Where the ScreenGui goes. Falls back to PlayerGui[span_25](start_span)[span_25](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Open` | Whether the window is shown[span_26](start_span)[span_26](end_span). |
| `.CurrentTab` | The selected tab[span_27](start_span)[span_27](end_span). |
| `.Tabs` | Array of tabs[span_28](start_span)[span_28](end_span). |
| `.Home` | The home tab, when one was created[span_29](start_span)[span_29](end_span). |
| `Toggle(open?)` | Show, hide, or flip[span_30](start_span)[span_30](end_span). |
| `SetKeybind(keyCode)` | Change the hide key. Updates the footer chip[span_31](start_span)[span_31](end_span). |
| `SetKeepOnScreen(enabled)` | Turn the viewport clamp on or off[span_32](start_span)[span_32](end_span). |
| `SelectTab(tab)` | Switch tabs from code[span_33](start_span)[span_33](end_span). |
| `CreateTab(opts)` | See [Tab](#tab)[span_34](start_span)[span_34](end_span). |
| `Notify(opts)` | See [Notification](#notification)[span_35](start_span)[span_35](end_span). |
| `Confirm(opts)` / `Dialog(opts)` | See [Confirm](#confirm)[span_36](start_span)[span_36](end_span). |
| `SaveConfig / LoadConfig / DeleteConfig / ListConfigs` | See [Configs](#configs)[span_37](start_span)[span_37](end_span). |
| `Destroy()` | Fade out, disconnect everything, remove the gui[span_38](start_span)[span_38](end_span). |

---

## Home

> An optional first tab: a greeting card, live session stats, and pages of your own[span_39](start_span)[span_39](end_span).

```lua
Home = {
    Name = "Home",
    Desc = "Session",
    Icon = "layout-dashboard",
    Welcome = "Hello, ",
    Greeting = "Good to see you.",
    SectionName = "System info",
    Stats = { "FPS", "Ping", "Executor", "Game", "Region", "Time", "Players", "Uptime" },
    TimeFormat = "%H:%M",
    Pages = {
        {
            Name = "Changelog",
            Icon = "scroll-text",
            Entries = {
                { Title = "v1.2", Tag = "Latest", Changes = { "Added the home tab" } },
                { Title = "v1.1", Date = "Aug 30", Content = "Plain text instead of bullets." },
            },
        },
        { Name = "Info", Icon = "info", Content = "Wrapped text in a card." },
        { Name = "Custom", Icon = "wrench", Build = function(frame) end },
    },
}
```

The stats refresh once a second and pause while the window is hidden or another tab is open[span_40](start_span)[span_40](end_span). Pages appear as a pill strip above the content; the greeting only shows on the first page[span_41](start_span)[span_41](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` / `Desc` / `Icon` | string | `"Home"` | The tab itself[span_42](start_span)[span_42](end_span). |
| `Welcome` | string | `"Hello, "` | Prefix before the player's display name[span_43](start_span)[span_43](end_span). |
| `Greeting` | string | time of day | Second line under the welcome[span_44](start_span)[span_44](end_span). |
| `SectionName` | string | `"System info"` | Heading above the cards. `Sections = false` hides it[span_45](start_span)[span_45](end_span). |
| `Stats` | table | first six | `"FPS"`, `"Ping"`, `"Executor"`, `"Game"`, `"Region"`, `"Time"`, `"Players"`, `"Uptime"`[span_46](start_span)[span_46](end_span). |
| `TimeFormat` | string | `"%H:%M"` | `os.date` format for the time card[span_47](start_span)[span_47](end_span). |
| `TabIcon` | string | `"layout-grid"` | Icon on the built-in details page button[span_48](start_span)[span_48](end_span). |
| `Pages` | table | — | Extra pages beside the details one[span_49](start_span)[span_49](end_span). |
| `Pages[n].Name` / `Icon` | string | — | The page button[span_50](start_span)[span_50](end_span). |
| `Pages[n].Content` | string | — | Wrapped text in a card[span_51](start_span)[span_51](end_span). |
| `Pages[n].Entries` | table | — | Cards with `Title`, `Tag` or `Date`, and `Changes` (a list) or `Content`[span_52](start_span)[span_52](end_span). |
| `Pages[n].Build` | function | — | `function(frame)` to fill the page yourself[span_53](start_span)[span_53](end_span). |

---

## Tab

> A sidebar button and a scrolling page[span_54](start_span)[span_54](end_span).

```lua
local Tab = Window:CreateTab({
    Name = "Main",
    Desc = "Movement and actions",
    Icon = "zap",
    EmptyText = "Nothing here yet",
})

local Tab = Window:CreateTab("Main", "zap")
```

The first tab created is selected automatically[span_55](start_span)[span_55](end_span). An empty tab shows its icon with `EmptyText`[span_56](start_span)[span_56](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Tab"` | Sidebar label and page title[span_57](start_span)[span_57](end_span). |
| `Desc` | string | — | Muted line under the page title[span_58](start_span)[span_58](end_span). |
| `Icon` | string \| table | — | Sidebar icon, accent-tinted when selected[span_59](start_span)[span_59](end_span). |
| `EmptyText` | string | `"Nothing here yet"` | Shown while the tab has no elements[span_60](start_span)[span_60](end_span). |

### Handle

Every `Create*` element constructor below, plus `.Name` and `.Window`[span_61](start_span)[span_61](end_span).

---

## Section

> An uppercase heading with a rule to the card edge[span_62](start_span)[span_62](end_span).

```lua
local Section = Tab:CreateSection("Movement")

Section:Set("Movement (beta)")
```

### Handle

| Member | Description |
| --- | --- |
| `Set(text)` | Replace the heading[span_63](start_span)[span_63](end_span). |

---

## Divider

> A 1px line[span_64](start_span)[span_64](end_span).

```lua
Tab:CreateDivider()
```

---

## Label

> A single muted line. Can refresh itself[span_65](start_span)[span_65](end_span).

```lua
local Label = Tab:CreateLabel({
    Text = "Players: 12",
    Color = KingAkbarUI.Theme.Muted,
    UpdateRate = 1,
    Update = function()
        return "Players: " .. #game.Players:GetPlayers()
    end,
})

local Label = Tab:CreateLabel("Players: 12")

Label:Set("Players: 13")
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Text` | string | `""` | The line. A bare string works too[span_66](start_span)[span_66](end_span). |
| `Color` | Color3 | muted | Text colour[span_67](start_span)[span_67](end_span). |
| `Update` | function | — | Called on a timer; its return value becomes the text[span_68](start_span)[span_68](end_span). |
| `UpdateRate` | number | `1` | Seconds between `Update` calls[span_69](start_span)[span_69](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `Set(text)` | Replace the line[span_70](start_span)[span_70](end_span). |
| `Get()` | The current text[span_71](start_span)[span_71](end_span). |
| `SetUpdateRate(seconds)` | Change the timer, when `Update` was given[span_72](start_span)[span_72](end_span). |

---

## Paragraph

> A card with a heading and wrapped body text[span_73](start_span)[span_73](end_span).

```lua
local Paragraph = Tab:CreateParagraph({
    Title = "About",
    Content = "Longer text that wraps across several lines.",
})

Paragraph:Set("Updated body")
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Title` | string | `""` | Heading[span_74](start_span)[span_74](end_span). |
| `Content` | string | `""` | Body. Wraps and grows the card[span_75](start_span)[span_75](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `Set(text)` | Replace the body[span_76](start_span)[span_76](end_span). |

---

## Button

> A full-width card that ripples on click[span_77](start_span)[span_77](end_span).

```lua
local Button = Tab:CreateButton({
    Name = "Reset character",
    Desc = "Respawns at the last spawn point",
    Icon = "refresh-cw",
    Style = "Primary",
    Callback = function()
        print("clicked")
    end,
})

Button:SetText("Respawn")
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Button"` | The label[span_78](start_span)[span_78](end_span). |
| `Desc` | string | — | Hint text under the label[span_79](start_span)[span_79](end_span). |
| `Icon` | string \| table | — | Leading icon[span_80](start_span)[span_80](end_span). |
| `Style` | string | — | `"Primary"` fills the card with the accent colour[span_81](start_span)[span_81](end_span). |
| `Callback` | function | — | Runs on click[span_82](start_span)[span_82](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `SetText(text)` | Replace the label[span_83](start_span)[span_83](end_span). |

---

## Toggle

> Switch a boolean on and off[span_84](start_span)[span_84](end_span).

```lua
local Toggle = Tab:CreateToggle({
    Name = "Auto sprint",
    Desc = "Hold shift to run",
    CurrentValue = true,
    Flag = "AutoSprint",
    Callback = function(Value)
        print("Auto sprint:", Value)
    end,
})

Toggle:Set(false)
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Toggle"` | The label[span_85](start_span)[span_85](end_span). |
| `Desc` | string | — | Hint text under the label[span_86](start_span)[span_86](end_span). |
| `CurrentValue` | boolean | `false` | The initial state. The callback fires once on creation if `true`[span_87](start_span)[span_87](end_span). |
| `Flag` | string | — | The save key[span_88](start_span)[span_88](end_span). |
| `Callback` | function | — | Runs with the new value on every change[span_89](start_span)[span_89](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current state[span_90](start_span)[span_90](end_span). |
| `Set(value, skipCallback?)` | Set the state. Pass `true` as the second argument to skip the callback[span_91](start_span)[span_91](end_span). |
| `Get()` | The current state[span_92](start_span)[span_92](end_span). |

---

## Slider

> Pick a number in a range[span_93](start_span)[span_93](end_span).

```lua
local Slider = Tab:CreateSlider({
    Name = "Walk speed",
    Desc = "Studs per second",
    Range = { 16, 100 },
    Increment = 1,
    Suffix = " sps",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        print("Walk speed:", Value)
    end,
})

Slider:Set(50)
```

Click the value chip to type an exact number[span_94](start_span)[span_94](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Slider"` | The label[span_95](start_span)[span_95](end_span). |
| `Desc` | string | — | Hint text under the label[span_96](start_span)[span_96](end_span). |
| `Range` | table | `{ 0, 100 }` | `{ min, max }`[span_97](start_span)[span_97](end_span). |
| `Increment` | number | `1` | Snap size. Its decimals set how the value is shown[span_98](start_span)[span_98](end_span). |
| `Suffix` | string | `""` | Appended to the value chip[span_99](start_span)[span_99](end_span). |
| `CurrentValue` | number | min | The initial value[span_100](start_span)[span_100](end_span). |
| `Flag` | string | — | The save key[span_101](start_span)[span_101](end_span). |
| `Callback` | function | — | Runs with the new value on every change, including while dragging[span_102](start_span)[span_102](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current value[span_103](start_span)[span_103](end_span). |
| `Set(value, skipCallback?)` | Set the value. Slides with a small overshoot[span_104](start_span)[span_104](end_span). |
| `Get()` | The current value[span_105](start_span)[span_105](end_span). |

---

## Stepper

> A number with − and + buttons[span_106](start_span)[span_106](end_span).

```lua
local Stepper = Tab:CreateStepper({
    Name = "Fall threshold",
    Desc = "Distance before damage",
    Range = { 0, 100 },
    Increment = 5,
    Suffix = " studs",
    CurrentValue = 50,
    Flag = "FallThreshold",
    Callback = function(Value)
        print("Threshold:", Value)
    end,
})

Stepper:Set(75)
```

Hold either button to repeat[span_107](start_span)[span_107](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Stepper"` | The label[span_108](start_span)[span_108](end_span). |
| `Desc` | string | — | Hint text under the label[span_109](start_span)[span_109](end_span). |
| `Range` | table | `{ 0, 100 }` | `{ min, max }`[span_110](start_span)[span_110](end_span). |
| `Increment` | number | `1` | Step per press. Its decimals set how the value is shown[span_111](start_span)[span_111](end_span). |
| `Suffix` | string | `""` | Appended to the value[span_112](start_span)[span_112](end_span). |
| `CurrentValue` | number | min | The initial value[span_113](start_span)[span_113](end_span). |
| `Flag` | string | — | The save key[span_114](start_span)[span_114](end_span). |
| `Callback` | function | — | Runs with the new value on every change[span_115](start_span)[span_115](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current value[span_116](start_span)[span_116](end_span). |
| `Set(value, skipCallback?)` | Set the value. Snapped to the increment and clamped to the range[span_117](start_span)[span_117](end_span). |
| `Get()` | The current value[span_118](start_span)[span_118](end_span). |

---

## Progress

> A read-only bar from 0 to 1[span_119](start_span)[span_119](end_span).

```lua
local Progress = Tab:CreateProgress({
    Name = "Health",
    Desc = "Live from the humanoid",
    CurrentValue = 1,
    Color = KingAkbarUI.Theme.Success,
    Format = function(Fraction)
        return math.floor(Fraction * 100) .. " hp"
    end,
    Callback = function(Fraction)
        print("Health:", Fraction)
    end,
})

Progress:Set(0.5)
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Progress"` | The label[span_120](start_span)[span_120](end_span). |
| `Desc` | string | — | Hint text under the label[span_121](start_span)[span_121](end_span). |
| `CurrentValue` | number | `0` | The initial fraction[span_122](start_span)[span_122](end_span). |
| `Color` | Color3 | accent | Fill colour[span_123](start_span)[span_123](end_span). |
| `Format` | function | percentage | Returns the label text for a fraction[span_124](start_span)[span_124](end_span). |
| `Callback` | function | — | Runs on `Set` unless skipped[span_125](start_span)[span_125](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current fraction[span_126](start_span)[span_126](end_span). |
| `Set(value, skipCallback?)` | Set the fraction. Eases the fill[span_127](start_span)[span_127](end_span). |
| `SetColor(color)` | Change the fill colour[span_128](start_span)[span_128](end_span). |
| `Get()` | The current fraction[span_129](start_span)[span_129](end_span). |

---

## Dropdown

> Pick one option, or several[span_130](start_span)[span_130](end_span).

```lua
local Dropdown = Tab:CreateDropdown({
    Name = "Camera mode",
    Desc = "Applied to the current camera",
    Options = { "Classic", "Follow", "Orbital", "Track" },
    CurrentOption = "Classic",
    MultipleOptions = false,
    SearchAfter = 6,
    Flag = "CameraMode",
    Callback = function(Option)
        print("Camera mode:", Option)
    end,
})

Dropdown:Set("Follow")
```

Clicking the selected row unchecks it[span_131](start_span)[span_131](end_span). Lists longer than `SearchAfter` get a search box[span_132](start_span)[span_132](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Dropdown"` | The label[span_133](start_span)[span_133](end_span). |
| `Desc` | string | — | Hint text under the label[span_134](start_span)[span_134](end_span). |
| `Options` | table | `{}` | The rows[span_135](start_span)[span_135](end_span). |
| `CurrentOption` | string \| table | — | The initial selection. A table in multi mode[span_136](start_span)[span_136](end_span). |
| `MultipleOptions` | boolean | `false` | Rows toggle independently and the callback receives a list[span_137](start_span)[span_137](end_span). |
| `SearchAfter` | number | `6` | Row count that turns the search box on[span_138](start_span)[span_138](end_span). |
| `Flag` | string | — | The save key[span_139](start_span)[span_139](end_span). |
| `Callback` | function | — | Runs with the selection on every change. `nil` when unchecked[span_140](start_span)[span_140](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Open` | Whether the list is expanded[span_141](start_span)[span_141](end_span). |
| `Set(value, skipCallback?)` | Select a value, or a list in multi mode[span_142](start_span)[span_142](end_span). |
| `Refresh(options, keepSelection?)` | Replace the rows[span_143](start_span)[span_143](end_span). |
| `SetOpen(open)` | Expand or collapse[span_144](start_span)[span_144](end_span). |
| `Get()` | The current selection[span_145](start_span)[span_145](end_span). |

---

## Input

> A text box that grows with what you type[span_146](start_span)[span_146](end_span).

```lua
local Input = Tab:CreateInput({
    Name = "Player name",
    Desc = "Partial names work",
    Icon = "user",
    PlaceholderText = "type here",
    CurrentValue = "",
    Numeric = false,
    Flag = "PlayerName",
    Callback = function(Text, EnterPressed)
        print("Input:", Text, EnterPressed)
    end,
})

Input:Set("Akbar")
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Input"` | The label[span_147](start_span)[span_147](end_span). |
| `Desc` | string | — | Hint text under the label[span_148](start_span)[span_148](end_span). |
| `Icon` | string \| table | — | Icon inside the box[span_149](start_span)[span_149](end_span). |
| `PlaceholderText` | string | `""` | Shown while empty[span_150](start_span)[span_150](end_span). |
| `CurrentValue` | string | `""` | The initial text[span_151](start_span)[span_151](end_span). |
| `Numeric` | boolean | `false` | Clears the box and skips the callback if the text is not a number[span_152](start_span)[span_152](end_span). |
| `Flag` | string | — | The save key[span_153](start_span)[span_153](end_span). |
| `Callback` | function | — | Runs when focus is lost. The second argument is whether Enter was pressed[span_154](start_span)[span_154](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `Set(text)` | Replace the text[span_155](start_span)[span_155](end_span). |
| `Get()` | The current text[span_156](start_span)[span_156](end_span). |

---

## Keybind

> Bind an action to a key[span_157](start_span)[span_157](end_span).

```lua
local Keybind = Tab:CreateKeybind({
    Name = "Toggle sprint",
    Desc = "Press to flip the toggle",
    CurrentKeybind = "F",
    Flag = "SprintKey",
    Callback = function(Key)
        print("Pressed:", Key.Name)
    end,
    OnChanged = function(Key)
        print("Rebound to:", Key.Name)
    end,
})

Keybind:Set(Enum.KeyCode.G)
```

Click the chip and press a key to rebind[span_158](start_span)[span_158](end_span). Escape cancels[span_159](start_span)[span_159](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Keybind"` | The label[span_160](start_span)[span_160](end_span). |
| `Desc` | string | — | Hint text under the label[span_161](start_span)[span_161](end_span). |
| `CurrentKeybind` | string \| KeyCode | — | The initial key[span_162](start_span)[span_162](end_span). |
| `Flag` | string | — | The save key[span_163](start_span)[span_163](end_span). |
| `Callback` | function | — | Runs when the key is pressed and no text box has focus[span_164](start_span)[span_164](end_span). |
| `OnChanged` | function | — | Runs when the user rebinds it[span_165](start_span)[span_165](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current KeyCode, or `nil`[span_166](start_span)[span_166](end_span). |
| `.Listening` | Whether the chip is waiting for a key[span_167](start_span)[span_167](end_span). |
| `Set(keyCode, skipCallback?)` | Rebind. Pass `true` to skip `OnChanged`[span_168](start_span)[span_168](end_span). |
| `Get()` | The current KeyCode[span_169](start_span)[span_169](end_span). |

---

## Color Picker

> Pick a colour[span_170](start_span)[span_170](end_span).

```lua
local ColorPicker = Tab:CreateColorPicker({
    Name = "Highlight colour",
    Desc = "Applied to every highlight",
    Color = Color3.fromRGB(235, 199, 246),
    Flag = "HighlightColor",
    Callback = function(Color)
        print("Colour:", Color)
    end,
})

ColorPicker:Set(Color3.fromRGB(150, 220, 170))
```

The panel has a saturation/value square, a hue bar, a hex box and an RGB readout[span_171](start_span)[span_171](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | `"Color"` | The label[span_172](start_span)[span_172](end_span). |
| `Desc` | string | — | Hint text under the label[span_173](start_span)[span_173](end_span). |
| `Color` | Color3 | accent | The initial colour[span_174](start_span)[span_174](end_span). |
| `Flag` | string | — | The save key[span_175](start_span)[span_175](end_span). |
| `Callback` | function | — | Runs with the new colour on every change, including while dragging[span_176](start_span)[span_176](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `.Value` | The current colour[span_177](start_span)[span_177](end_span). |
| `.Open` | Whether the panel is expanded[span_178](start_span)[span_178](end_span). |
| `Set(color, skipCallback?)` | Set the colour. Animates the cursors[span_179](start_span)[span_179](end_span). |
| `SetOpen(open)` | Expand or collapse[span_180](start_span)[span_180](end_span). |
| `Get()` | The current colour[span_181](start_span)[span_181](end_span). |

---

## Notification

> A toast in the bottom-right corner[span_182](start_span)[span_182](end_span).

```lua
local Notification = KingAkbarUI:Notify({
    Title = "Loaded",
    Content = "5 tabs ready",
    Icon = "check",
    Type = "Success",
    Duration = 4,
})

local Notification = Window:Notify({ Title = "Window specific" })

Notification:Dismiss()
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Title` | string | `"Notification"` | Bold first line[span_183](start_span)[span_183](end_span). |
| `Content` | string | — | Wrapped body[span_184](start_span)[span_184](end_span). |
| `Icon` | string \| table | — | Icon before the title[span_185](start_span)[span_185](end_span). |
| `Duration` | number | `4` | Seconds before it dismisses itself[span_186](start_span)[span_186](end_span). |
| `Type` | string | `"Info"` | `"Info"`, `"Success"`, `"Warning"` or `"Error"`. Tints the title[span_187](start_span)[span_187](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `Dismiss()` | Close it now[span_188](start_span)[span_188](end_span). |

---

## Confirm

> Ask before doing something[span_189](start_span)[span_189](end_span).

```lua
Tab:CreateButton({
    Name = "Unload",
    Callback = function()
        KingAkbarUI:Confirm({
            Title = "Unload?",
            Content = "The window closes and everything is restored.",
            Icon = "power",
            ConfirmText = "Unload",
            CancelText = "Keep",
            Callback = function()
                Window:Destroy()
            end,
            OnCancel = function()
                print("Kept")
            end,
        })
    end,
})

KingAkbarUI:Dialog({
    Title = "Choose",
    Content = "Pick one.",
    Icon = "list",
    CloseOnBackdrop = true,
    Buttons = {
        { Title = "Later", Callback = function() end },
        { Title = "Now", Variant = "Primary", Callback = function() end },
    },
})
```

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Title` | string | `"Are you sure?"` | Heading[span_190](start_span)[span_190](end_span). |
| `Content` | string | — | Wrapped body[span_191](start_span)[span_191](end_span). |
| `Icon` | string \| table | — | Icon before the heading[span_192](start_span)[span_192](end_span). |
| `ConfirmText` | string | `"Confirm"` | Primary button[span_193](start_span)[span_193](end_span). |
| `CancelText` | string | `"Cancel"` | Secondary button[span_194](start_span)[span_194](end_span). |
| `Callback` | function | — | Runs when confirmed[span_195](start_span)[span_195](end_span). |
| `OnCancel` | function | — | Runs on cancel or a backdrop click[span_196](start_span)[span_196](end_span). |

`Dialog` builds the same card with any number of buttons[span_197](start_span)[span_197](end_span). `Variant = "Primary"` gives a button the accent fill[span_198](start_span)[span_198](end_span). `CloseOnBackdrop = false` forces a button press[span_199](start_span)[span_199](end_span).

---

## Flags

> Read and write any element by its save key[span_200](start_span)[span_200](end_span).

```lua
print(KingAkbarUI.Flags.AutoSprint:Get())
KingAkbarUI.Flags.WalkSpeed:Set(50)
```

Toggles, sliders, steppers, dropdowns, inputs, keybinds and colour pickers created with a `Flag` are stored on `KingAkbarUI.Flags`[span_201](start_span)[span_201](end_span). Flags are also what configs save[span_202](start_span)[span_202](end_span).

---

## Configs

> Save every flagged element to a file and load it back[span_203](start_span)[span_203](end_span).

```lua
local Window = KingAkbarUI:CreateWindow({
    Name = "King Akbar UI",
    ConfigurationSaving = { Enabled = true, FolderName = "KingAkbarUI", FileName = "default" },
})

-- create tabs and elements

Window:LoadConfig()
```

Requires `writefile` / `readfile`[span_204](start_span)[span_204](end_span). Keybinds are stored by key name, colours as RGB components[span_205](start_span)[span_205](end_span). Call `LoadConfig` after every element exists[span_206](start_span)[span_206](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Enabled` | boolean | `true` | Auto-save 0.5 s after any flagged element changes[span_207](start_span)[span_207](end_span). |
| `FolderName` | string | `"KingAkbarUI"` | Folder in the executor workspace[span_208](start_span)[span_208](end_span). |
| `FileName` | string | `"default"` | Config used when no name is given[span_209](start_span)[span_209](end_span). |

### Handle

| Member | Description |
| --- | --- |
| `Window:SaveConfig(name?)` | Write `<folder>/<name>.json`. Returns `ok, err`[span_210](start_span)[span_210](end_span). |
| `Window:LoadConfig(name?, skipCallbacks?)` | Apply a saved config[span_211](start_span)[span_211](end_span). |
| `Window:DeleteConfig(name)` | Remove the file[span_212](start_span)[span_212](end_span). |
| `Window:ListConfigs()` | Sorted list of saved names[span_213](start_span)[span_213](end_span). |
| `Tab:CreateConfigManager({ Name })` | Name input, saved-config dropdown, Save / Load / Delete and an auto-save toggle. Returns `Save / Load / Delete / Refresh`[span_214](start_span)[span_214](end_span). |

---

## Icons

> Any lucide icon, anywhere an `Icon` is accepted[span_215](start_span)[span_215](end_span).

```lua
KingAkbarUI:PreloadIcons()

Window:CreateTab({ Name = "Main", Icon = "zap" })
Tab:CreateButton({ Name = "Rejoin", Icon = "refresh-cw" })
Tab:CreateInput({ Name = "Key", Icon = "lucide:key-round" })
Window:CreateTab({ Name = "Custom", Icon = "rbxassetid://103859712365480" })
Tab:CreateButton({
    Name = "Sprite",
    Icon = { Image = "rbxassetid://122605056588923", RectOffset = Vector2.new(325, 775), RectSize = Vector2.new(24, 24) },
})
```

Names resolve through the [Footagesus/Icons](https://github.com/Footagesus/Icons) list, fetched once on first use; `KingAkbarUI:PreloadIcons()` fetches it up front[span_216](start_span)[span_216](end_span).

---

## Fonts

> Download a font once and use it everywhere[span_217](start_span)[span_217](end_span).

```lua
KingAkbarUI:LoadFont({ Name = "ValleySans" })

KingAkbarUI:LoadFont({
    Name = "MyFont",
    Folder = "KingAkbarFonts",
    Weights = {
        Regular = "[https://example.com/MyFont-Regular.ttf](https://example.com/MyFont-Regular.ttf)",
        Medium = "[https://example.com/MyFont-Medium.ttf](https://example.com/MyFont-Medium.ttf)",
        SemiBold = "[https://example.com/MyFont-SemiBold.ttf](https://example.com/MyFont-SemiBold.ttf)",
    },
})
```

Call it before `CreateWindow`[span_218](start_span)[span_218](end_span). The TTFs are saved to the folder on first run and reused after that[span_219](start_span)[span_219](end_span). Needs `writefile`, `isfile` and `getcustomasset`; without them the default Builder Sans stays[span_220](start_span)[span_220](end_span).

### Properties

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `Name` | string | — | Family name. `"ValleySans"` uses the built-in URLs[span_221](start_span)[span_221](end_span). |
| `Folder` | string | `"KingAkbarFonts"` | Where the TTFs and family file are saved[span_222](start_span)[span_222](end_span). |
| `Weights` | table | preset | `Regular`, `Medium`, `SemiBold`, `Bold` → TTF URL[span_223](start_span)[span_223](end_span). |

---

## Theme

> Colours, fonts and assets. Change them before creating a window[span_224](start_span)[span_224](end_span).

```lua
KingAkbarUI.Theme.Background = Color3.fromRGB(20, 16, 20)
KingAkbarUI.Theme.Surface = Color3.fromRGB(24, 19, 24)
KingAkbarUI.Theme.Surface2 = Color3.fromRGB(28, 22, 28)
KingAkbarUI.Theme.Surface3 = Color3.fromRGB(42, 36, 43)
KingAkbarUI.Theme.Stroke = Color3.fromRGB(40, 32, 41)
KingAkbarUI.Theme.StrokeHover = Color3.fromRGB(88, 70, 90)
KingAkbarUI.Theme.Accent = Color3.fromRGB(235, 199, 246)
KingAkbarUI.Theme.AccentDark = Color3.fromRGB(24, 18, 26)
KingAkbarUI.Theme.Text = Color3.fromRGB(233, 229, 234)
KingAkbarUI.Theme.Muted = Color3.fromRGB(125, 115, 126)
KingAkbarUI.Theme.Success = Color3.fromRGB(150, 220, 170)
KingAkbarUI.Theme.Warning = Color3.fromRGB(240, 176, 108)
KingAkbarUI.Theme.Error = Color3.fromRGB(240, 120, 120)

local Family = "rbxasset://fonts/families/BuilderSans.json"
KingAkbarUI.Fonts.Regular = Font.new(Family, Enum.FontWeight.Regular)
KingAkbarUI.Fonts.Medium = Font.new(Family, Enum.FontWeight.Medium)
KingAkbarUI.Fonts.Bold = Font.new(Family, Enum.FontWeight.SemiBold)

KingAkbarUI.Assets.Logo = "rbxassetid://103859712365480"
KingAkbarUI.Assets.Glow = "rbxassetid://8992230677"
KingAkbarUI.Assets.Shadow = "rbxassetid://6014261993"
```

### Properties

| Name | Used for |
| --- | --- |
| `Background` | Window, toast and dialog fill[span_225](start_span)[span_225](end_span). |
| `Surface` | Chips, text boxes, option rows[span_226](start_span)[span_226](end_span). |
| `Surface2` | Element cards, selected tab[span_227](start_span)[span_227](end_span). |
| `Surface3` | Toggle pill off, tracks[span_228](start_span)[span_228](end_span). |
| `Stroke` | Outlines at rest[span_229](start_span)[span_229](end_span). |
| `StrokeHover` | Outlines on hover, focus, open[span_230](start_span)[span_230](end_span). |
| `Accent` | Highlights, primary buttons, indicator, progress bars[span_231](start_span)[span_231](end_span). |
| `AccentDark` | Text on accent surfaces[span_232](start_span)[span_232](end_span). |
| `Text` / `Muted` | Primary and secondary text[span_233](start_span)[span_233](end_span). |
| `Success` / `Warning` / `Error` | Notification title tints[span_234](start_span)[span_234](end_span). |
| `Fonts.Regular` / `Medium` / `Bold` | Body text / titles and chips / emphasis[span_235](start_span)[span_235](end_span). |
| `Assets.Logo` / `Glow` / `Shadow` | Header mark, glow decal, drop shadow[span_236](start_span)[span_236](end_span). |

`KingAkbarUI.Touch` is `true` on touch-only devices; cards, chips and hit areas are larger there automatically[span_237](start_span)[span_237](end_span).

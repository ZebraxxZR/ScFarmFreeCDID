local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Libraries/main/Shaman/Library.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
    Text = "prohack"
})

--// Aiming Tab
local Tab = Window:Tab({
    Text = "Aiming"
})

--// Visual Tab
local Tab2 = Window:Tab({
    Text = "Visual"
})

--// Player Tab
local Tab3 = Window:Tab({
    Text = "Player"
})

--// Aiming Sections
local Section = Tab:Section({
    Text = "Aimbot"
})

local Section2 = Tab:Section({
    Text = "FOV"
})

local Section3 = Tab:Section({
    Text = "Misc",
    Side = "Right"
})

--// Visual Section
local ChamsSection = Tab2:Section({
    Text = "Chams"
})

ChamsSection:Toggle({ Text = "Enabled" })
ChamsSection:Toggle({ Text = "Color" })
ChamsSection:Toggle({ Text = "Filled" })
ChamsSection:Toggle({ Text = "Team Check" })

--✅ Tambahan: Label nama & status premium
ChamsSection:Label({
	Text = game.Players.LocalPlayer.DisplayName .. " | " .. (game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Premium" or "Free"),
	Color = Color3.fromRGB(255, 255, 255),
	Tooltip = "Your display name and membership"
})

--✅ Tambahan: Gambar avatar (headshot)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0, 48, 0, 48)
ImageLabel.Position = UDim2.new(0, 10, 0, 125)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png", game.Players.LocalPlayer.UserId)

-- Cari panel Visual > Chams
local gui = Library.Gui
local visualTab = gui and gui:FindFirstChild("Visual")
if visualTab then
	local chams = visualTab:FindFirstChild("Chams")
	if chams then
		ImageLabel.Parent = chams
	end
end

--// Player Tab Section
local PlayerSection = Tab3:Section({ Text = "Player Controls" })

PlayerSection:Slider({
    Text = "Walkspeed",
    Default = 16,
    Minimum = 16,
    Maximum = 100,
    Flag = "WalkspeedFlag",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

PlayerSection:Slider({
    Text = "JumpPower",
    Default = 50,
    Minimum = 50,
    Maximum = 200,
    Flag = "JumpPowerFlag",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

--// Aimbot Section
Section:Toggle({ Text = "Enabled" })
Section:Toggle({ Text = "Wall Check" })
Section:Toggle({ Text = "Smooth Aimbot" })
Section:Toggle({ Text = "Silent Aimbot" })

Section:Dropdown({
    Text = "Dropdown",
    List = {"Head", "Torso", "Random"},
    Flag = "Choosen",
    Callback = function(v) warn(v) end
})

Section:RadioButton({
    Text = "RadioButton",
    Options = {"Legit", "Blatant"},
    Callback = function(v) warn(v) end
})

Section:Input({
    Placeholder = "Webhook URL",
    Flag = "URL"
})

Section:Keybind({
    Default = Enum.KeyCode.E,
    Text = "Aimbot Key",
    Callback = function() warn("Pressed") end
})

Section:Slider({
    Text = "Slider Test",
    Default = 5,
    Minimum = 0,
    Maximum = 50,
    Flag = "SliderFlag",
    Callback = function(v) warn(v) end
})

--// FOV Section
Section2:Toggle({ Text = "Enabled" })
Section2:Toggle({ Text = "Filled FOV" })
Section2:Toggle({ Text = "FOV Transparency", Tooltip = "Changes your fov transparency." })
Section2:Button({ Text = "Reset FOV", Tooltip = "This resets your aimbot fov." })

--// Misc Section
Section3:Toggle({ Text = "Infinite Ammo" })
Section3:Toggle({ Text = "No Spread" })
Section3:Toggle({ Text = "No Bullet Drop", Default = true })
Section3:Toggle({ Text = "Full Auto" })

local a = Section3:Toggle({ Text = "No Recoil" })

local label = Section3:Label({
    Text = "This is a label.",
    Color = Color3.fromRGB(217, 97, 99),
    Tooltip = "This is a label."
})

-- Final setup
Tab:Select()

wait(5)

label:Set({ Text = "This is a red label." })
a:Set(true)

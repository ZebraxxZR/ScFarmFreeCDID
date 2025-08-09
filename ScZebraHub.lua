-- warn("Script By ZebraDEV Is Running")
-- warn("Connecting To Server...")
-- wait(1.3)
-- warn("Succesfully Connected To Server !")

-- for i = 10, 100, 10 do
--     print("ZebraDEV | Loading Assets... [✅" .. i .. "%]")
--     wait(0.3)
-- end

-- for i = 10, 100, 10 do
--     print("ZebraDEV | Bypassing Security... [✅" .. i .. "%]")
--     wait(0.5)
-- end

-- print("All Assets Successfully Loaded and Bypassing game security is success")


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Libraries/main/Shaman/Library.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
    Text = "ZebraDEV"
})

--// Farm Tab
local Tab = Window:Tab({
    Text = "Farm"
})

--// Other
local Tab3 = Window:Tab({
    Text = "Other"
})

--// Discord ZebraDEV Tab
local Tab4 = Window:Tab({
    Text = "Discord"
})

local BaristaSection = Tab:Section({
    Text = "Barista"
})

BaristaSection:Toggle({ 
    Text = "Auto Farm",
    Callback = function(state)
        autoFarmBarista = state

        if state then
            -- Ambil job Barista
            game:GetService("ReplicatedStorage")
                :WaitForChild("NetworkContainer")
                :WaitForChild("RemoteEvents")
                :WaitForChild("Job")
                :FireServer("JanjiJiwa")

            -- Jalankan loop auto farm
            task.spawn(function()
                while autoFarmBarista do
                    -- Ambil kopi
                    game:GetService("ReplicatedStorage")
                        :WaitForChild("NetworkContainer")
                        :WaitForChild("RemoteEvents")
                        :WaitForChild("JanjiJiwa")
                        :FireServer("GetCoffee")

                    task.wait(16)

                    -- Antar kopi
                    game:GetService("ReplicatedStorage")
                        :WaitForChild("NetworkContainer")
                        :WaitForChild("RemoteEvents")
                        :WaitForChild("JanjiJiwa")
                        :FireServer("Delivery")

                    -- Teleport ke lokasi kerja
                    local char = game.Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = CFrame.new(-13720.0, 1052.9, -17996.2)
                    end
                end
            end)
        else
            -- Stop farming + keluar kerja
            game:GetService("ReplicatedStorage")
                :WaitForChild("NetworkContainer")
                :WaitForChild("RemoteEvents")
                :WaitForChild("Job")
                :FireServer("Unemployee")
        end
    end
})

-- Path folder NPC
local npcFolder = workspace:WaitForChild("NPC")

-- Bersihkan NPC yang sudah ada dulu
for _, v in ipairs(npcFolder:GetChildren()) do
    task.delay(8, function()
        if v and v.Parent == npcFolder then
            v:Destroy()
        end
    end)
end

-- Kalau ada NPC baru muncul
npcFolder.ChildAdded:Connect(function(child)
    if child:IsA("Model") or child:IsA("Folder") then
        task.delay(8, function()
            if child and child.Parent == npcFolder then
                child:Destroy()
            end
        end)
    end
end)

BaristaSection:Toggle({
    Text = "Teleport",
    Callback = function(state)
        if state then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-13720.0, 1052.9, -17996.2)
            end

            task.delay(2, function()
                TeleportBaristaToggle:Set(false)
            end)
        end
    end
})

BaristaSection:Toggle({ 
    Text = "Ambil Job",
    Callback = function(state)
        local args = {}
        if state then
            args = { "JanjiJiwa" }
        else
            args = { "Unemployee" }
        end

        game:GetService("ReplicatedStorage")
            :WaitForChild("NetworkContainer")
            :WaitForChild("RemoteEvents")
            :WaitForChild("Job")
            :FireServer(unpack(args))
    end
})

local label = BaristaSection:Label({
    Text = "Jawa Tengah Only",
    Color = Color3.fromRGB(217, 97, 99),
    Tooltip = "Jawa Tengah Only"
})

local OfficeSection = Tab:Section({
    Text = "Office Worker",
    Side = "Right"
})

OfficeSection:Toggle({ 
    Text = "Auto Farm",
    Callback = function(state)
        autoFarmOffice = state

        if state then
            local jobRemote = game:GetService("ReplicatedStorage")
                :WaitForChild("NetworkContainer")
                :WaitForChild("RemoteEvents")
                :WaitForChild("Job")

            -- Ambil Job Office dulu
            jobRemote:FireServer("Office")

            task.spawn(function()
                while autoFarmOffice do
                    -- Pastikan UI job ada
                    local jobUI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Job")
                    if not jobUI then
                        -- kalau UI nggak ada, ambil job lagi
                        jobRemote:FireServer("Office")
                        task.wait(1)
                        jobUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Job", 5)
                    end

                    -- Mulai pekerjaan "Office table"
                    jobRemote:FireServer("Office table")

                    if jobUI then
                        local officeFrame = jobUI:FindFirstChild("Container") and jobUI.Container:FindFirstChild("Office")
                        if officeFrame and officeFrame:FindFirstChild("Frame") then
                            local frame = officeFrame.Frame
                            while autoFarmOffice and frame:FindFirstChild("Question") do
                                local qText = frame.Question.Text
                                local num1, op, num2 = string.match(qText, "(%d+)%s*([%+%-])%s*(%d+)")
                                num1, num2 = tonumber(num1), tonumber(num2)

                                if num1 and num2 and op then
                                    local answer = (op == "+") and (num1 + num2) or (num1 - num2)
                                    frame.TextBox.Text = tostring(answer)
                                    firesignal(frame.SubmitButton.MouseButton1Click)
                                end

                                task.wait(0.5)
                            end
                        end
                    end

                    task.wait(1) -- jeda sebelum ulang
                end
            end)
        else
            -- Stop farm + keluar job
            game:GetService("ReplicatedStorage")
                :WaitForChild("NetworkContainer")
                :WaitForChild("RemoteEvents")
                :WaitForChild("Job")
                :FireServer("Unemployee")
        end
    end
})


OfficeSection:Toggle({
    Text = "Teleport",
    Callback = function(state)
        if state then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-1034.2, 263.5, 2250.5)
            end

            task.delay(2, function()
                TeleportBaristaToggle:Set(false)
            end)
        end
    end
})

OfficeSection:Toggle({    
    Text = "Job",
    Callback = function(state)
        local args = {}
        if state then
            args = { "Office" }
        else
            args = { "Unemployee" }
        end

        game:GetService("ReplicatedStorage")
            :WaitForChild("NetworkContainer")
            :WaitForChild("RemoteEvents")
            :WaitForChild("Job")
            :FireServer(unpack(args))
    end
})


local label = OfficeSection:Label({
    Text = "Jakarta Only",
    Color = Color3.fromRGB(217, 97, 99),
    Tooltip = "Jakarta Only"
})


--// Money
local MoneySelection = Tab:Section({
    Text = "Money"
})

MoneySelection:Label({
    Text = "Current Money : "
})

--// Other Tab
local Misc = Tab3:Section({ Text = "Misc" })

Misc:Slider({
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

Misc:Slider({
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

local Discord1 = Tab4:Section({
    Text = "Link"
})

Discord1:Button({
    Text = "https://discord.gg/jUeczsRh69",
    Callback = function()
        local link = "https://discord.gg/jUeczsRh69"

        -- Copy ke clipboard
        if setclipboard then
            setclipboard(link)
        end

        -- Buka link di browser / Discord app (kalau executor support)
        if syn and syn.request then
            syn.request({ Url = link, Method = "GET" })
        elseif request then
            request({ Url = link, Method = "GET" })
        end

        -- Notifikasi sukses
        Library:Notification({
            Text = "✅ Discord link copied to clipboard!",
            Duration = 3
        })
    end
})
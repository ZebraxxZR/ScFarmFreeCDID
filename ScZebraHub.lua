-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.550
Frame.Position = UDim2.new(0.0329972506, 0, 0.396508723, 0)
Frame.Size = UDim2.new(0, 200, 0, 200)

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = Frame

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.41, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(0.61, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
UIGradient.Rotation = 270
UIGradient.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Auto Farm CDID"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 20)
UICorner_2.Parent = TextLabel

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0, 0, 0.435000002, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "Start"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	local args = {
		[1] = "JanjiJiwa"
	}

	game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("Job"):FireServer(unpack(args))
	
	while wait() do
		local args = {
			[1] = "GetCoffee"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("JanjiJiwa"):FireServer(unpack(args))
		wait(16)
		local args = {
			[1] = "Delivery"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("NetworkContainer"):WaitForChild("RemoteEvents"):WaitForChild("JanjiJiwa"):FireServer(unpack(args))

	end
end)

UICorner_3.CornerRadius = UDim.new(0, 20)
UICorner_3.Parent = TextButton

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0, 0, 0.685000002, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = " "
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 14.000
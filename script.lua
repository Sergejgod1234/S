local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local backpack = player:WaitForChild("Backpack")

local seedList = {"TomatoSeed", "MoonMelonSeed", "ChocoBerrySeed"}

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SeedGiverUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = gui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 220, 0, 50)
button.Position = UDim2.new(0.5, -110, 0.85, -25)
button.Text = "🌻 Get Free Seeds"
button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Parent = screenGui

local function giveSeeds()
	for _, seedName in ipairs(seedList) do
		local seed = ReplicatedStorage:FindFirstChild(seedName)
		if seed and not backpack:FindFirstChild(seedName) then
			local clone = seed:Clone()
			clone.Parent = backpack
		end
	end
end

local clicked = false
button.MouseButton1Click:Connect(function()
	if clicked then return end
	clicked = true
	giveSeeds()
	button.Text = "✅ Seeds Added!"
	button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
	wait(2)
	screenGui:Destroy()
end)

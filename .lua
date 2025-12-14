repeat wait() until game:IsLoaded()

local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local humanoid = Char:WaitForChild("HumanoidRootPart")

local defaultSpeed = 16
local toggleSpeed = 100
local thirdSpeed = 69

local old
local Idk = false

old = hookmetamethod(game,"__index",function(self,key)
if self == humanoid and key == "WalkSpeed" then
return 16
end
return old(self,key)
end)

local function Gui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Light"
    screenGui.Parent = game:GetService("CoreGui")

    local Button = Instance.new("TextButton")
    Button.Name = "Yagami"
    Button.Text = "WS"
    Button.Size = UDim2.new(0, 200, 0, 50)
    Button.Position = UDim2.new(0.5, 0, 0.5, 0)
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.AnchorPoint = Vector2.new(0.5, 0.5)
    Button.Active = true
    Button.Draggable = true
    Button.TextScaled = true
    Button.Parent = screenGui

    local UI = Instance.new("UICorner")
    UI.CornerRadius = UDim.new(0, 10)
    Ui.Parent = Button

    return Button
end

local Button = Gui()

Button.MouseButton1Click:Connect(function()
    
    if Hum.WalkSpeed == defaultSpeed then
        Hum.WalkSpeed = toggleSpeed
        Button.Text = "On: " .. toggleSpeed

    elseif Hum.WalkSpeed == toggleSpeed then
        Hum.WalkSpeed = thirdSpeed
        Button.Text = "On: " .. thirdSpeed

    else
        Hum.WalkSpeed = defaultSpeed
        Button.Text = "Off: " .. defaultSpeed
    end
end)

print("Goofy nigger " .. game.Players.LocalPlayer.DisplayName)

-- Gui to Lua
local l = {game:GetService("Workspace").Axe.ClickDetector,game:GetService("Workspace").table2.Collar.collar.ClickDetector}
for i,v in pairs(workspace:GetDescendants()) do
if v.Parent:IsA("Tool") and v:IsA("ClickDetector") then table.insert(l,v) end end
local main = Instance.new("ScreenGui")
local _txtbox = Instance.new("TextBox")
local cmdframe = Instance.new("ScrollingFrame")
local txt = Instance.new("TextLabel")
local _close = Instance.new("TextButton")
local runservice = game:GetService("RunService")
local rustepped = runservice.Stepped
local ruhb = runservice.Heartbeat
local playerservice = game:GetService("Players")
local lp = playerservice.LocalPlayer
local ligma = game:GetService("Lighting")
local dv = true
local removeblindfold = true
--disable if you like the blindfold hat, you'll still see normally either way
main.Name = "main"
main.Parent = game:GetService("CoreGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_txtbox.Name = "_txtbox"
_txtbox.Parent = main
_txtbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_txtbox.BackgroundTransparency = 0.350
_txtbox.Draggable = true
_txtbox.Position = UDim2.new(0.61360544, 0, 0.0637362674, 0)
_txtbox.Size = UDim2.new(0.136734694, 0, 0.0802197829, 0)
_txtbox.Font = Enum.Font.SourceSans
_txtbox.PlaceholderText = "cmds r sus"
_txtbox.Text = ""
_txtbox.TextColor3 = Color3.fromRGB(255, 255, 255)
_txtbox.TextScaled = true
_txtbox.TextSize = 14.000
_txtbox.TextWrapped = true

cmdframe.Name = "cmdframe"
cmdframe.Active = false
cmdframe.Parent = main
cmdframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
cmdframe.Position = UDim2.new(0.376870751, 0, 0.309890121, 0)
cmdframe.Size = UDim2.new(0.245578229, 0, 0.376923114, 0)
cmdframe.Visible = false
cmdframe.CanvasSize = UDim2.new(0, 0, 0.529999971, 0)

txt.Name = "txt"
txt.Parent = cmdframe
txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txt.BackgroundTransparency = 1.000
txt.Position = UDim2.new(0, 0, -0.000313895056, 0)
txt.Size = UDim2.new(0.963989615, 0, 1.00031388, 0)
txt.Font = Enum.Font.SourceSans
txt.Text = [[version 1
[toggle] = use this command to enable/disable
commands:
choosinggui
-remove team choosing gui when joining game so you can be choosing team
weapons / wps
-get all known weapons
axe
-obv
cmds
sp
-loops set normal speed and jump power
rj
bpe
-loops enable backpack
-[toggle]
rp
-remove cuffs,rope,bag,blindfold,reset animation
-cuff removal is somewhat visual (still cant open doors)
-open gui > undo to actually get rid of cuffs
]]
txt.TextColor3 = Color3.fromRGB(255, 255, 255)
txt.TextSize = 14.000
txt.TextXAlignment = Enum.TextXAlignment.Left
txt.TextYAlignment = Enum.TextYAlignment.Top

_close.Name = "_close"
_close.Parent = main
_close.Active = false
_close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_close.Position = UDim2.new(0.376870751, 0, 0.686813176, 0)
_close.Size = UDim2.new(0.245578229, 0, 0.0582417585, 0)
_close.Visible = false
_close.Font = Enum.Font.SourceSans
_close.Text = "close"
_close.TextColor3 = Color3.fromRGB(255, 255, 255)
_close.TextSize = 14.000
local bpt = false
-- Scripts:
local function cd(x)
if x == nil then return "" end
local eNM = x:FindFirstChildOfClass("ClickDetector")
if eNM then return eNM else return "" end end
local function cmd(x)
x = x:lower() 
if string.sub(x,1,11) == "choosinggui" then
local vsb = lp.PlayerGui.Menu:FindFirstChild("TeamMenu")
if not vsb then return end
vsb.Visible = not vsb.Visible
elseif string.sub(x,1,7) == "weapons" or string.sub(x,1,3) == "wps" then
for i,v in pairs(l) do
fireclickdetector(v)
end
elseif string.sub(x,1,3) == "bpe" then
bpt = not bpt
coroutine.wrap(function() local sg = game:GetService("StarterGui") while wait(0.4) and bpt == true do sg:SetCoreGuiEnabled("Backpack", true) end end)()
elseif string.sub(x,1,3) == "axe" then
fireclickdetector(l[1])
elseif string.sub(x,1,2) == "rp" then
local ch = lp.Character
if not ch then return end
local hd,la,ra = ch:FindFirstChild("Head"),ch:FindFirstChild("Left Arm"),ch:FindFirstChild("Right Arm")
if not hd then return end
if la ~= nil then
for i,v in pairs(la:GetChildren()) do if v.Name:lower() == "cuff" then v:Destroy() end end
end
if ra ~= nil then
for i,v in pairs(ra:GetChildren()) do if v.Name:lower() == "cuff" then v:Destroy() end end
end
for i,v in pairs(ch:GetChildren()) do if v.Name:lower() == "ropepart" or v.Name:lower() == "blindfold" and removeblindfold then v:Destroy() end end
for i,v in pairs(hd:GetChildren()) do if v.Name:lower() == "bag" then v:Destroy() end end
if ligma:FindFirstChildOfClass("ColorCorrection") then ligma:FindFirstChildOfClass("ColorCorrection"):Destroy() end
if ligma:FindFirstChildOfClass("BlurEffect") then ligma:FindFirstChildOfClass("BlurEffect"):Destroy() end
pcall(function()
local hm = ch:FindFirstChildOfClass("Humanoid")
if ch:FindFirstChild("Animate") then ch.Animate.Disabled = true for i,v in ipairs(hm:GetPlayingAnimationTracks()) do v:Stop() end ch.Animate.Disabled = false end
hm.WalkSpeed = 16
hm.JumpPower = 50
hm.AutoRotate = true
end)
elseif string.sub(x,1,2) == "sp" then
--stolen from infinite yield
local mychar = lp.Character or lp.CharacterAdded:Wait()
local hum = mychar:WaitForChild("Humanoid",500)
if not hum then return end
local function wpc()
if hum then
hum.WalkSpeed = 26
hum.JumpPower = 50
end
end
wpc()
hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wpc)
hum:GetPropertyChangedSignal("JumpPower"):Connect(wpc)
lp.CharacterAdded:Connect(function(ch)
mychar = ch
hum = mychar:WaitForChild("Humanoid",1000)
if not hum then return end
hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wpc)
hum:GetPropertyChangedSignal("JumpPower"):Connect(wpc)
end)
elseif string.sub(x,1,2) == "rj" then
	--stolen from infinite yield
	if #playerservice:GetPlayers() <= 1 then
		playerservice.LocalPlayer:Kick("\nRejoining...")
		if dv == false then
		wait(0.50)
		else
		Wait(0.50)
		end
		game:GetService('TeleportService'):Teleport(game.PlaceId, lplr)
	else
		game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, lplr)
	end
elseif string.sub(x,1,4) == "cmds" then
		_close.Active = not _close.Active
		cmdframe.Active = not cmdframe.Active
		_close.Visible = not _close.Visible
		cmdframe.Visible = not cmdframe.Visible
end
end
local function OVTEMO_fake_script() -- _txtbox.txt 
	local script = Instance.new('LocalScript', _txtbox)

	local function onfocus(x)
		if x then
			cmd(_txtbox.Text:lower())
		end
	end
	_txtbox.FocusLost:Connect(onfocus)
end
coroutine.wrap(OVTEMO_fake_script)()
local function ZURHG_fake_script() -- _close.LocalScript 
	local script = Instance.new('LocalScript', _close)
	local function onclick()
		_close.Active = not _close.Active
		cmdframe.Active = not cmdframe.Active
		_close.Visible = not _close.Visible
		cmdframe.Visible = not cmdframe.Visible
	end
	_close.MouseButton1Click:Connect(onclick)
end
coroutine.wrap(ZURHG_fake_script)()
local us = game:GetService("UserInputService")
local function stfu()
_txtbox.Text = ""
end
local function onkeydown(x)
local txtfocused = us:GetFocusedTextBox()
if txtfocused then return end
if x.KeyCode == Enum.KeyCode.BackSlash then
_txtbox:CaptureFocus()
task.defer(stfu,"")
end
end
us.InputBegan:Connect(onkeydown)
game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "cmds r sus";
Text = "loaded"; -- bottom text uwu
Icon = "rbxassetid://6678521436";
Duration = 5;
})

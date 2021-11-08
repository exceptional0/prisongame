-- Gui to Lua
-- for notepad++ search indexing: tyrone.lua
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
local is,uc = game:GetService("ReplicatedStorage").IsHog,game:GetService("ReplicatedStorage").UnCuffed
local dv = true
local removeblindfold = true
local deb = game:GetService("Debris")
local con,con1,cont = nil,nil,false
local con2,con3,con4,cont2 = nil,nil,nil,false
local gp = playerservice.GetPlayers
local vvv,vvvv = "Grab","Drop"
local vvvvvv = game:GetService("ReplicatedStorage").Grab
local fuck = game:GetService("ReplicatedStorage").Tase
local hastbc,cbtT = false,false
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
cmdframe.CanvasSize = UDim2.new(0, 0, 0.829999971, 0)

txt.Name = "txt"
txt.Parent = cmdframe
txt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txt.BackgroundTransparency = 1.000
txt.Position = UDim2.new(0, 0, -0.000313895056, 0)
txt.Size = UDim2.new(0.963989615, 0, 1.00031388, 0)
txt.Font = Enum.Font.SourceSans
txt.Text = [[version 5, made by incursion#5788
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
-[toggle]
rj
bpe
-[toggle]
-loops enable backpack
cbt
-loop grab and drop all
-like spamming tp all me in admin game
-[toggle]
rp / rs
arp (auto, [toggle])
-remove cuffs,rope,bag,blindfold,reset animation
-may unragdoll you (idk, sometimes did)
-cuff removal is sometimes visual only (still cant open doors)
-open gui > undo to actually get rid of cuffs if this happens
prisoner
guard
fugitive
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
elseif x == "cbt" then
cbtT = not cbtT
print(cbtT)
coroutine.wrap(function()
while wait() and cbtT == true do
for i,v in pairs(gp(playerservice)) do
local vv = v.Character
if vv ~= nil and vv.Name ~= lp.Name then
vvvvvv:FireServer(vv,vvv)
vvvvvv:FireServer(vv,vvvv)
end
end
end
end)()
--[[
elseif x == "tbc" then
hastbc = not hastbc
coroutine.wrap(function()
while wait() and hastbc == true do
local ch = lp.Character or lp.CharacterAdded:Wait()
tazer = ch:FindFirstChild("Taser")
for _,v in pairs(gp(playerservice)) do
coroutine.wrap(function()
local victim = v.Character
if victim ~= nil and victim ~= ch and tazer ~= nil then
fuck:FireServer(lp, victim, tazer)
end
end)()
end
end
end)()
--]]
elseif x == "iy" then
coroutine.wrap(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)()
elseif x == "bpe" then
bpt = not bpt
coroutine.wrap(function() local sg = game:GetService("StarterGui") while wait(0.25) and bpt == true do sg:SetCoreGuiEnabled("Backpack", true) end end)()
elseif x == "axe" then
fireclickdetector(l[1])
elseif x == "prisoner" or x == "pr" then
lp.PlayerGui.TeamChangePrisoner.Frame.Visible = true
elseif x == "guard" or x == "gd" then
lp.PlayerGui.TeamChangePolice.Frame.Visible = true
elseif x == "fugitive" then
lp.PlayerGui.TeamChangeFugitive.Frame.Visible = true
elseif x == "arp" then
local tbm = {"ropepart","cuff"}
cont = not cont
local function cn()
local ch = lp.Character
if not ch then return end
con = ch.DescendantAdded:Connect(function(m)
if table.find(tbm,m.Name:lower()) and cont == true or m.Name:lower() == "bag" and not m:IsA("Tool") and not m:FindFirstAncestorOfClass("Tool") and cont == true then
task.wait(0.5)
task.defer(cmd,"rp")
elseif cont == false then
pcall(function()
con:Disconnect()
con1:Disconnect()
con = nil
con1 = nil
end)
end
end)
end
cn()
con1 = lp.CharacterAdded:Connect(cn)
elseif string.sub(x,1,2) == "rp" or string.sub(x,1,2) == "rs" then
for i = 1,2 do
local ch = lp.Character
if not ch then return end
for i = 1,2 do
is:FireServer(ch,"UnHog")
firesignal(lp.PlayerGui.Avatar.Undo.MouseButton1Click)
task.defer(function()
task.wait(0.55)
uc:FireServer(ch)
end,nil)
end
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
if ligma:FindFirstChildOfClass("ColorCorrectionEffect") then deb:AddItem(ligma:FindFirstChildOfClass("ColorCorrectionEffect"),0) end
if ligma:FindFirstChildOfClass("BlurEffect") then deb:AddItem(ligma:FindFirstChildOfClass("BlurEffect"),0) end
local hm = ch:FindFirstChildOfClass("Humanoid")
if hm == nil then return end
if ch:FindFirstChild("Animate") then ch.Animate.Disabled = true for i,v in ipairs(hm:GetPlayingAnimationTracks()) do v:Stop() end ch.Animate.Disabled = false end
hm.WalkSpeed = 16
hm.JumpPower = 50
hm.AutoRotate = true
task.wait(0.3)
end
elseif string.sub(x,1,2) == "sp" then
--stolen from infinite yield
cont2 = not cont2
local mychar = lp.Character or lp.CharacterAdded:Wait()
local hum = mychar:WaitForChild("Humanoid",500)
if not hum or cont2 == false then if con2 ~= nil then con2:Disconnect() end if con3 ~= nil then con3:Disconnect() end if con4 ~= nil then con4:Disconnect() end return end
local function wpc()
if hum and cont2 == true then
hum.WalkSpeed = 26
hum.JumpPower = 50
end
end
wpc()
con2 = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wpc)
con3 = hum:GetPropertyChangedSignal("JumpPower"):Connect(wpc)
con4 = lp.CharacterAdded:Connect(function(ch)
mychar = ch
hum = mychar:WaitForChild("Humanoid",1000)
if not hum then return end
con2 = hum:GetPropertyChangedSignal("WalkSpeed"):Connect(wpc)
con3 = hum:GetPropertyChangedSignal("JumpPower"):Connect(wpc)
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
main = nil

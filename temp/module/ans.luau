--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
local v1 = {}
local v_u_2 = game.ReplicatedStorage.Events:WaitForChild("AudioTimePosEvent")
function v1.Initiate(p_u_3, _, _, p_u_4, p_u_5, p_u_6, _, p_u_7, p8, p_u_9, p10, _, p_u_11)
	-- upvalues: (copy) v_u_2
	wait(0.1)
	local v_u_12
	if p_u_3:GetAttribute("GrenadeAmmo") == nil then
		v_u_12 = nil
	else
		v_u_12 = require(game.ReplicatedStorage.Modules.TS_Shared.GL)
	end
	local v_u_13 = p_u_3:GetAttribute("MaxAmmo")
	local v_u_14 = game.Players.LocalPlayer
	local v_u_15 = v_u_14:GetMouse()
	local v_u_16 = false
	local v_u_17 = nil
	local v_u_18 = nil
	local v_u_19 = game:GetService("UserInputService")
	local v_u_20 = game:GetService("RunService").RenderStepped
	local v_u_21 = v_u_14:WaitForChild("PlayerGui"):WaitForChild("Ammo")
	local v_u_22 = v_u_14:WaitForChild("PlayerGui"):WaitForChild("Client"):WaitForChild("Advice"):WaitForChild("Gun")
	local v_u_23 = nil
	local v_u_24 = v_u_14.Character
	local v_u_25 = 0
	local v_u_26 = p_u_3:WaitForChild("Handle"):WaitForChild("Fire")
	local v_u_27 = p_u_3:WaitForChild("Handle"):WaitForChild("Fire2")
	local v_u_28 = v_u_26.Volume
	local v_u_29 = v_u_27.Volume
	local v_u_30 = p10 or 1
	local v_u_31 = p8 or 6.874
	local v_u_32 = tick()
	local v_u_33 = p_u_3:GetAttribute("Ammo")
	p_u_3:GetAttributeChangedSignal("Ammo"):Connect(function()
		-- upvalues: (ref) v_u_33, (copy) p_u_3, (copy) v_u_21, (copy) v_u_14, (copy) p_u_9
		v_u_33 = p_u_3:GetAttribute("Ammo")
		v_u_21.Frame.amt.Text = v_u_33 .. "/" .. v_u_14.PlayerData[p_u_9].Value
	end)
	local v_u_34 = false
	local v35 = nil
	local v_u_36
	if p_u_7 == 1 then
		v_u_36 = {
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARHold),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARFire),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleDraw),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleReload),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSights),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSightsFire)
		}
	elseif p_u_7 == 2 then
		v_u_36 = {
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolHold),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolFire),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolDraw),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolReload),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSights),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSightsFire)
		}
	else
		v_u_36 = p_u_7 == 3 and {
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.BallFistIdle),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.BallFistFire),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolDraw),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleReload),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSights),
			v_u_24.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSightsFire)
		} or v35
	end
	local function v37()
		-- upvalues: (ref) v_u_34, (ref) v_u_2, (copy) v_u_27, (copy) v_u_26, (ref) v_u_31
		if v_u_34 then
			v_u_2:FireServer("SetTime", v_u_27, 10.7)
			v_u_27.TimePosition = 10.7
			v_u_2:FireServer("SetTime", v_u_26, v_u_31)
			v_u_26.TimePosition = v_u_31
		end
		v_u_34 = false
	end
	local function v_u_38()
		-- upvalues: (ref) v_u_34, (ref) v_u_33, (copy) v_u_26, (ref) v_u_2, (copy) v_u_27, (copy) v_u_14, (ref) v_u_32, (copy) p_u_4, (copy) p_u_3, (ref) v_u_36, (copy) v_u_30, (copy) v_u_15, (copy) p_u_5, (copy) p_u_6, (copy) p_u_11, (ref) v_u_31
		if v_u_34 and (v_u_33 > 0 and v_u_26.TimePosition >= 6.915) then
			v_u_2:FireServer("SetTime", v_u_26, 0.046)
			v_u_2:FireServer("SetTime", v_u_27, 0.046)
		end
		if v_u_34 and (v_u_14.Character.Humanoid.Health > 0 and p_u_4 <= tick() - v_u_32) then
			v_u_32 = tick()
			v_u_33 = v_u_33 - 1
			p_u_3.Handle.Attachment["1"]:Emit(p_u_3.Handle.Attachment["1"].Rate)
			p_u_3.Handle.Attachment["2"]:Emit(p_u_3.Handle.Attachment["2"].Rate)
			p_u_3.Handle.Attachment.PointLight.Range = math.random(6, 12)
			p_u_3.Handle.Attachment.PointLight.Enabled = true
			if v_u_36[5].IsPlaying then
				v_u_36[6]:Play()
			else
				v_u_36[2]:Play()
			end
			_G.AHS(1)
			_G.CSH("SoftRecoil", true)
			for _ = 1, v_u_30 do
				_G.FR(v_u_15.Hit.p, p_u_5, p_u_6, p_u_11, v_u_30)
			end
			if v_u_33 == 0 then
				if v_u_34 then
					v_u_2:FireServer("SetTime", v_u_27, 10.7)
					v_u_27.TimePosition = 10.7
					v_u_2:FireServer("SetTime", v_u_26, v_u_31)
					v_u_26.TimePosition = v_u_31
				end
				v_u_34 = false
			end
		end
		if tick() - v_u_32 >= 0.1 then
			p_u_3.Handle.Attachment.PointLight.Enabled = false
		end
	end
	local function v39()
		-- upvalues: (copy) v_u_14, (copy) v_u_21, (ref) v_u_33, (ref) v_u_16, (ref) v_u_25, (ref) v_u_34, (ref) v_u_2, (copy) v_u_26, (copy) v_u_27
		if v_u_14.Job.Value == "Ghost" or (v_u_14.Job.Value == "Zombie" or (v_u_14.Job.Value == "Dog" or v_u_14.Job.Value == "Hobo")) then
			game.ReplicatedStorage.Events.Note:Fire(v_u_14.Job.Value .. " cant use guns", "This job cant use ranged weapons")
			return
		elseif v_u_14.Character:GetAttribute("Ghosted") then
			return
		elseif v_u_14.Disguise.Value == nil then
			v_u_21.Frame.warn.Visible = v_u_14.PlayerData.Karma.Value < 0
			if v_u_14.Character.Humanoid.Health > 0 and (v_u_33 > 0 and not v_u_16) then
				if tick() - v_u_25 < 0.5 then
					return
				end
				v_u_34 = true
				v_u_2:FireServer("SetTime", v_u_26, 0)
				v_u_2:FireServer("SetTime", v_u_27, 0)
				v_u_2:FireServer("Play", v_u_26)
				if v_u_14.Flagged.Value then
					v_u_2:FireServer("Play", v_u_27)
				end
			end
		else
			game.ReplicatedStorage.Events.Note:Fire("Can\'t Attack when Disguied", "You cannot shoot or swing when using a disguise kit")
		end
	end
	local function v_u_41(p40)
		-- upvalues: (copy) v_u_19, (ref) v_u_16, (copy) v_u_14, (copy) p_u_9, (ref) v_u_33, (ref) v_u_13, (ref) v_u_36, (ref) v_u_34, (ref) v_u_2, (copy) v_u_27, (copy) v_u_26, (ref) v_u_31, (copy) p_u_3, (ref) v_u_12
		if v_u_19:GetFocusedTextBox() == nil then
			if p40.KeyCode == Enum.KeyCode.R and (v_u_19:GetFocusedTextBox() == nil and (not v_u_16 and (v_u_14.PlayerData[p_u_9].Value > 0 and v_u_33 ~= v_u_13))) then
				v_u_16 = true
				v_u_36[4]:Play(0.4)
				if v_u_34 then
					v_u_2:FireServer("SetTime", v_u_27, 10.7)
					v_u_27.TimePosition = 10.7
					v_u_2:FireServer("SetTime", v_u_26, v_u_31)
					v_u_26.TimePosition = v_u_31
				end
				v_u_34 = false
				wait(0.4)
				p_u_3.Handle.Reload:Play()
				wait(1.6)
				game.ReplicatedStorage.Events.WeaponReloadEvent:FireServer(p_u_9, v_u_13 - v_u_33, p_u_3)
				v_u_16 = false
				v_u_36[4]:Stop(0.5)
				return
			end
			if p40.KeyCode == Enum.KeyCode.F and not v_u_16 then
				if v_u_12 then
					v_u_12.FireGrenade(p_u_3, v_u_36[2])
					return
				end
			elseif p40.UserInputType == Enum.UserInputType.MouseButton2 and (not v_u_16 and _G.GunAimEnabled) then
				v_u_36[5]:Play(0.2)
				_G.SetGunAim(true)
			end
		end
	end
	local function v_u_43(p42)
		-- upvalues: (copy) v_u_19, (ref) v_u_36
		if v_u_19:GetFocusedTextBox() == nil and p42.UserInputType == Enum.UserInputType.MouseButton2 then
			v_u_36[5]:Stop(0.25)
			_G.SetGunAim(false)
		end
	end
	local function v44()
		-- upvalues: (copy) v_u_15, (copy) v_u_26, (copy) v_u_14, (copy) v_u_28, (copy) v_u_27, (ref) v_u_36, (ref) v_u_17, (copy) v_u_19, (copy) v_u_41, (ref) v_u_18, (copy) v_u_43, (ref) v_u_23, (copy) v_u_20, (copy) v_u_38, (copy) p_u_3, (copy) v_u_22, (copy) p_u_9, (copy) v_u_21, (copy) v_u_24, (ref) v_u_33, (copy) p_u_7, (ref) v_u_25
		v_u_15.Icon = "rbxassetid://2872049636"
		v_u_26.Parent = v_u_14.PlayerGui.Client
		v_u_26.Volume = v_u_28 * 0.65
		v_u_27.Parent = v_u_14.PlayerGui.Client
		v_u_27.Volume = 0
		v_u_36[1]:Play()
		v_u_17 = v_u_19.InputBegan:connect(v_u_41)
		v_u_18 = v_u_19.InputEnded:connect(v_u_43)
		v_u_23 = v_u_20:connect(v_u_38)
		game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(true, p_u_3.Name)
		v_u_22.Visible = true
		if p_u_9 ~= nil then
			v_u_21.Adornee = v_u_24.RightHand
			v_u_21.Enabled = true
			v_u_21.Frame.type.Text = p_u_9
			v_u_21.Frame.amt.Text = v_u_33 .. "/" .. v_u_14.PlayerData[p_u_9].Value
			v_u_21.Frame.warn.Visible = v_u_14.PlayerData.Karma.Value < 0
		end
		if p_u_7 == 3 and not v_u_14.Character.Util:FindFirstChild("Ballistic Fist") then
			game.ReplicatedStorage.Events.VGE:FireServer(4)
		end
		v_u_36[3]:Play(0)
		v_u_25 = tick()
		wait(0.18)
		v_u_36[3]:Stop(0.2)
	end
	local function v46()
		-- upvalues: (copy) v_u_15, (ref) v_u_34, (ref) v_u_2, (copy) v_u_27, (copy) v_u_26, (ref) v_u_31, (copy) p_u_3, (ref) v_u_36, (ref) v_u_17, (ref) v_u_18, (ref) v_u_23, (copy) v_u_22, (copy) v_u_21, (copy) v_u_28, (copy) v_u_29
		v_u_15.Icon = "rbxasset://textures/ArrowFarCursor.png"
		if v_u_34 then
			v_u_2:FireServer("SetTime", v_u_27, 10.7)
			v_u_27.TimePosition = 10.7
			v_u_2:FireServer("SetTime", v_u_26, v_u_31)
			v_u_26.TimePosition = v_u_31
		end
		v_u_34 = false
		game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(false, p_u_3.Name)
		for v45 = 1, #v_u_36 do
			v_u_36[v45]:Stop()
		end
		if v_u_17 ~= nil then
			v_u_17:disconnect()
			v_u_17 = nil
		end
		if v_u_18 ~= nil then
			v_u_18:disconnect()
			v_u_18 = nil
		end
		if v_u_23 ~= nil then
			v_u_23:disconnect()
			v_u_23 = nil
		end
		v_u_22.Visible = false
		v_u_21.Enabled = false
		_G.SetGunAim(false)
		v_u_26.Parent = p_u_3.Handle
		v_u_26.Volume = v_u_28
		v_u_27.Parent = p_u_3.Handle
		v_u_27.Volume = v_u_29
	end
	p_u_3.Activated:connect(v39)
	p_u_3.Deactivated:Connect(v37)
	p_u_3.Equipped:connect(v44)
	p_u_3.Unequipped:connect(v46)
end
return v1

-- // Function Dumper made by King.Kevin
-- // Script Path: ReplicatedStorage.Modules.TS.ANS

--[[
Function Dump: Initiate

Function Upvalues: Initiate
		1 [Instance] = AudioTimePosEvent

Function Constants: Initiate
		1 [string] = wait
		2 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		3 [number] = 0.1
		4 [string] = GrenadeAmmo
		5 [string] = GetAttribute
		6 [string] = require
		7 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		8 [string] = game
		9 [Instance] = Ugc
		10 [string] = ReplicatedStorage
		11 [string] = Modules
		12 [string] = TS_Shared
		13 [string] = GL
		14 [string] = MaxAmmo
		15 [string] = Players
		16 [string] = LocalPlayer
		17 [string] = GetMouse
		18 [string] = UserInputService
		19 [string] = GetService
		20 [string] = RunService
		21 [string] = RenderStepped
		22 [string] = PlayerGui
		23 [string] = WaitForChild
		24 [string] = Ammo
		25 [string] = Client
		26 [string] = Advice
		27 [string] = Gun
		28 [string] = Character
		29 [string] = Handle
		30 [string] = Fire
		31 [string] = Fire2
		32 [string] = Volume
		33 [number] = 1
		34 [number] = 6.874
		35 [string] = tick
		36 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		37 [string] = GetAttributeChangedSignal
		38 [string] = Connect
		39 [string] = Humanoid
		40 [string] = Animations
		41 [string] = Tools
		42 [string] = ARHold
		43 [string] = LoadAnimation
		44 [string] = ARFire
		45 [string] = RifleDraw
		46 [string] = RifleReload
		47 [string] = RifleAimSights
		48 [string] = RifleAimSightsFire
		49 [number] = 2
		50 [string] = PistolHold
		51 [string] = PistolFire
		52 [string] = PistolDraw
		53 [string] = PistolReload
		54 [string] = PistolAimSights
		55 [string] = PistolAimSightsFire
		56 [number] = 3
		57 [string] = BallFistIdle
		58 [string] = BallFistFire
		59 [string] = Activated
		60 [string] = connect
		61 [string] = Deactivated
		62 [string] = Equipped
		63 [string] = Unequipped

====================================================================================================

Function Dump: Activate

Function Upvalues: Activate
		1 [Instance] = XxXFATHER_VONXxX
		2 [Instance] = Ammo
		3 [number] = 11
		4 [boolean] = false
		5 [number] = 1751767986.8345485
		6 [boolean] = false
		7 [Instance] = AudioTimePosEvent
		8 [Instance] = Fire
		9 [Instance] = Fire2

Function Constants: Activate
		1 [string] = Job
		2 [string] = Value
		3 [string] = Ghost
		4 [string] = Zombie
		5 [string] = Dog
		6 [string] = Hobo
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = ReplicatedStorage
		10 [string] = Events
		11 [string] = Note
		12 [string] =  cant use guns
		13 [string] = This job cant use ranged weapons
		14 [string] = Fire
		15 [string] = Character
		16 [string] = Ghosted
		17 [string] = GetAttribute
		18 [string] = Disguise
		19 [string] = Can't Attack when Disguied
		20 [string] = You cannot shoot or swing when using a disguise kit
		21 [string] = Frame
		22 [string] = warn
		23 [string] = PlayerData
		24 [string] = Karma
		25 [string] = Visible
		26 [string] = Humanoid
		27 [string] = Health
		28 [string] = tick
		29 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		30 [number] = 0.5
		31 [string] = SetTime
		32 [string] = FireServer
		33 [string] = Play
		34 [string] = Flagged

====================================================================================================

Function Dump: Equipped

Function Upvalues: Equipped
		1 [Instance] = Instance
		2 [Instance] = Fire
		3 [Instance] = XxXFATHER_VONXxX
		4 [number] = 2.5999999046325684
		5 [Instance] = Fire2
		6 [table]:
		6 [table] table: 0x92cdf02125f8e45b
				1 [Instance] = ARHold
				2 [Instance] = ARFire
				3 [Instance] = RifleDraw
				4 [Instance] = RifleReload
				5 [Instance] = RifleAimSights
				6 [Instance] = RifleAimSightsFire
		8 [Instance] = UserInputService
		9 [function] = InputFunction
		11 [function] = InputFunctionEnded
		13 [RBXScriptSignal] = Signal RenderStepped
		14 [function] = RenderedF
		15 [Instance] = M4
		16 [Instance] = Gun
		17 [string] = Rifle Ammo
		18 [Instance] = Ammo
		19 [Instance] = XxXFATHER_VONXxX
		20 [number] = 11
		21 [number] = 1
		22 [number] = 1751767986.8345485

Function Constants: Equipped
		1 [string] = rbxassetid://2872049636
		2 [string] = Icon
		3 [string] = PlayerGui
		4 [string] = Client
		5 [string] = Parent
		6 [number] = 0.65
		7 [string] = Volume
		8 [string] = Play
		9 [string] = InputBegan
		10 [string] = connect
		11 [string] = InputEnded
		12 [string] = game
		13 [Instance] = Ugc
		14 [string] = ReplicatedStorage
		15 [string] = Events
		16 [string] = WeaponBackEvent
		17 [string] = Name
		18 [string] = FireServer
		19 [string] = Visible
		20 [string] = RightHand
		21 [string] = Adornee
		22 [string] = Enabled
		23 [string] = Frame
		24 [string] = type
		25 [string] = Text
		26 [string] = amt
		27 [string] = /
		28 [string] = PlayerData
		29 [string] = Value
		30 [string] = warn
		31 [string] = Karma
		32 [number] = 3
		33 [string] = Character
		34 [string] = Util
		35 [string] = Ballistic Fist
		36 [string] = FindFirstChild
		37 [string] = VGE
		38 [string] = tick
		39 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		40 [string] = wait
		41 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		42 [number] = 0.18
		43 [number] = 0.2
		44 [string] = Stop

====================================================================================================

Function Dump: stopFiringSound

Function Upvalues: stopFiringSound
		1 [boolean] = false
		2 [Instance] = AudioTimePosEvent
		3 [Instance] = Fire2
		4 [Instance] = Fire
		5 [number] = 4.206

Function Constants: stopFiringSound
		1 [string] = SetTime
		2 [number] = 10.7
		3 [string] = FireServer
		4 [string] = TimePosition

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [number] = 11
		2 [Instance] = M4
		3 [Instance] = Ammo
		4 [Instance] = XxXFATHER_VONXxX
		5 [string] = Rifle Ammo

Function Constants: Unknown Name
		1 [string] = Ammo
		2 [string] = GetAttribute
		3 [string] = Frame
		4 [string] = amt
		5 [string] = /
		6 [string] = PlayerData
		7 [string] = Value
		8 [string] = Text

====================================================================================================

Function Dump: InputFunction

Function Upvalues: InputFunction
		1 [Instance] = UserInputService
		2 [boolean] = false
		3 [Instance] = XxXFATHER_VONXxX
		4 [string] = Rifle Ammo
		5 [number] = 11
		6 [number] = 25
		7 [table] (Recursive table detected)
		8 [boolean] = false
		9 [Instance] = AudioTimePosEvent
		10 [Instance] = Fire2
		11 [Instance] = Fire
		12 [number] = 4.206
		13 [Instance] = M4

Function Constants: InputFunction
		1 [string] = GetFocusedTextBox
		2 [string] = KeyCode
		3 [string] = Enum
		4 [string] = R
		5 [EnumItem] = Enum.KeyCode.R
		6 [string] = PlayerData
		7 [string] = Value
		8 [number] = 0.4
		9 [string] = Play
		10 [string] = SetTime
		11 [number] = 10.7
		12 [string] = FireServer
		13 [string] = TimePosition
		14 [string] = wait
		15 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		16 [string] = Handle
		17 [string] = Reload
		18 [number] = 1.6
		19 [string] = game
		20 [Instance] = Ugc
		21 [string] = ReplicatedStorage
		22 [string] = Events
		23 [string] = WeaponReloadEvent
		24 [number] = 0.5
		25 [string] = Stop
		26 [string] = F
		27 [EnumItem] = Enum.KeyCode.F
		28 [string] = FireGrenade
		29 [string] = UserInputType
		30 [string] = MouseButton2
		31 [EnumItem] = Enum.UserInputType.MouseButton2
		32 [string] = GunAimEnabled
		33 [string] = _G
		34 [table]:
		34 [table] table: 0xc1df70a7914da3db
				1 [function] = ShovelGlowFXToggle
				2 [boolean] = false
				3 [function] = Unknown Name
				4 [function] = CastEffect
				5 [function] = Unknown Name
				6 [function] = Unknown Name
				7 [function] = ThievesCaneFX
				8 [boolean] = false
				9 [function] = StartShopTween
				10 [function] = scavengeFX
				11 [boolean] = false
				12 [function] = Unknown Name
				13 [function] = ToggleOwlMode
				14 [function] = NevermoreFX
				15 [function] = FireVisual
				16 [function] = GunCaneFXToggle
				17 [function] = Unknown Name
				18 [function] = Unknown Name
				19 [function] = Unknown Name
				20 [function] = Unknown Name
				21 [function] = CreateParticle
				22 [function] = Unknown Name
				23 [function] = Unknown Name
				24 [function] = Unknown Name
				25 [boolean] = true
				26 [function] = AimDownLock
				27 [number] = 25
				28 [function] = FireRay2
				29 [function] = OpenScav
				30 [function] = OpenDisguise
				31 [function] = Unknown Name
				32 [function] = Unknown Name
				33 [function] = Unknown Name
				34 [function] = AxeThrowFXToggle
				35 [function] = FireRay
				36 [function] = SnowBallFX
				37 [function] = Triggered
				38 [function] = Unknown Name
				39 [function] = Unknown Name
				40 [boolean] = false
		35 [number] = 0.2
		36 [string] = SetGunAim

====================================================================================================

Function Dump: InputFunctionEnded

Function Upvalues: InputFunctionEnded
		1 [Instance] = UserInputService
		2 [table] (Recursive table detected)

Function Constants: InputFunctionEnded
		1 [string] = GetFocusedTextBox
		2 [string] = UserInputType
		3 [string] = Enum
		4 [string] = MouseButton2
		5 [EnumItem] = Enum.UserInputType.MouseButton2
		6 [number] = 0.25
		7 [string] = Stop
		8 [string] = SetGunAim
		9 [string] = _G
		10 [table] (Recursive table detected)

====================================================================================================

Function Dump: Unequip

Function Upvalues: Unequip
		1 [Instance] = Instance
		2 [boolean] = false
		3 [Instance] = AudioTimePosEvent
		4 [Instance] = Fire2
		5 [Instance] = Fire
		6 [number] = 4.206
		7 [Instance] = M4
		8 [table] (Recursive table detected)
		12 [Instance] = Gun
		13 [Instance] = Ammo
		14 [number] = 2.5999999046325684
		15 [number] = 1.5

Function Constants: Unequip
		1 [string] = rbxasset://textures/ArrowFarCursor.png
		2 [string] = Icon
		3 [string] = SetTime
		4 [number] = 10.7
		5 [string] = FireServer
		6 [string] = TimePosition
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = ReplicatedStorage
		10 [string] = Events
		11 [string] = WeaponBackEvent
		12 [string] = Name
		13 [string] = Stop
		14 [string] = disconnect
		15 [string] = Visible
		16 [string] = Enabled
		17 [string] = SetGunAim
		18 [string] = _G
		19 [table] (Recursive table detected)
		20 [string] = Handle
		21 [string] = Parent
		22 [string] = Volume

====================================================================================================

Function Dump: RenderedF

Function Upvalues: RenderedF
		1 [boolean] = false
		2 [number] = 11
		3 [Instance] = Fire
		4 [Instance] = AudioTimePosEvent
		5 [Instance] = Fire2
		6 [Instance] = XxXFATHER_VONXxX
		7 [number] = 1751767992.7824018
		8 [number] = 0.12
		9 [Instance] = M4
		10 [table] (Recursive table detected)
		11 [number] = 1
		12 [Instance] = Instance
		13 [number] = 26
		14 [number] = 5
		16 [number] = 4.206

Function Constants: RenderedF
		1 [string] = TimePosition
		2 [number] = 6.915
		3 [string] = SetTime
		4 [number] = 0.046
		5 [string] = FireServer
		6 [string] = Character
		7 [string] = Humanoid
		8 [string] = Health
		9 [string] = tick
		10 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		11 [number] = 1
		12 [string] = 1
		13 [string] = Handle
		14 [string] = Attachment
		15 [string] = Rate
		16 [string] = Emit
		17 [string] = 2
		18 [string] = PointLight
		19 [string] = math
		20 [string] = random
		21 [userdata] = userdata: 0xd31f50fcf6c7bd4b
		22 [string] = Range
		23 [string] = Enabled
		24 [string] = IsPlaying
		25 [string] = Play
		26 [string] = AHS
		27 [string] = _G
		28 [table] (Recursive table detected)
		29 [string] = CSH
		30 [string] = SoftRecoil
		31 [string] = FR
		32 [string] = Hit
		33 [string] = p
		34 [number] = 0
		35 [number] = 10.7
		36 [number] = 0.1

====================================================================================================
]]

--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
return {
	["Initiate"] = function(p_u_1, _, p_u_2, p_u_3, p_u_4, p_u_5, p_u_6, _, _, p_u_7, p_u_8, p9, _)
		wait(0.1)
		if p_u_1:GetAttribute("GrenadeAmmo") ~= nil then
			require(game.ReplicatedStorage.Modules.TS_Shared.GL)
		end
		local v_u_10 = game.Players.LocalPlayer
		local v_u_11 = v_u_10:GetMouse()
		local v_u_12 = false
		local v_u_13 = nil
		local v_u_14 = nil
		local v_u_15 = game:GetService("UserInputService")
		local v_u_16 = v_u_10:WaitForChild("PlayerGui"):WaitForChild("Ammo")
		local v_u_17 = v_u_10:WaitForChild("PlayerGui"):WaitForChild("Client"):WaitForChild("Advice"):WaitForChild("Gun")
		local v_u_18 = v_u_10.Character
		local v_u_19 = 0
		local v_u_20 = p_u_1:GetAttribute("Ammo")
		p_u_1:GetAttributeChangedSignal("Ammo"):Connect(function()
			-- upvalues: (ref) v_u_20, (copy) p_u_1, (copy) v_u_16, (copy) v_u_10, (copy) p_u_7
			local v21 = p_u_1:GetAttribute("Ammo")
			v_u_20 = math.ceil(v21)
			v_u_16.Frame.amt.Text = v_u_20 .. "/" .. v_u_10.PlayerData[p_u_7].Value
		end)
		local v_u_22 = 0.6
		local v_u_23 = 0.6
		local v_u_24 = {
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARHold),
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARFire),
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleDraw),
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ShotgunReload),
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSights),
			v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSightsFire)
		}
		if p9 == nil then
			v_u_24[7] = v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ShotgunPump)
		else
			v_u_24[7] = v_u_18.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools[p9])
			v_u_22 = 0.3
			v_u_23 = 0.3
		end
		local function v_u_25()
			-- upvalues: (copy) p_u_1, (copy) v_u_10, (copy) v_u_24, (ref) v_u_22, (ref) v_u_23
			if p_u_1.Parent == v_u_10.Character then
				v_u_24[7]:Play(0.2, 1, 1.25)
				wait(0.1)
				p_u_1.Handle.Pump:Play()
				wait(v_u_22)
				v_u_24[7]:Stop(v_u_23)
			end
		end
		local function v_u_26()
			-- upvalues: (copy) p_u_1, (copy) p_u_8, (copy) v_u_11, (copy) p_u_4, (copy) p_u_5, (copy) v_u_10, (copy) p_u_6
			p_u_1.Handle.Attachment["1"]:Emit(p_u_1.Handle.Attachment["1"].Rate)
			p_u_1.Handle.Attachment["2"]:Emit(p_u_1.Handle.Attachment["2"].Rate)
			for _ = 1, p_u_8 or 5 do
				_G.FR(v_u_11.Hit.p, p_u_4, p_u_5, p_u_8)
			end
			_G.CSH("SoftRecoil", true)
			_G.AHS(1)
			_G.Triggered(v_u_10.Character.HumanoidRootPart, p_u_6)
			p_u_1.Handle.Attachment.PointLight.Enabled = true
			wait(0.1)
			p_u_1.Handle.Attachment.PointLight.Enabled = false
		end
		local function v_u_29(p27)
			-- upvalues: (copy) v_u_15, (ref) v_u_12, (copy) v_u_10, (copy) p_u_7, (ref) v_u_20, (copy) p_u_2, (copy) p_u_1, (copy) v_u_24, (copy) v_u_25
			if v_u_15:GetFocusedTextBox() == nil then
				if p27.KeyCode == Enum.KeyCode.R and (v_u_15:GetFocusedTextBox() == nil and (not v_u_12 and (v_u_10.PlayerData[p_u_7].Value > 0 and v_u_20 ~= p_u_2))) then
					v_u_12 = true
					for _ = v_u_20, p_u_2 - 1 do
						if p_u_1.Parent ~= v_u_10.Character or v_u_10.PlayerData[p_u_7].Value <= 0 then
							break
						end
						v_u_24[4]:Play(0.2, 1, 1.8)
						wait(0.3)
						p_u_1.Handle.Reload:Play()
						local v28 = v_u_20 + 1
						v_u_20 = math.clamp(v28, 0, 6)
						game.ReplicatedStorage.Events.WeaponReloadEvent:FireServer(p_u_7, 1, p_u_1)
						wait(0.3)
					end
					wait(0.1)
					v_u_25()
					v_u_12 = false
					v_u_24[4]:Stop(0.5)
					return
				end
				if p27.UserInputType == Enum.UserInputType.MouseButton2 and (not v_u_12 and _G.GunAimEnabled) then
					v_u_24[5]:Play(0.2)
					_G.SetGunAim(true)
				end
			end
		end
		local function v_u_31(p30)
			-- upvalues: (copy) v_u_15, (copy) v_u_24
			if v_u_15:GetFocusedTextBox() == nil and p30.UserInputType == Enum.UserInputType.MouseButton2 then
				v_u_24[5]:Stop(0.25)
				_G.SetGunAim(false)
			end
		end
		local function v32()
			-- upvalues: (copy) v_u_10, (copy) v_u_16, (ref) v_u_12, (ref) v_u_20, (ref) v_u_19, (copy) v_u_24, (copy) v_u_26, (copy) p_u_7, (copy) v_u_25, (copy) p_u_3
			if v_u_10.Job.Value == "Ghost" or (v_u_10.Job.Value == "Big Guy" or (v_u_10.Job.Value == "Zombie" or (v_u_10.Job.Value == "Dog" or v_u_10.Job.Value == "Hobo"))) then
				game.ReplicatedStorage.Events.Note:Fire(v_u_10.Job.Value .. " cant use guns", "This job cant use ranged weapons")
				return
			elseif v_u_10.Disguise.Value == nil then
				if not v_u_10.Character:GetAttribute("Ghosted") then
					v_u_16.Frame.warn.Visible = v_u_10.PlayerData.Karma.Value < 0
					if not v_u_12 and (v_u_20 > 0 and v_u_10.Character.Humanoid.Health > 0) then
						if tick() - v_u_19 < 0.5 then
							return
						end
						v_u_12 = true
						if v_u_24[5].IsPlaying then
							v_u_24[6]:Play()
						else
							v_u_24[2]:Play()
						end
						v_u_26()
						v_u_20 = v_u_20 - 1
						v_u_16.Frame.amt.Text = v_u_20 .. "/" .. v_u_10.PlayerData[p_u_7].Value
						wait(0.2)
						v_u_25()
						wait(p_u_3 - 0.2)
						v_u_12 = false
					end
				end
			else
				game.ReplicatedStorage.Events.Note:Fire("Can\'t Attack when Disguied", "You cannot shoot or swing when using a disguise kit")
				return
			end
		end
		local function v33()
			-- upvalues: (copy) v_u_11, (copy) v_u_24, (ref) v_u_13, (copy) v_u_15, (copy) v_u_29, (ref) v_u_14, (copy) v_u_31, (copy) p_u_1, (copy) v_u_17, (copy) p_u_7, (copy) v_u_16, (ref) v_u_20, (copy) v_u_10, (copy) v_u_18, (ref) v_u_19
			v_u_11.Icon = "rbxassetid://2872049636"
			v_u_24[1]:Play()
			v_u_13 = v_u_15.InputBegan:connect(v_u_29)
			v_u_14 = v_u_15.InputEnded:connect(v_u_31)
			game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(true, p_u_1.Name)
			v_u_24[3]:Play(0)
			v_u_17.Visible = true
			if p_u_7 ~= nil then
				v_u_16.Frame.type.Text = p_u_7
				v_u_16.Frame.amt.Text = v_u_20 .. "/" .. v_u_10.PlayerData[p_u_7].Value
				v_u_16.Frame.warn.Visible = v_u_10.PlayerData.Karma.Value < 0
				v_u_16.Adornee = v_u_18.RightHand
				v_u_16.Enabled = true
			end
			v_u_19 = tick()
			wait(0.18)
			v_u_24[3]:Stop(0.2)
		end
		p_u_1.Activated:connect(v32)
		p_u_1.Equipped:connect(v33)
		p_u_1.Unequipped:connect(function()
			-- upvalues: (copy) v_u_11, (copy) p_u_1, (copy) v_u_24, (ref) v_u_13, (ref) v_u_14, (copy) v_u_16, (copy) v_u_17
			v_u_11.Icon = "rbxasset://textures/ArrowFarCursor.png"
			game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(false, p_u_1.Name)
			for v34 = 1, #v_u_24 do
				v_u_24[v34]:Stop()
			end
			if v_u_13 ~= nil then
				v_u_13:disconnect()
				v_u_13 = nil
			end
			if v_u_14 ~= nil then
				v_u_14:disconnect()
				v_u_14 = nil
			end
			v_u_16.Enabled = false
			v_u_17.Visible = false
			_G.SetGunAim(false)
		end)
	end
}

-- // Function Dumper made by King.Kevin
-- // Script Path: ReplicatedStorage.Modules.TS.SHT

--[[
Function Dump: InputFunctionEnded

Function Upvalues: InputFunctionEnded
		1 [Instance] = UserInputService
		2 [table]:
		2 [table] table: 0x7cf4273a567281b5
				1 [Instance] = ARHold
				2 [Instance] = ARFire
				3 [Instance] = RifleDraw
				4 [Instance] = ShotgunReload
				5 [Instance] = RifleAimSights
				6 [Instance] = RifleAimSightsFire
				7 [Instance] = ShotgunPump

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
		10 [table]:
		10 [table] table: 0x3dbb12da852c9405
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

====================================================================================================

Function Dump: InputFunctionEnded

Function Upvalues: InputFunctionEnded
		1 [Instance] = UserInputService
		2 [table]:
		2 [table] table: 0x53ca55906162d9c5
				1 [Instance] = ARHold
				2 [Instance] = ARFire
				3 [Instance] = RifleDraw
				4 [Instance] = ShotgunReload
				5 [Instance] = RifleAimSights
				6 [Instance] = RifleAimSightsFire
				7 [Instance] = LeaverPull

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

Function Dump: Initiate

Function Upvalues: Initiate

Function Constants: Initiate
		1 [string] = wait
		2 [userdata] = userdata: 0x04fec8740022afd5
		3 [number] = 0.1
		4 [string] = GrenadeAmmo
		5 [string] = GetAttribute
		6 [string] = require
		7 [userdata] = userdata: 0x04fec8740022afd5
		8 [string] = game
		9 [Instance] = Ugc
		10 [string] = ReplicatedStorage
		11 [string] = Modules
		12 [string] = TS_Shared
		13 [string] = GL
		14 [string] = Players
		15 [string] = LocalPlayer
		16 [string] = GetMouse
		17 [string] = UserInputService
		18 [string] = GetService
		19 [string] = PlayerGui
		20 [string] = WaitForChild
		21 [string] = Ammo
		22 [string] = Client
		23 [string] = Advice
		24 [string] = Gun
		25 [string] = Character
		26 [string] = GetAttributeChangedSignal
		27 [string] = Connect
		28 [number] = 0.6
		29 [string] = Humanoid
		30 [string] = Animations
		31 [string] = Tools
		32 [string] = ARHold
		33 [string] = LoadAnimation
		34 [string] = ARFire
		35 [string] = RifleDraw
		36 [string] = ShotgunReload
		37 [string] = RifleAimSights
		38 [string] = RifleAimSightsFire
		39 [string] = ShotgunPump
		40 [number] = 0.3
		41 [string] = Activated
		42 [string] = connect
		43 [string] = Equipped
		44 [string] = Unequipped

====================================================================================================

Function Dump: InputFunction

Function Upvalues: InputFunction
		1 [Instance] = UserInputService
		2 [boolean] = false
		3 [Instance] = KYS_LOL135
		4 [string] = Rifle Ammo
		5 [number] = 5
		6 [number] = 5
		7 [Instance] = Lever Action
		8 [table] (Recursive table detected)
		9 [function] = Pump

Function Constants: InputFunction
		1 [string] = GetFocusedTextBox
		2 [string] = KeyCode
		3 [string] = Enum
		4 [string] = R
		5 [EnumItem] = Enum.KeyCode.R
		6 [string] = PlayerData
		7 [string] = Value
		8 [number] = 1
		9 [string] = Parent
		10 [string] = Character
		11 [number] = 0.2
		12 [number] = 1.8
		13 [string] = Play
		14 [string] = wait
		15 [userdata] = userdata: 0x04fec8740022afd5
		16 [number] = 0.3
		17 [string] = Handle
		18 [string] = Reload
		19 [string] = math
		20 [string] = clamp
		21 [userdata] = userdata: 0x04fec8740022afd5
		22 [string] = game
		23 [Instance] = Ugc
		24 [string] = ReplicatedStorage
		25 [string] = Events
		26 [string] = WeaponReloadEvent
		27 [string] = FireServer
		28 [number] = 0.1
		29 [number] = 0.5
		30 [string] = Stop
		31 [string] = UserInputType
		32 [string] = MouseButton2
		33 [EnumItem] = Enum.UserInputType.MouseButton2
		34 [string] = GunAimEnabled
		35 [string] = _G
		36 [table] (Recursive table detected)
		37 [string] = SetGunAim

====================================================================================================

Function Dump: Pump

Function Upvalues: Pump
		1 [Instance] = Lever Action
		2 [Instance] = KYS_LOL135
		3 [table] (Recursive table detected)
		4 [number] = 0.3
		5 [number] = 0.3

Function Constants: Pump
		1 [string] = Parent
		2 [string] = Character
		3 [number] = 0.2
		4 [number] = 1.25
		5 [string] = Play
		6 [string] = wait
		7 [userdata] = userdata: 0x04fec8740022afd5
		8 [number] = 0.1
		9 [string] = Handle
		10 [string] = Pump
		11 [string] = Stop

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [number] = 5
		2 [Instance] = Lever Action
		3 [Instance] = Ammo
		4 [Instance] = KYS_LOL135
		5 [string] = Rifle Ammo

Function Constants: Unknown Name
		1 [string] = Ammo
		2 [string] = GetAttribute
		3 [string] = math
		4 [string] = ceil
		5 [userdata] = userdata: 0x04fec8740022afd5
		6 [string] = Frame
		7 [string] = amt
		8 [string] = /
		9 [string] = PlayerData
		10 [string] = Value
		11 [string] = Text

====================================================================================================

Function Dump: Pump

Function Upvalues: Pump
		1 [Instance] = Remington
		2 [Instance] = KYS_LOL135
		3 [table] (Recursive table detected)
		4 [number] = 0.6
		5 [number] = 0.6

Function Constants: Pump
		1 [string] = Parent
		2 [string] = Character
		3 [number] = 0.2
		4 [number] = 1.25
		5 [string] = Play
		6 [string] = wait
		7 [userdata] = userdata: 0x04fec8740022afd5
		8 [number] = 0.1
		9 [string] = Handle
		10 [string] = Pump
		11 [string] = Stop

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [number] = 0
		2 [Instance] = Remington
		3 [Instance] = Ammo
		4 [Instance] = KYS_LOL135
		5 [string] = Heavy Ammo

Function Constants: Unknown Name
		1 [string] = Ammo
		2 [string] = GetAttribute
		3 [string] = math
		4 [string] = ceil
		5 [userdata] = userdata: 0x04fec8740022afd5
		6 [string] = Frame
		7 [string] = amt
		8 [string] = /
		9 [string] = PlayerData
		10 [string] = Value
		11 [string] = Text

====================================================================================================

Function Dump: InputFunction

Function Upvalues: InputFunction
		1 [Instance] = UserInputService
		2 [boolean] = false
		3 [Instance] = KYS_LOL135
		4 [string] = Heavy Ammo
		5 [number] = 0
		6 [number] = 6
		7 [Instance] = Remington
		8 [table] (Recursive table detected)
		9 [function] = Pump

Function Constants: InputFunction
		1 [string] = GetFocusedTextBox
		2 [string] = KeyCode
		3 [string] = Enum
		4 [string] = R
		5 [EnumItem] = Enum.KeyCode.R
		6 [string] = PlayerData
		7 [string] = Value
		8 [number] = 1
		9 [string] = Parent
		10 [string] = Character
		11 [number] = 0.2
		12 [number] = 1.8
		13 [string] = Play
		14 [string] = wait
		15 [userdata] = userdata: 0x04fec8740022afd5
		16 [number] = 0.3
		17 [string] = Handle
		18 [string] = Reload
		19 [string] = math
		20 [string] = clamp
		21 [userdata] = userdata: 0x04fec8740022afd5
		22 [string] = game
		23 [Instance] = Ugc
		24 [string] = ReplicatedStorage
		25 [string] = Events
		26 [string] = WeaponReloadEvent
		27 [string] = FireServer
		28 [number] = 0.1
		29 [number] = 0.5
		30 [string] = Stop
		31 [string] = UserInputType
		32 [string] = MouseButton2
		33 [EnumItem] = Enum.UserInputType.MouseButton2
		34 [string] = GunAimEnabled
		35 [string] = _G
		36 [table] (Recursive table detected)
		37 [string] = SetGunAim

====================================================================================================

Function Dump: Equipped

Function Upvalues: Equipped
		1 [Instance] = Instance
		2 [table] (Recursive table detected)
		4 [Instance] = UserInputService
		5 [function] = InputFunction
		7 [function] = InputFunctionEnded
		8 [Instance] = Lever Action
		9 [Instance] = Gun
		10 [string] = Rifle Ammo
		11 [Instance] = Ammo
		12 [number] = 5
		13 [Instance] = KYS_LOL135
		14 [Instance] = KYS_LOL135
		15 [number] = 1751865806.6016953

Function Constants: Equipped
		1 [string] = rbxassetid://2872049636
		2 [string] = Icon
		3 [string] = Play
		4 [string] = InputBegan
		5 [string] = connect
		6 [string] = InputEnded
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = ReplicatedStorage
		10 [string] = Events
		11 [string] = WeaponBackEvent
		12 [string] = Name
		13 [string] = FireServer
		14 [string] = Visible
		15 [string] = Frame
		16 [string] = type
		17 [string] = Text
		18 [string] = amt
		19 [string] = /
		20 [string] = PlayerData
		21 [string] = Value
		22 [string] = warn
		23 [string] = Karma
		24 [string] = RightHand
		25 [string] = Adornee
		26 [string] = Enabled
		27 [string] = tick
		28 [userdata] = userdata: 0x04fec8740022afd5
		29 [string] = wait
		30 [userdata] = userdata: 0x04fec8740022afd5
		31 [number] = 0.18
		32 [number] = 0.2
		33 [string] = Stop

====================================================================================================

Function Dump: Equipped

Function Upvalues: Equipped
		1 [Instance] = Instance
		2 [table] (Recursive table detected)
		4 [Instance] = UserInputService
		5 [function] = InputFunction
		7 [function] = InputFunctionEnded
		8 [Instance] = Remington
		9 [Instance] = Gun
		10 [string] = Heavy Ammo
		11 [Instance] = Ammo
		12 [number] = 0
		13 [Instance] = KYS_LOL135
		14 [Instance] = KYS_LOL135
		15 [number] = 0

Function Constants: Equipped
		1 [string] = rbxassetid://2872049636
		2 [string] = Icon
		3 [string] = Play
		4 [string] = InputBegan
		5 [string] = connect
		6 [string] = InputEnded
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = ReplicatedStorage
		10 [string] = Events
		11 [string] = WeaponBackEvent
		12 [string] = Name
		13 [string] = FireServer
		14 [string] = Visible
		15 [string] = Frame
		16 [string] = type
		17 [string] = Text
		18 [string] = amt
		19 [string] = /
		20 [string] = PlayerData
		21 [string] = Value
		22 [string] = warn
		23 [string] = Karma
		24 [string] = RightHand
		25 [string] = Adornee
		26 [string] = Enabled
		27 [string] = tick
		28 [userdata] = userdata: 0x04fec8740022afd5
		29 [string] = wait
		30 [userdata] = userdata: 0x04fec8740022afd5
		31 [number] = 0.18
		32 [number] = 0.2
		33 [string] = Stop

====================================================================================================

Function Dump: Fire

Function Upvalues: Fire
		1 [Instance] = Lever Action
		2 [number] = 1
		3 [Instance] = Instance
		4 [number] = 58
		5 [number] = 5
		6 [Instance] = KYS_LOL135
		7 [number] = 4

Function Constants: Fire
		1 [string] = 1
		2 [string] = Handle
		3 [string] = Attachment
		4 [string] = Rate
		5 [string] = Emit
		6 [string] = 2
		7 [number] = 5
		8 [string] = FR
		9 [string] = _G
		10 [table] (Recursive table detected)
		11 [string] = Hit
		12 [string] = p
		13 [string] = CSH
		14 [string] = SoftRecoil
		15 [string] = AHS
		16 [string] = Triggered
		17 [string] = Character
		18 [string] = HumanoidRootPart
		19 [string] = PointLight
		20 [string] = Enabled
		21 [string] = wait
		22 [userdata] = userdata: 0x04fec8740022afd5
		23 [number] = 0.1

====================================================================================================

Function Dump: Fire

Function Upvalues: Fire
		1 [Instance] = Remington
		3 [Instance] = Instance
		4 [number] = 20
		5 [number] = 25
		6 [Instance] = KYS_LOL135
		7 [number] = 4

Function Constants: Fire
		1 [string] = 1
		2 [string] = Handle
		3 [string] = Attachment
		4 [string] = Rate
		5 [string] = Emit
		6 [string] = 2
		7 [number] = 5
		8 [string] = FR
		9 [string] = _G
		10 [table] (Recursive table detected)
		11 [string] = Hit
		12 [string] = p
		13 [string] = CSH
		14 [string] = SoftRecoil
		15 [string] = AHS
		16 [string] = Triggered
		17 [string] = Character
		18 [string] = HumanoidRootPart
		19 [string] = PointLight
		20 [string] = Enabled
		21 [string] = wait
		22 [userdata] = userdata: 0x04fec8740022afd5
		23 [number] = 0.1

====================================================================================================

Function Dump: Unequip

Function Upvalues: Unequip
		1 [Instance] = Instance
		2 [Instance] = Remington
		3 [table] (Recursive table detected)
		6 [Instance] = Ammo
		7 [Instance] = Gun

Function Constants: Unequip
		1 [string] = rbxasset://textures/ArrowFarCursor.png
		2 [string] = Icon
		3 [string] = game
		4 [Instance] = Ugc
		5 [string] = ReplicatedStorage
		6 [string] = Events
		7 [string] = WeaponBackEvent
		8 [string] = Name
		9 [string] = FireServer
		10 [string] = Stop
		11 [string] = disconnect
		12 [string] = Enabled
		13 [string] = Visible
		14 [string] = SetGunAim
		15 [string] = _G
		16 [table] (Recursive table detected)

====================================================================================================

Function Dump: Unequip

Function Upvalues: Unequip
		1 [Instance] = Instance
		2 [Instance] = Lever Action
		3 [table] (Recursive table detected)
		6 [Instance] = Ammo
		7 [Instance] = Gun

Function Constants: Unequip
		1 [string] = rbxasset://textures/ArrowFarCursor.png
		2 [string] = Icon
		3 [string] = game
		4 [Instance] = Ugc
		5 [string] = ReplicatedStorage
		6 [string] = Events
		7 [string] = WeaponBackEvent
		8 [string] = Name
		9 [string] = FireServer
		10 [string] = Stop
		11 [string] = disconnect
		12 [string] = Enabled
		13 [string] = Visible
		14 [string] = SetGunAim
		15 [string] = _G
		16 [table] (Recursive table detected)

====================================================================================================

Function Dump: Activate

Function Upvalues: Activate
		1 [Instance] = KYS_LOL135
		2 [Instance] = Ammo
		3 [boolean] = false
		4 [number] = 0
		5 [number] = 0
		6 [table] (Recursive table detected)
		7 [function] = Fire
		8 [string] = Heavy Ammo
		9 [function] = Pump
		10 [number] = 0.4

Function Constants: Activate
		1 [string] = Job
		2 [string] = Value
		3 [string] = Ghost
		4 [string] = Big Guy
		5 [string] = Zombie
		6 [string] = Dog
		7 [string] = Hobo
		8 [string] = game
		9 [Instance] = Ugc
		10 [string] = ReplicatedStorage
		11 [string] = Events
		12 [string] = Note
		13 [string] =  cant use guns
		14 [string] = This job cant use ranged weapons
		15 [string] = Fire
		16 [string] = Disguise
		17 [string] = Can't Attack when Disguied
		18 [string] = You cannot shoot or swing when using a disguise kit
		19 [string] = Character
		20 [string] = Ghosted
		21 [string] = GetAttribute
		22 [string] = Frame
		23 [string] = warn
		24 [string] = PlayerData
		25 [string] = Karma
		26 [string] = Visible
		27 [string] = Humanoid
		28 [string] = Health
		29 [string] = tick
		30 [userdata] = userdata: 0x04fec8740022afd5
		31 [number] = 0.5
		32 [string] = IsPlaying
		33 [string] = Play
		34 [number] = 1
		35 [string] = amt
		36 [string] = /
		37 [string] = Text
		38 [string] = wait
		39 [userdata] = userdata: 0x04fec8740022afd5
		40 [number] = 0.2

====================================================================================================

Function Dump: Activate

Function Upvalues: Activate
		1 [Instance] = KYS_LOL135
		2 [Instance] = Ammo
		3 [boolean] = false
		4 [number] = 5
		5 [number] = 1751865806.6016953
		6 [table] (Recursive table detected)
		7 [function] = Fire
		8 [string] = Rifle Ammo
		9 [function] = Pump
		10 [number] = 0.4

Function Constants: Activate
		1 [string] = Job
		2 [string] = Value
		3 [string] = Ghost
		4 [string] = Big Guy
		5 [string] = Zombie
		6 [string] = Dog
		7 [string] = Hobo
		8 [string] = game
		9 [Instance] = Ugc
		10 [string] = ReplicatedStorage
		11 [string] = Events
		12 [string] = Note
		13 [string] =  cant use guns
		14 [string] = This job cant use ranged weapons
		15 [string] = Fire
		16 [string] = Disguise
		17 [string] = Can't Attack when Disguied
		18 [string] = You cannot shoot or swing when using a disguise kit
		19 [string] = Character
		20 [string] = Ghosted
		21 [string] = GetAttribute
		22 [string] = Frame
		23 [string] = warn
		24 [string] = PlayerData
		25 [string] = Karma
		26 [string] = Visible
		27 [string] = Humanoid
		28 [string] = Health
		29 [string] = tick
		30 [userdata] = userdata: 0x04fec8740022afd5
		31 [number] = 0.5
		32 [string] = IsPlaying
		33 [string] = Play
		34 [number] = 1
		35 [string] = amt
		36 [string] = /
		37 [string] = Text
		38 [string] = wait
		39 [userdata] = userdata: 0x04fec8740022afd5
		40 [number] = 0.2

====================================================================================================
]]

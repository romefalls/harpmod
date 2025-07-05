--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
return {
	["Initiate"] = function(p_u_1, _, _, p_u_2, p_u_3, p_u_4, p_u_5, p6, _, p_u_7, p8, _, p_u_9)
		wait(0.1)
		local v_u_10
		if p_u_1:GetAttribute("GrenadeAmmo") == nil then
			v_u_10 = nil
		else
			v_u_10 = require(game.ReplicatedStorage.Modules.TS_Shared.GL)
		end
		local v_u_11 = p_u_1:GetAttribute("MaxAmmo")
		local v_u_12 = game.Players.LocalPlayer
		local v_u_13 = v_u_12:GetMouse()
		local v_u_14 = game:GetService("UserInputService")
		local v_u_15 = v_u_12:WaitForChild("PlayerGui"):WaitForChild("Ammo")
		local v_u_16 = v_u_12:WaitForChild("PlayerGui"):WaitForChild("Client"):WaitForChild("Advice"):WaitForChild("Gun")
		local v_u_17 = v_u_12.Character
		local v_u_18 = 0
		local v_u_19 = 0
		local v_u_20 = nil
		local v_u_21 = nil
		local v_u_22 = false
		local v_u_23 = p8 or 1
		for _, v24 in pairs(p_u_1:GetDescendants()) do
			if v24.ClassName == "ParticleEmitter" then
				v24:Clone().Parent = v24.Parent
				v24.Lifetime = NumberRange.new(0, 0)
				v24.Enabled = false
				v24.Name = ""
			end
		end
		local v_u_25 = p_u_1:GetAttribute("Ammo")
		p_u_1:GetAttributeChangedSignal("Ammo"):Connect(function()
			-- upvalues: (ref) v_u_25, (copy) p_u_1, (copy) v_u_15, (copy) v_u_12, (copy) p_u_7
			v_u_25 = p_u_1:GetAttribute("Ammo")
			v_u_15.Frame.amt.Text = v_u_25 .. "/" .. v_u_12.PlayerData[p_u_7].Value
		end)
		local v26 = nil
		local v_u_27
		if p6 == 1 then
			v_u_27 = {
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARHold),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARFire),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleDraw),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleReload),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSights),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSightsFire)
			}
		elseif p6 == 2 then
			v_u_27 = {
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolHold),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolFire),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolDraw),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolReload),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSights),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSightsFire)
			}
		elseif p6 == 3 then
			v_u_27 = {
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolHold),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolFire),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolDraw),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RevolverReload),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSights),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSightsFire)
			}
		elseif p6 == 4 then
			v_u_27 = {
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.BallFistIdle),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.SwingUnder),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolDraw),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleReload),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSights),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.PistolAimSightsFire)
			}
		else
			v_u_27 = p6 == 5 and {
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARHold),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.ARFire),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleDraw),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.LaserMusketReload),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSights),
				v_u_17.Humanoid:LoadAnimation(game.ReplicatedStorage.Animations.Tools.RifleAimSightsFire)
			} or v26
		end
		local function v_u_29()
			-- upvalues: (copy) p_u_1, (copy) v_u_23, (copy) v_u_13, (copy) p_u_3, (copy) p_u_4, (copy) p_u_9, (copy) v_u_12, (copy) p_u_5, (copy) p_u_2
			p_u_1.Handle.Attachment["1"]:Emit(p_u_1.Handle.Attachment["1"].Rate)
			p_u_1.Handle.Attachment["2"]:Emit(p_u_1.Handle.Attachment["2"].Rate)
			for _ = 1, v_u_23 do
				_G.FR(v_u_13.Hit.p, p_u_3, p_u_4, p_u_9, v_u_23)
			end
			_G.AHS(1)
			_G.CSH("SoftRecoil", true)
			_G.Triggered(v_u_12.Character.HumanoidRootPart, p_u_5)
			p_u_1.Handle.Attachment.PointLight.Enabled = true
			local v28 = p_u_2
			wait((math.clamp(0.1, 0, v28)))
			p_u_1.Handle.Attachment.PointLight.Enabled = false
		end
		local function v_u_32(p30)
			-- upvalues: (copy) v_u_14, (ref) v_u_22, (copy) v_u_12, (copy) p_u_7, (ref) v_u_25, (ref) v_u_11, (ref) v_u_27, (copy) p_u_1, (ref) v_u_10
			if v_u_14:GetFocusedTextBox() == nil then
				if p30.KeyCode == Enum.KeyCode.R and (v_u_14:GetFocusedTextBox() == nil and (not v_u_22 and (v_u_12.PlayerData[p_u_7].Value > 0 and v_u_25 ~= v_u_11))) then
					if v_u_12.Character.Head.Transparency < 1 then
						v_u_22 = true
						v_u_27[4]:Play(0.4)
						wait(0.4)
						p_u_1.Handle.Reload:Play()
						wait(1.6)
						game.ReplicatedStorage.Events.WeaponReloadEvent:FireServer(p_u_7, v_u_11 - v_u_25, p_u_1)
						v_u_22 = false
						v_u_27[4]:Stop(0.5)
					end
				end
				if p30.KeyCode == Enum.KeyCode.Y and (v_u_14:GetFocusedTextBox() == nil and p_u_1.Name:find("Cards")) then
					if not v_u_22 then
						v_u_22 = true
						_G.RC(2)
						local v31 = v_u_12.Character.Head.Transparency < 1
						game.ReplicatedStorage.Events.VGE:FireServer(5, v31)
						wait(0.15)
						spawn(function()
							_G.F()
						end)
						wait(1)
						v_u_22 = false
					end
				end
				if p30.KeyCode == Enum.KeyCode.F and not v_u_22 then
					if v_u_10 then
						v_u_10.FireGrenade(p_u_1, v_u_27[2])
						return
					end
				elseif p30.UserInputType == Enum.UserInputType.MouseButton2 and (not v_u_22 and _G.GunAimEnabled) then
					v_u_27[5]:Play(0.2)
					_G.SetGunAim(true)
				end
			end
		end
		local function v_u_34(p33)
			-- upvalues: (copy) v_u_14, (ref) v_u_27
			if v_u_14:GetFocusedTextBox() == nil and p33.UserInputType == Enum.UserInputType.MouseButton2 then
				v_u_27[5]:Stop(0.25)
				_G.SetGunAim(false)
			end
		end
		local function v36()
			-- upvalues: (copy) v_u_12, (copy) v_u_15, (ref) v_u_22, (ref) v_u_25, (ref) v_u_19, (ref) v_u_18, (copy) p_u_2, (ref) v_u_27, (copy) v_u_29
			if v_u_12.Job.Value == "Ghost" or (v_u_12.Job.Value == "Zombie" or (v_u_12.Job.Value == "Dog" or v_u_12.Job.Value == "Hobo")) then
				game.ReplicatedStorage.Events.Note:Fire(v_u_12.Job.Value .. " cant use guns", "This job cant use ranged weapons")
				return
			elseif v_u_12.Character:GetAttribute("Ghosted") then
				return
			elseif v_u_12.Disguise.Value == nil then
				v_u_15.Frame.warn.Visible = v_u_12.PlayerData.Karma.Value < 0
				if not v_u_22 and (v_u_25 > 0 and (v_u_12.Character.Humanoid.Health > 0 and v_u_12.Character.Head.Transparency < 1)) then
					local v35 = tick()
					if v35 - v_u_19 < 0.5 then
						return
					end
					if v35 - v_u_18 < p_u_2 then
						return
					end
					v_u_22 = true
					if v_u_27[5].IsPlaying then
						v_u_27[6]:Play()
					else
						v_u_27[2]:Play()
					end
					v_u_29()
					v_u_18 = v35
					v_u_22 = false
				end
			else
				game.ReplicatedStorage.Events.Note:Fire("Can\'t Attack when Disguied", "You cannot shoot or swing when using a disguise kit")
			end
		end
		local function v37()
			-- upvalues: (copy) v_u_13, (ref) v_u_27, (ref) v_u_20, (copy) v_u_14, (copy) v_u_32, (ref) v_u_21, (copy) v_u_34, (copy) p_u_1, (copy) v_u_16, (copy) p_u_7, (copy) v_u_15, (ref) v_u_25, (copy) v_u_12, (copy) v_u_17, (ref) v_u_19
			v_u_13.Icon = "rbxassetid://2872049636"
			v_u_27[1]:Play()
			v_u_20 = v_u_14.InputBegan:connect(v_u_32)
			v_u_21 = v_u_14.InputEnded:connect(v_u_34)
			game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(true, p_u_1.Name)
			v_u_27[3]:Play(0)
			v_u_16.Visible = true
			if p_u_7 ~= nil then
				v_u_15.Frame.type.Text = p_u_7
				v_u_15.Frame.amt.Text = v_u_25 .. "/" .. v_u_12.PlayerData[p_u_7].Value
				v_u_15.Frame.warn.Visible = v_u_12.PlayerData.Karma.Value < 0
				v_u_15.Adornee = v_u_17.RightHand
				v_u_15.Enabled = true
			end
			v_u_19 = tick()
			wait(0.18)
			v_u_27[3]:Stop(0.2)
		end
		local function v39()
			-- upvalues: (copy) v_u_13, (copy) p_u_1, (ref) v_u_27, (ref) v_u_20, (ref) v_u_21, (copy) v_u_16, (copy) v_u_15, (copy) v_u_12
			v_u_13.Icon = "rbxasset://textures/ArrowFarCursor.png"
			game.ReplicatedStorage.Events.WeaponBackEvent:FireServer(false, p_u_1.Name)
			for v38 = 1, #v_u_27 do
				v_u_27[v38]:Stop()
			end
			if v_u_20 ~= nil then
				v_u_20:disconnect()
				v_u_20 = nil
			end
			if v_u_21 ~= nil then
				v_u_21:disconnect()
				v_u_21 = nil
			end
			v_u_16.Visible = false
			v_u_15.Enabled = false
			_G.SetGunAim(false)
			if p_u_1.Name:find("Cards") and v_u_12.Character:FindFirstChild("Cards") then
				game.ReplicatedStorage.Events.VGE:FireServer(5, false)
			end
		end
		p_u_1.Activated:connect(v36)
		p_u_1.Equipped:connect(v37)
		p_u_1.Unequipped:connect(v39)
	end
}

-- // Function Dumper made by King.Kevin
-- // Script Path: ReplicatedStorage.Modules.TS.GNS

--[[
Function Dump: Activate

Function Upvalues: Activate
		1 [Instance] = XxXKlNG_VONXxX
		2 [Instance] = Ammo
		3 [boolean] = false
		4 [number] = 8
		5 [number] = 1751653076.5316653
		6 [number] = 1751653200.9583225
		7 [number] = 0.25
		8 [table]:
		8 [table] table: 0x04241550865bde41
				1 [Instance] = PistolHold
				2 [Instance] = PistolFire
				3 [Instance] = PistolDraw
				4 [Instance] = PistolReload
				5 [Instance] = PistolAimSights
				6 [Instance] = PistolAimSightsFire
		9 [function] = Fire

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
		28 [string] = Head
		29 [string] = Transparency
		30 [string] = tick
		31 [userdata] = userdata: 0x25282d07b4f5b9f1
		32 [number] = 0.5
		33 [string] = IsPlaying
		34 [string] = Play

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
		10 [table]:
		10 [table] table: 0x2f7afead9368f201
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

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [number] = 8
		2 [Instance] = [Soldier] M1911
		3 [Instance] = Ammo
		4 [Instance] = XxXKlNG_VONXxX
		5 [string] = Pistol Ammo

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
		3 [Instance] = XxXKlNG_VONXxX
		4 [string] = Pistol Ammo
		5 [number] = 8
		6 [number] = 8
		7 [table] (Recursive table detected)
		8 [Instance] = [Soldier] M1911

Function Constants: InputFunction
		1 [string] = GetFocusedTextBox
		2 [string] = KeyCode
		3 [string] = Enum
		4 [string] = R
		5 [EnumItem] = Enum.KeyCode.R
		6 [string] = PlayerData
		7 [string] = Value
		8 [string] = Character
		9 [string] = Head
		10 [string] = Transparency
		11 [number] = 0.4
		12 [string] = Play
		13 [string] = wait
		14 [userdata] = userdata: 0x25282d07b4f5b9f1
		15 [string] = Handle
		16 [string] = Reload
		17 [number] = 1.6
		18 [string] = game
		19 [Instance] = Ugc
		20 [string] = ReplicatedStorage
		21 [string] = Events
		22 [string] = WeaponReloadEvent
		23 [string] = FireServer
		24 [number] = 0.5
		25 [string] = Stop
		26 [string] = Y
		27 [EnumItem] = Enum.KeyCode.Y
		28 [string] = Name
		29 [string] = Cards
		30 [string] = find
		31 [string] = RC
		32 [string] = _G
		33 [table] (Recursive table detected)
		34 [string] = VGE
		35 [number] = 0.15
		36 [string] = spawn
		37 [userdata] = userdata: 0x25282d07b4f5b9f1
		38 [userdata] = userdata: 0x25282d07b4f5b9f1
		39 [string] = F
		40 [EnumItem] = Enum.KeyCode.F
		41 [string] = FireGrenade
		42 [string] = UserInputType
		43 [string] = MouseButton2
		44 [EnumItem] = Enum.UserInputType.MouseButton2
		45 [string] = GunAimEnabled
		46 [number] = 0.2
		47 [string] = SetGunAim

====================================================================================================

Function Dump: Fire

Function Upvalues: Fire
		1 [Instance] = [Soldier] M1911
		2 [number] = 1
		3 [Instance] = Instance
		4 [number] = 18
		5 [number] = 5
		7 [Instance] = XxXKlNG_VONXxX
		8 [number] = 3
		9 [number] = 0.25

Function Constants: Fire
		1 [string] = 1
		2 [string] = Handle
		3 [string] = Attachment
		4 [string] = Rate
		5 [string] = Emit
		6 [string] = 2
		7 [string] = FR
		8 [string] = _G
		9 [table] (Recursive table detected)
		10 [string] = Hit
		11 [string] = p
		12 [string] = AHS
		13 [string] = CSH
		14 [string] = SoftRecoil
		15 [string] = Triggered
		16 [string] = Character
		17 [string] = HumanoidRootPart
		18 [string] = PointLight
		19 [string] = Enabled
		20 [string] = wait
		21 [userdata] = userdata: 0x25282d07b4f5b9f1
		22 [number] = 0.1
		23 [string] = math
		24 [string] = clamp
		25 [userdata] = userdata: 0x25282d07b4f5b9f1

====================================================================================================

Function Dump: Unequip

Function Upvalues: Unequip
		1 [Instance] = Instance
		2 [Instance] = [Soldier] M1911
		3 [table] (Recursive table detected)
		4 [RBXScriptConnection] = Connection
		5 [RBXScriptConnection] = Connection
		6 [Instance] = Gun
		7 [Instance] = Ammo
		8 [Instance] = XxXKlNG_VONXxX

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
		12 [string] = Visible
		13 [string] = Enabled
		14 [string] = SetGunAim
		15 [string] = _G
		16 [table] (Recursive table detected)
		17 [string] = Cards
		18 [string] = find
		19 [string] = Character
		20 [string] = FindFirstChild
		21 [string] = VGE

====================================================================================================

Function Dump: Initiate

Function Upvalues: Initiate

Function Constants: Initiate
		1 [string] = wait
		2 [userdata] = userdata: 0x25282d07b4f5b9f1
		3 [number] = 0.1
		4 [string] = GrenadeAmmo
		5 [string] = GetAttribute
		6 [string] = require
		7 [userdata] = userdata: 0x25282d07b4f5b9f1
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
		18 [number] = 1
		19 [string] = UserInputService
		20 [string] = GetService
		21 [string] = PlayerGui
		22 [string] = WaitForChild
		23 [string] = Ammo
		24 [string] = Client
		25 [string] = Advice
		26 [string] = Gun
		27 [string] = Character
		28 [string] = pairs
		29 [userdata] = userdata: 0x25282d07b4f5b9f1
		30 [string] = GetDescendants
		31 [string] = ClassName
		32 [string] = ParticleEmitter
		33 [string] = Clone
		34 [string] = Parent
		35 [string] = NumberRange
		36 [string] = new
		37 [userdata] = userdata: 0x25282d07b4f5b9f1
		38 [string] = Lifetime
		39 [string] = Enabled
		40 [string] = 
		41 [string] = Name
		42 [string] = GetAttributeChangedSignal
		43 [string] = Connect
		44 [string] = Humanoid
		45 [string] = Animations
		46 [string] = Tools
		47 [string] = ARHold
		48 [string] = LoadAnimation
		49 [string] = ARFire
		50 [string] = RifleDraw
		51 [string] = RifleReload
		52 [string] = RifleAimSights
		53 [string] = RifleAimSightsFire
		54 [number] = 2
		55 [string] = PistolHold
		56 [string] = PistolFire
		57 [string] = PistolDraw
		58 [string] = PistolReload
		59 [string] = PistolAimSights
		60 [string] = PistolAimSightsFire
		61 [number] = 3
		62 [string] = RevolverReload
		63 [number] = 4
		64 [string] = BallFistIdle
		65 [string] = SwingUnder
		66 [number] = 5
		67 [string] = LaserMusketReload
		68 [string] = Activated
		69 [string] = connect
		70 [string] = Equipped
		71 [string] = Unequipped

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name

Function Constants: Unknown Name
		1 [string] = F
		2 [string] = _G
		3 [table] (Recursive table detected)

====================================================================================================

Function Dump: Equipped

Function Upvalues: Equipped
		1 [Instance] = Instance
		2 [table] (Recursive table detected)
		3 [RBXScriptConnection] = Connection
		4 [Instance] = UserInputService
		5 [function] = InputFunction
		6 [RBXScriptConnection] = Connection
		7 [function] = InputFunctionEnded
		8 [Instance] = [Soldier] M1911
		9 [Instance] = Gun
		10 [string] = Pistol Ammo
		11 [Instance] = Ammo
		12 [number] = 8
		13 [Instance] = XxXKlNG_VONXxX
		14 [Instance] = XxXKlNG_VONXxX
		15 [number] = 1751653076.5316653

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
		28 [userdata] = userdata: 0x25282d07b4f5b9f1
		29 [string] = wait
		30 [userdata] = userdata: 0x25282d07b4f5b9f1
		31 [number] = 0.18
		32 [number] = 0.2
		33 [string] = Stop

====================================================================================================
]]

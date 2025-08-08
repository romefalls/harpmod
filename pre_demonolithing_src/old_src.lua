
--[[ LASER GRAPPLE
        How do I use this motherfucker piece of s*** (censored as per the People's Republic of China's guidelines) laser grapple? How the fuck?
        Press [Z] to turn on Laser Grapple.
        Aiming at a door or a car will turn your laser Blue; and clicking will unlock said car or door.
        If you have a gun equipped, aiming at a person will change your laser to Green, meaning that you won't be able to grapple while holding a gun. You can do some epic tricks by quickly unequipping the gun, grappling, then re-equipping it again.
        Or if you're aiming at something walkable; your laser will be Red, indicating that you can use the Grapple.]]
--[[ PIANO CLIENT
        Harpmod V1.3 still comes with Piano Client, however its settings have been moved to its own UI.
        Piano Client brings many more fun things to the table, including Autoreload, Outfit Stealer, among others; at a certain cost of performance, if you have a low-tier PC.
        This is Piano Client's support server: https://discord.gg/XkWpSFZajr
        ]]
--[[ FONT
        Please visit https://developer.roblox.com/en-us/api-reference/enum/Font to select your favorite font.
        Also, make sure you prefix "Enum.Font." to your selected font, otherwise it'll cause an error and you are a dumbfuck
        For example, Enum.Font.Oswald, Enum.Font.RobotoCondensed, etc etc.]]
        getgenv().GlobalFont = Enum.Font.Oswald
--[[ RELOADSOUND
    ReloadSound is the sound that the script makes when you are running low on ammo.
    ReloadSound plays when you have 5 (Rifle, SMG Ammo), 3 (Pistol Ammo) or 0 (Heavy Ammo) bullets left.
    If you want to turn ReloadSound off, press [M] to turn it on or off (it'll also turn off the combat music soooooo ye)
    ]]
    getgenv().ReloadSoundId = 528290057
    getgenv().ReloadVolume = 0.05
    getgenv().ReloadPitchWhen5RoundsAreRemaining = 1
    getgenv().ReloadPitchWhen4RoundsAreRemaining = 1.1
    getgenv().ReloadPitchWhen3RoundsAreRemaining = 1.2
    getgenv().ReloadPitchWhen2RoundsAreRemaining = 1.3
    getgenv().ReloadPitchWhen1RoundIsRemaining = 1.4
    getgenv().ReloadPitchWhen0RoundsAreRemaining = 1.5
--[[ CUSTOMCROSSHAIRICON AND CUSTOMCURSORICON
    CustomCrosshairIcon changes the dot cursor that you get from entering Aiming Mode (pressing Q) into, say, a crosshair, for example.
    You can change the CustomCrosshairIcon into anything you like; but don't make your crosshair too big, keep it around 32x32px.

    Harpmod V1.3 comes with a new thing: CustomCursorIcon and CustomCrosshairIcon are now independent. Feel free to add your own cursor and crosshair.
    Citing Roblox's own documentation, https://developer.roblox.com/en-us/api-reference/property/Decal/Texture, (APIReference > Building > Decal > Texture),
    "Unlike with Sound and Animation objects, the Content ID of a Decal is not the same as the number in the URL."
    What this means: The script will not accept an ID that is of the Decal type; instead, you should use an Image ID.
    In a Decal, there is a property called "Texture", which includes the Image ID you should be looking for.
    If you'd like a picture explaining what you should do, follow this link (you may need BTRoblox): https://kekse.should-kill-himself.xyz/deUi86X9_
    ]]
    getgenv().CustomCrosshairIcon = 5110080608
    getgenv().CustomCursorIcon = 6212163915
    getgenv().PointingHand = 731570578 --Not used
--[[ NOTESOUNDS
    NoteSounds are the sounds you get from getting a note; for example, switching a job.
    You can customize each note sound to your liking, then test them by typing the /e testnotes command.
    ]]
    getgenv().Note1Sound = 1862048961
    getgenv().Note1Pitch = 1
    getgenv().Note1Volume = 2

    getgenv().Note2Sound = 1555493683
    getgenv().Note2Pitch = 1
    getgenv().Note2Volume = 2

    getgenv().Note3Sound = 1862040985
    getgenv().Note3Pitch = 1
    getgenv().Note3Volume = 2

    getgenv().ErrorSound = 1544910054
    getgenv().ErrorPitch = 1
    getgenv().ErrorVolume = 2

    getgenv().BuySound = 1862043663
    getgenv().BuyPitch = 1
    getgenv().BuyVolume = 2

    getgenv().EquipSound = 1862045322
    getgenv().EquipPitch = 1
    getgenv().EquipVolume = 2

    getgenv().TeleportSoundId = 2235300587
    getgenv().TeleportPitch = 0.9
    getgenv().TeleportVolume = 5
--[[ IT'S PAYDAY, FELLAS!
    Combat stance and other shindigs.]]
    getgenv().HitmarkerSound = 7172056822 -- not worky atm but ill try to fix it :sob:
    getgenv().HitmarkerVolume = 1

    getgenv().YellowNameMusicId = 6147693845
    getgenv().YellowNameVolume = 0.5
    getgenv().YellowNameTimePosition = 1

    getgenv().RedNameMusicId = 6147695090
    getgenv().RedNameVolume = 0.5
    getgenv().RedNameTimePosition = 1

    getgenv().DeathTimerTick = 2789463529
    getgenv().DeathSound = 6686578480
    getgenv().DeathSoundStartPosition = 11 

    getgenv().RunningSound = 6544274443
--[[ ALARM <DO NOT OBFUSCATE ABOVE THIS POINT>
    (In case player decides to execute Harpmod in an unknown game or the player decides to re-execute Harpmod while it's already running)]]
    
    local AlarmSound = Instance.new("Sound",workspace)
    AlarmSound.SoundId = "rbxassetid://146404205"
    AlarmSound.Looped = true
    AlarmSound.Volume = 1
    local   OKSound = Instance.new("Sound",workspace)
    OKSound.SoundId = "rbxassetid://1852347417"
    local StarterGui = game:GetService("StarterGui") 
    local bindable = Instance.new("BindableFunction")
    function bindable.OnInvoke(response)
        if response == "OK" then
        AlarmSound:Stop()
        OKSound:Play()
        error(game.Players.LocalPlayer.DisplayName .. " is a FRIENDLYFRIEND")
    end
        if response == "Teleport" then
            game:GetService('TeleportService'):Teleport(2262441883, game.Players.LocalPlayer)
            AlarmSound:Stop()
        OKSound:Play()
        end
    end
    if game.PlaceId ~= 2262441883 then
        AlarmSound:Play()
    StarterGui:SetCore("SendNotification", {
        Title = "Harpmod",
        Text = "This is not Electric State! OK stops warning sound, Teleport takes you to Electric State",
        Duration = 120,
        Callback = bindable,
        Button1 = "OK",
        Button2 = "Teleport"
    })
    end
    if getgenv().HarpmodRunning then
        game.ReplicatedStorage.Events.Note:Fire("HARPMOD IS ALREADY RUNNING!","Check console [F9] for more details.",4)
            warn("HARPMOD WARN - Trying to execute the script again causes a conflicting loop.")
            error("HARPMOD ERROR - User attempted to run Harpmod while it is already running.")
        end
--[[ LOCALS
    Yeah]]
    
    local PianoClientOn = false
    local IsAutoReloadOn = false
    DisableRobloxOnlyOutput = false
    CurrentVersion = '1.4 Beta'
    local BetaVersion = true
    local Murray = Instance.new("Sound",workspace)
    Murray.SoundId = "rbxassetid://4746386249"
    Murray.Volume = 3
    local NewestVersion = game:HttpGet('https://raw.githubusercontent.com/romefalls/harpmod/main/LatestVersion.lua')
    local WarnedVersion = false
    local Player = game.Players.LocalPlayer
    local FlyingSound = Instance.new("Sound",workspace)
    FlyingSound.SoundId = "rbxassetid://323398261"
    FlyingSound.Volume = 2
    FlyingSound.PlaybackSpeed = 1
    local FlyingSoundHasntPlayed = true
    local ChopperSound = Instance.new("Sound",workspace)
    ChopperSound.SoundId = "rbxassetid://261199483"
    ChopperSound.Looped = true
    ChopperSound.Volume = 2
    ChopperSound.PlaybackSpeed = 1
    local JetShutdownSound =  Instance.new("Sound",workspace)
    JetShutdownSound.SoundId = "rbxassetid://5969601840"
    JetShutdownSound.Volume = 2
    JetShutdownSound.PlaybackSpeed = 1
    local HMS = Instance.new("Sound")
    HMS.SoundId = "rbxassetid://" .. HitmarkerSound
    HMS.Volume = HitmarkerVolume
    local MusicActivated = true
    local JetShutdownSoundHasntPlayed = false
    local AmmoAmount = Player.PlayerGui.Ammo.Frame.amt
    local PlayerData = Player.PlayerData
    local Sidebar = Player.PlayerGui.Client.Sidebar
    local mouse = Player:GetMouse()
    local UserInputService = game:GetService("UserInputService")
    local inv = Player.PlayerGui.Client.Inventory
    local crafting = Sidebar.Crafting
    local builtby = Player.PlayerGui.Client.BuiltBy
    local Note = game.ReplicatedStorage.Events.Note
    local TeleportSound = Instance.new("Sound",workspace)
    local jet = Instance.new("Model")
    local val = Instance.new("StringValue",jet)
    local Loaded = Instance.new("Sound",workspace)
    local ReloadSound = Instance.new("Sound",workspace)
    local input = game:GetService("UserInputService")
    TeleportSound.SoundId="rbxassetid://" .. TeleportSoundId
    TeleportSound.PlaybackSpeed=TeleportPitch
    TeleportSound.Volume = TeleportVolume
    local GUI = Player.PlayerGui
    local NoteSample = game:GetService("ReplicatedStorage").Samples.NoteSample.Frame
    local SFX = GUI.Client.SFX
    local GrappleCC = Instance.new("ColorCorrectionEffect",game.Lighting)
    local DistressSignal = Instance.new("Sound",workspace)
    DistressSignal.SoundId = "rbxassetid://1745235690"
    DistressSignal.Looped = true
    local DistressSignal2 = Instance.new("Sound",workspace)
    DistressSignal2.SoundId = "rbxassetid://6783209805"
    DistressSignal2.Looped = false
    local PumpedUp = Instance.new("Sound",workspace)
    PumpedUp.SoundId = "rbxassetid://1362210403"
    PumpedUp.Volume = 0.05
    local Advice = Player.PlayerGui.Client.Advice
    local AdviceBuilding = Advice.Building
    local CurrentlyAutoBuying = false
    local AmmoType = Player.PlayerGui.Ammo.Frame.type
    local isromefalls = false
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    local Text = Instance.new("TextLabel")
    local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
    local ImageLabel = Instance.new("ImageLabel")
    local WaitTime = Instance.new("TextLabel")
    local OK = Instance.new("TextButton")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local BackgroundDim = Instance.new("Frame")
    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    local blur = Instance.new("BlurEffect",game.Lighting)
    blur.Size = 0
    local MOTD = game:HttpGet("https://raw.githubusercontent.com/romefalls/harpmod/main/MOTD.lua")
    local YellowNameMusic = Instance.new("Sound",workspace)
    local RedNameMusic = Instance.new("Sound",workspace)
    local modGunSound = Instance.new("Sound",workspace)
    local GraphicsSound = Instance.new("Sound",workspace)
    GraphicsSound.SoundId = "rbxassetid://6958727243"
    GraphicsSound.Volume = 10
    local GraphicsEnabled = false

    local DeathGUI = Instance.new("ScreenGui")
    local DeathFrame = Instance.new("Frame")
    local RespawningIn = Instance.new("TextLabel")
    local Time = Instance.new("TextLabel")
    local LoadRing = Instance.new("ImageLabel")
    local DeathDim = Instance.new("Frame")

    DeathGUI.Name = "DeathGUI"
    DeathGUI.Parent = Player:WaitForChild("PlayerGui")
    DeathGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    DeathDim.Name = "DeathDim"
    DeathDim.Parent = DeathGUI
    DeathDim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    DeathDim.BackgroundTransparency = 1.000
    DeathDim.Size = UDim2.new(1, 0, 1, 0)
    DeathGUI.IgnoreGuiInset = true
    DeathFrame.Name = "DeathFrame"
    DeathFrame.Parent = DeathGUI
    DeathFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    DeathFrame.BackgroundColor3 = Color3.fromRGB(147, 0, 2)
    DeathFrame.BorderColor3 = Color3.fromRGB(104, 0, 1)
    DeathFrame.BorderSizePixel = 5
    DeathFrame.ClipsDescendants = true
    DeathFrame.LayoutOrder = 1
    DeathFrame.Position = UDim2.new(0.95159781, 0, 0.904576778, 0)
    DeathFrame.Selectable = true
    DeathFrame.Size = UDim2.new(0.0479446985, 0, 0.0943027362, 0)
    DeathFrame.Visible = false
    DeathFrame.ZIndex = 167

    RespawningIn.Name = "RespawningIn"
    RespawningIn.Parent = DeathFrame
    RespawningIn.AnchorPoint = Vector2.new(0.5, 0.5)
    RespawningIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RespawningIn.BackgroundTransparency = 1.000
    RespawningIn.Position = UDim2.new(0.281183958, 0, 0.48999998, 0)
    RespawningIn.Size = UDim2.new(0, 271, 0, 87)
    RespawningIn.Visible = false
    RespawningIn.ZIndex = -3
    RespawningIn.Font = Enum.Font.Oswald
    RespawningIn.Text = "RESPAWNING IN:"
    RespawningIn.TextColor3 = Color3.fromRGB(255, 255, 255)
    RespawningIn.TextSize = 40.000
    RespawningIn.TextWrapped = true

    Time.Name = "Time"
    Time.Parent = DeathFrame
    Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Time.BackgroundTransparency = 1.000
    Time.ClipsDescendants = true
    Time.Position = UDim2.new(0.222449169, 0, 0.175504699, 0)
    Time.Size = UDim2.new(0, 56, 0, 56)
    Time.ZIndex = 7787
    Time.Font = Enum.Font.Oswald
    Time.Text = "5"
    Time.TextColor3 = Color3.fromRGB(255, 255, 255)
    Time.TextSize = 67.000

    LoadRing.Name = "LoadRing"
    LoadRing.Parent = DeathFrame
    LoadRing.AnchorPoint = Vector2.new(0.5, 0.5)
    LoadRing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LoadRing.BackgroundTransparency = 1.000
    LoadRing.Position = UDim2.new(0.504033208, 0, 0.48853153, 0)
    LoadRing.Size = UDim2.new(0, 64, 0, 64)
    LoadRing.ZIndex = 12
    LoadRing.Image = "rbxassetid://4965945816"
    LoadRing.ImageColor3 = Color3.fromRGB(255, 0, 4)
    local Music = Instance.new("Sound",workspace)
	Music.SoundId = "rbxassetid://1202052536"
	Music.Volume = 2
	local BlacklistSound = Instance.new("Sound",workspace)
	BlacklistSound.SoundId = "rbxassetid://4553891293"
	BlacklistSound.Volume = 5
	local TickSound = Instance.new('Sound',workspace)
	TickSound.SoundId = "rbxassetid://4843088994"
--[[ SOUNDS
    The ones mentioned at the start of the script]]
    local EasterEgg1 = Instance.new("Sound",workspace)
    local YoLoaded = Instance.new("Sound",workspace)
    EasterEgg1.SoundId = "rbxassetid://5936419248"
    EasterEgg1.TimePosition = 100
    EasterEgg1.Volume = 2
    YoLoaded.SoundId = "rbxassetid://3020149185"
    Loaded.SoundId="rbxassetid://6963032794"
    Loaded.Volume = 1
    Loaded.PlaybackSpeed = 1
    ReloadSound.SoundId="rbxassetid://" .. ReloadSoundId
    ReloadSound.Volume = ReloadVolume
    ReloadSound.Looped = true
    SFX.note1.SoundId="rbxassetid://" .. Note1Sound
    SFX.note1.PlaybackSpeed=Note1Pitch
    SFX.note1.Volume = Note1Volume
    SFX.note2.SoundId="rbxassetid://" .. Note2Sound
    SFX.note2.PlaybackSpeed=Note2Pitch
    SFX.note2.Volume = Note2Volume
    SFX.note3.SoundId="rbxassetid://" .. Note3Sound
    SFX.note3.PlaybackSpeed=Note3Pitch
    SFX.note3.Volume = Note3Volume
    SFX.error.SoundId="rbxassetid://" .. ErrorSound
    SFX.error.PlaybackSpeed=ErrorPitch
    SFX.error.Volume = ErrorVolume
    SFX.buy.SoundId="rbxassetid://" .. BuySound
    SFX.buy.Volume = BuyVolume
    SFX.buy.PlaybackSpeed = BuyPitch
    SFX.equip.SoundId="rbxassetid://" .. EquipSound
    SFX.equip.Volume = EquipVolume
    SFX.equip.PlaybackSpeed = EquipPitch

    -- THE FOLLOWING IS WIP

    local Menu = game.Players.LocalPlayer.PlayerGui.Client.Menu
    local Ammo = game.Players.LocalPlayer.PlayerGui.Ammo
    local Jobs = Menu.Jobs
    Jobs.TextButton.TextLabel.Font= GlobalFont
    Jobs.TextButton.Font = GlobalFont
    Jobs.Which.Font = GlobalFont
    Jobs.Extras.Font = GlobalFont
    Jobs.Desc.Font = GlobalFont
    Jobs.Title.Font= GlobalFont
    Jobs.TextButton.BackgroundColor3 =  Color3.fromRGB(25,25,25)
    Jobs.TextButton.BorderColor3 =  Color3.fromRGB(12,12,12)
    game.ReplicatedStorage.Samples.JobSample.Font = GlobalFont
    Menu.Catagories.ImageColor3 = Color3.fromRGB(25,25,25)
    Menu.Catagories["1"]["1"].TextLabel.Font = GlobalFont
    Menu.Catagories["2"]["2"].TextLabel.Font = GlobalFont
    Menu.Catagories["3"]["3"].TextLabel.Font = GlobalFont
    Menu.Catagories["4"]["4"].TextLabel.Font = GlobalFont
    Menu.Rules.desc.Font = GlobalFont
    Menu.Rules.desc.Text = "How to get started: \n 1. Don't be a dirty little FRIENDLYfriend like Edd_E, Rylock, or 2J0Y. \n 2. Always keep in mind that the People's Republic of Harpmod shall not be challenged by antagonist entities. PRH is and forever will be a beautiful nation. \n 3. Always hate FRIENDLYs, FRIENDs, friends and friends. \n 4. 动态网自由门 天安門 天安门 法輪功 李洪志 六四天安門事件 天安門大屠殺 反右派鬥爭 大躍進政策 文化大革命 \n 5. i suck romefalls' dick at a smile for hours at a time stare at his nutsack while i hold back my cum tonight \n \n 6. To get future updates of Harpmod and Piano Client, join this server: https://discord.gg/Y4Dxej2WRX"
    Menu.ImageLabel.ImageColor3 = Color3.fromRGB(5,5,5)
    Menu.ImageLabel.ImageTransparency = 0
    Menu.Cancel.ImageColor3 = Color3.fromRGB(88,0,0)
    Menu.Cancel.TextLabel.Font = GlobalFont
    AmmoType.BorderSizePixel = 0
    AmmoType.TextXAlignment = Enum.TextXAlignment.Center
    Ammo.Frame.amt.BackgroundTransparency = 1
    Ammo.Frame.amt.Changed:Connect(function(a)
        if a ~= "BackgroundTransparency" then
            print(a)
            Ammo.Frame.amt.BackgroundTransparency = 0.8
            if AmmoType.TextSize == 16 then 
                AmmoType.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                AmmoType.BackgroundTransparency = 0.4
                task.wait(0.1)
                game:GetService("TweenService"):Create(AmmoType, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                game:GetService("TweenService"):Create(AmmoType, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            end
            task.wait(0.1)
            game:GetService("TweenService"):Create(Ammo.Frame.amt, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        end
    end)
    Ammo.StudsOffset = Vector3.new(0.3,0.5,0)
    Ammo.Frame.amt.BackgroundColor3 = Color3.fromRGB(34,34,34)
    Ammo.Frame.amt.BorderSizePixel = 0
    Menu.Jobs.ScrollingFrame.ScrollBarThickness = 2
    Menu.Jobs.ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(55,55,55)
    Menu.Shop.ScrollingFrame.ScrollBarThickness = 2
    Menu.Shop.TextButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Menu.Shop.TextButton.BorderColor3 = Color3.fromRGB(25,25,25)
    Menu.Shop.TextButton2.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Menu.Shop.TextButton2.BorderColor3 = Color3.fromRGB(25,25,25)
    Menu.Shop.TextButton2.Font = GlobalFont
    Menu.Shop.TextButton.Font = GlobalFont
    Menu.Shop.TextButton.info.Font = GlobalFont
    Menu.Shop.Desc.Font = GlobalFont
    Menu.Shop.Title.Font = GlobalFont
    Menu.Shop.Req.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Menu.Shop.Reqt.BackgroundColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Sidebar.Catalog.TextLabel:Destroy()
    game.Players.LocalPlayer.PlayerGui.Client.Sidebar.Catalog.TextLabel.Text = ""
    Menu.Shop.Req.Font = GlobalFont
    Menu.Shop.Reqt.Font = GlobalFont
    Menu.ECurrency.Visible = true
    Menu.ECurrency.Font = GlobalFont
    Menu.ECurrency.Amt.Font = GlobalFont
    game:GetService("Players").LocalPlayer.PlayerGui.Client.Menu.Currency.Font = GlobalFont
    Menu.Currency.Amt.Font = GlobalFont
    game:GetService("Players").LocalPlayer.PlayerGui.Client.Menu.PCurrency.Font = GlobalFont
    Menu.PCurrency.Amt.Font = GlobalFont
    local confirmbox = game.Players.LocalPlayer.PlayerGui.Client.Menu.ConfirmBox
    local savedata = game.Players.LocalPlayer.PlayerGui.Client.Menu.SaveData
    confirmbox.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
    confirmbox.ImageLabel.ImageTransparency = 0
    confirmbox.Confirm.Font = GlobalFont
    confirmbox.Confirm.BackgroundColor3 = Color3.fromRGB(22,22,22)
    confirmbox.Confirm.BorderColor3 = Color3.fromRGB(11,11,11)
    confirmbox.Close.BackgroundColor3 = Color3.fromRGB(22,22,22)
    confirmbox.Close.BorderColor3 = Color3.fromRGB(11,11,11)
    confirmbox.Close.Font = GlobalFont
    confirmbox.STR.TextBox.Font = GlobalFont
    game:GetService("Players").LocalPlayer.PlayerGui.Client.Menu.ConfirmBox.AMTtoPLR.TextBox.title.Font = GlobalFont
    confirmbox.AMTtoPLR.TextBox.Font = GlobalFont
    confirmbox.AMTtoPLR.Desc.Font = GlobalFont
    confirmbox.AMTtoPLR.TextBox2.Font = GlobalFont
    confirmbox.AMTtoPLR.TextBox2.title.Font = GlobalFont
    confirmbox.AMTtoPLR.TextBox.BorderColor3 = Color3.fromRGB(11,11,11)
    confirmbox.AMTtoPLR.TextBox.BackgroundColor3 = Color3.fromRGB(22,22,22)
    confirmbox.AMTtoPLR.TextBox2.BorderColor3 = Color3.fromRGB(11,11,11)
    confirmbox.AMTtoPLR.TextBox2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    confirmbox.CNFRM.Desc.Font = GlobalFont
    savedata.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
    savedata.ImageLabel.ImageTransparency = 0
    savedata.Close.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.Close.BorderColor3 = Color3.fromRGB(11,11,11)
    savedata.Close.Font = GlobalFont
    savedata.DATA["1"].title.Font = GlobalFont
    savedata.DATA["2"].title.Font = GlobalFont
    savedata.DATA["3"].title.Font = GlobalFont
    savedata.DATA["4"].title.Font = GlobalFont
    savedata.DATA["5"].title.Font = GlobalFont
    savedata.DATA["6"].title.Font = GlobalFont
    savedata.DATA["1"].Save.Font = GlobalFont
    savedata.DATA["1"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["1"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["1"].Load.Font = GlobalFont
    savedata.DATA["1"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["1"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["1"].Load2.Font = GlobalFont
    savedata.DATA["1"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["1"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Save.Font = GlobalFont
    savedata.DATA["2"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Load.Font = GlobalFont
    savedata.DATA["2"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Load2.Font = GlobalFont
    savedata.DATA["2"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["2"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Save.Font = GlobalFont
    savedata.DATA["3"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Load.Font = GlobalFont
    savedata.DATA["3"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Load2.Font = GlobalFont
    savedata.DATA["3"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["3"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Save.Font = GlobalFont
    savedata.DATA["4"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Load.Font = GlobalFont
    savedata.DATA["4"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Load2.Font = GlobalFont
    savedata.DATA["4"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["4"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Save.Font = GlobalFont
    savedata.DATA["5"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Load.Font = GlobalFont
    savedata.DATA["5"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Load2.Font = GlobalFont
    savedata.DATA["5"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["5"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Save.Font = GlobalFont
    savedata.DATA["6"].Save.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Save.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Load.Font = GlobalFont
    savedata.DATA["6"].Load.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Load.BorderColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Load2.Font = GlobalFont
    savedata.DATA["6"].Load2.BackgroundColor3 = Color3.fromRGB(22,22,22)
    savedata.DATA["6"].Load2.BorderColor3 = Color3.fromRGB(22,22,22)


    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.ImageLabel.ImageTransparency = 0
    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.Toggle.BackgroundColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.Toggle.BorderColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.Close.BackgroundColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.Close.BorderColor3 = Color3.fromRGB(22,22,22)

    game.Players.LocalPlayer.PlayerGui.Client.Outfit.ImageLabel.ImageTransparency = 0   
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox.BackgroundColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox.title.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox2.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox2.title.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.TextBox2.BackgroundColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Confirm.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Confirm.BackgroundColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Confirm.BorderColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Close.BackgroundColor3 = Color3.fromRGB(22,22,22)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Close.BorderColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Close.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.check.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.check.title.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Desc.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.ImageLabel.ImageTransparency = 0
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Confirm.BackgroundColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Close.BackgroundColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Confirm.BorderColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Close.BorderColor3 = Color3.fromRGB(11,11,11)
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Close.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.Confirm.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.AMT.Desc.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.DispencerPurchase.AMT.amt.Font = GlobalFont
    local outfittext = {"is time to be mokey :3","waga baga bogo bigi bugu","FemIka: OMG ROMEFALLS THANK YOU SO MUCH FOR SAVING HOS! Romefalls: MORE LIKE UNDER NEW MANAGEMENT","she/her/they/it/bun/FLIP/you/FRIENDLY","Hiii guyss im harpmodding and being femboy UwU <3","neofausut: more like troikera","rome can you write my name on your thigh please romefemmy ;3c","OH COOL IT'S TIME TO BE MONKEY IN MONKEY TOOOOWN WAGA BAGAAAAAAAAAA!!!"}
    local outfitstring = math.random(1,#outfittext)
    local pickedoutfitstring = outfittext[outfitstring]
    game.Players.LocalPlayer.PlayerGui.Client.Outfit.Desc.Text = pickedoutfitstring

    for a1,v1 in pairs(Menu.Jobs.ScrollingFrame:GetChildren()) do
        if v1.Name ~= "UIListLayout" then
            v1.Font = GlobalFont
            v1.BackgroundColor3 = Color3.fromRGB(34,34,34)
            v1.BorderColor3 = Color3.fromRGB(22,22,22)
            for _, IHATEFRIENDLY in ipairs(v1:GetChildren()) do
                if IHATEFRIENDLY.Name == "Amt" then
                    IHATEFRIENDLY.Font = GlobalFont
                end
                if IHATEFRIENDLY.Name == "vip" then
                    IHATEFRIENDLY.Font = GlobalFont
                end
            end
        end
    end
    for a1,v1 in pairs(Menu.Shop.ScrollingFrame:GetChildren()) do
        if v1.Name ~= "UIListLayout" then
            if v1.Name == "ShopSample" then
                v1.ImageColor3 = Color3.fromRGB(34,34,34)
            end
            if v1.Name == "ShopTitleSample" then
                v1.Font = GlobalFont
            end
            for _, youareadirtylittleFRIENDLY in ipairs(v1:GetChildren()) do
                if youareadirtylittleFRIENDLY.Name == "Amt" then
                    youareadirtylittleFRIENDLY.Font = GlobalFont
                end
                if youareadirtylittleFRIENDLY.Name == "TextLabel" then
                    youareadirtylittleFRIENDLY.Font = GlobalFont
                end
                if youareadirtylittleFRIENDLY.Name == "ImageLabel" then
                    youareadirtylittleFRIENDLY:Destroy()
                end
            end
        end
    end
    for a1,v1 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Client.Menu.Action.ScrollingFrame:GetChildren()) do
        if v1.Name ~= "UIListLayout" then
            if v1.ClassName == "TextLabel" then
                v1.Font = GlobalFont
                if v1.ClassName == ImageButton then
                for _, xd in ipairs(v1:GetChildren()) do
                        print("xd")
                        xd.Font = GlobalFont
                end
            end
            end
        end
    end
    local SendMoney = game.Players.LocalPlayer.PlayerGui.Client.Menu.ConfirmBox
    game.Players.LocalPlayer.PlayerGui.Client.Menu.Action.ScrollingFrame.Pvp.TextLabel2.TextLabel2.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Menu.Action.ScrollingFrame.Pvp.TextLabel2.info.Font = GlobalFont
    game.Players.LocalPlayer.PlayerGui.Client.Menu.Action.ScrollingFrame.Pvp.TextLabel2.info.Text = "If you keep your phone credit above 0, you will be granted access to your phone. Glory to the People's Republic of Harpmod!"
    for a1,v1 in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Client.Menu.Action.ScrollingFrame:GetChildren()) do
        if v1.Name ~= "UIListLayout" then
            if v1.ClassName == "ImageButton" then
                v1.ImageColor3 = Color3.fromRGB(34,34,34)
            end
            for _, youareadirtylittleFRIENDLY in ipairs(v1:GetChildren()) do
                if youareadirtylittleFRIENDLY.Name == "TextLabel2" then
                    if youareadirtylittleFRIENDLY.Text == "Current Karma:" then
                    youareadirtylittleFRIENDLY.Text = "Phone Credit:"
                    if youareadirtylittleFRIENDLY.TextLabel2:FindFirstChild("TextLabel2") then
                        youareadirtylittleFRIENDLY.TextLabel2.Font = GlobalFont
                    end
                    end
                    youareadirtylittleFRIENDLY.Font = GlobalFont
                end
                if youareadirtylittleFRIENDLY.Name == "TextLabel" then
                    youareadirtylittleFRIENDLY.Font = GlobalFont
                end
                if youareadirtylittleFRIENDLY.Name == "ImageLabel" then
                    youareadirtylittleFRIENDLY:Destroy()
                end
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function()
        for i,v in ipairs(game:GetService("ReplicatedStorage").Samples.BuildSample:GetChildren()) do
            if v.ClassName ~= "ImageLabel" then
                v.Font = GlobalFont
            end
        end
        game.Players.LocalPlayer.PlayerGui.Client.Inventory.ImageLabel.ImageColor3 = Color3.fromRGB(11,11,11)
        game.Players.LocalPlayer.PlayerGui.Client.Inventory.ImageLabel.ImageTransparency = 0 
        for i,v in ipairs(game.Players.LocalPlayer.PlayerGui.Client.Menu.BuildingBuddies.Add:GetChildren()) do
            if v.name ~= "UIListLayout" then
               v.BackgroundColor3 = Color3.fromRGB(22,22,22)
               v.Font = GlobalFont   
               if v:FindFirstChild("Amt") then
               v.Amt.Font = GlobalFont
               end
            end
           end
        for a1,v1 in pairs(Menu.Action.ScrollingFrame:GetChildren()) do
            if v1.Name ~= "UIListLayout" then
                if v1.ClassName == "ImageButton" then
                    v1.ImageColor3 = Color3.fromRGB(34,34,34)
                end
            end
        end
        for a1,v1 in pairs(Menu.Shop.ScrollingFrame:GetChildren()) do
            if v1.Name ~= "UIListLayout" then
                if v1.Name == "ShopSample" then
                    v1.ImageColor3 = Color3.fromRGB(34,34,34)
                end
            end
        end
        Menu.Catagories["1"]["1"].ImageColor3 = Color3.fromRGB(55,55,55)
        Menu.Catagories["2"]["2"].ImageColor3 = Color3.fromRGB(55,55,55)
        Menu.Catagories["3"]["3"].ImageColor3 = Color3.fromRGB(55,55,55)
        Menu.Catagories["4"]["4"].ImageColor3 = Color3.fromRGB(55,55,55)
        Menu.Shop.TextButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
        Menu.Shop.TextButton.BorderColor3 = Color3.fromRGB(25,25,25)
        Menu.Shop.TextButton2.BackgroundColor3 = Color3.fromRGB(25,25,25)
        Menu.Shop.TextButton2.BorderColor3 = Color3.fromRGB(25,25,25)
        end)

--[[ LASER GRAPPLE
    WOO YEAH
    ]]
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local character = Players.LocalPlayer.Character 
    local humanoid = character:FindFirstChild("Humanoid")
    local animation = Instance.new("Animation")
    local Ammo = game.Players.LocalPlayer.PlayerGui.Ammo
    local grapplespark = Instance.new("ParticleEmitter",character.RightHand)
    animation.AnimationId = "rbxassetid://4524008587"
     
    local grappletrack = humanoid:LoadAnimation(animation)

    grapplespark.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(0.0549, Color3.fromRGB(255,247,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,247,0))
    }
    grapplespark.LightEmission = 1
    grapplespark.LightInfluence = 1
    grapplespark.Orientation = "VelocityParallel"
    grapplespark.Size = NumberSequence.new{
        NumberSequenceKeypoint.new(0,0.437),
        NumberSequenceKeypoint.new(1,0)
    }
    grapplespark.Texture = "rbxassetid://79261653"
    grapplespark.ZOffset = 1
    grapplespark.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0,0),
        NumberSequenceKeypoint.new(1,0)
    }
    grapplespark.Drag = 5
    grapplespark.EmissionDirection = "Bottom"
    grapplespark.Enabled = false
    grapplespark.Lifetime = NumberRange.new(1,2)
    grapplespark.Rate = 100
    grapplespark.RotSpeed = NumberRange.new(-20,20)
    grapplespark.Speed = NumberRange.new(5,5)
    grapplespark.SpreadAngle = Vector2.new(-180,180)
    -- grab local player
    local localPlayer = Players.LocalPlayer
    local char = localPlayer.Character
    local breathSound = Instance.new("Sound",workspace)
    breathSound.SoundId = "rbxassetid://5585363779"
    breathSound.PlaybackSpeed = 1
    breathSound.Volume = 3
    local BeamActiveSound = Instance.new("Sound",workspace)
    BeamActiveSound.SoundId = "rbxassetid://2061260645"
    BeamActiveSound.PlaybackSpeed = 1
    BeamActiveSound.Volume = 0.1
    BeamActiveSound.Looped = true
    local keySound = Instance.new("Sound",workspace)
    keySound.SoundId = "rbxassetid://6236124336"
    keySound.PlaybackSpeed = 1
    keySound.Volume = 3
    function getRoot(char)
        local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
        return rootPart
    end
    local BeamAct = Instance.new("Sound",workspace)
    BeamAct.SoundId = "rbxassetid://4210124665"
    local BeamDAct = Instance.new("Sound",workspace)
    BeamDAct.SoundId = "rbxassetid://6174659906"
    local ClampSound = Instance.new("Sound",workspace)
    ClampSound.SoundId = "rbxassetid://5735282994"
    ClampSound.Volume = 2
    local DragSound = Instance.new("Sound",workspace)
    DragSound.SoundId = "rbxassetid://291203268"
    DragSound.Volume = 0.5
    local FinishClampSound = Instance.new("Sound",workspace)
    FinishClampSound.SoundId = "rbxassetid://156221488"
    FinishClampSound.Volume = 0.5
    local NilTargetSound = Instance.new("Sound",workspace)
    NilTargetSound.SoundId = "rbxassetid://6372116143"
    NilTargetSound.PlaybackSpeed = 1
    NilTargetSound.Volume = 1
    NilTargetSound.Looped = false

    -- create beam
    local beam = Instance.new("Beam")
    beam.Segments = 1
    beam.LightEmission = 5
    beam.Width0 = 0.2
    beam.Width1 = 0.2
    beam.Color = ColorSequence.new(Color3.fromRGB(255, 55, 55))
    beam.FaceCamera = true
     
    -- create attachments
    local attachment0 = Instance.new("Attachment")
    local attachment1 = Instance.new("Attachment")
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1
     
    -- parent attachments to Terrain 
    beam.Parent = workspace.Terrain
    attachment0.Parent = workspace.Terrain
    attachment1.Parent = workspace.Terrain
     
    -- grab the mouse
    local mouse = localPlayer:GetMouse()
     
    -- connect to RenderStepped (update every frame)
    RunService.RenderStepped:Connect(function()
     
    	-- make sure the character exists
    	local character = localPlayer.Character
    	if not character then
    		-- disable the beam
            grapplespark.Enabled = false
    		beam.Enabled = false
    		return
    	end
     
    	-- make sure the head exists
    	local head = character:FindFirstChild("RightHand")
    	if not head then
    		-- disable the beam
            grapplespark.Enabled = false
    		beam.Enabled = false
    		return
    	end
    	-- define origin and finish
    	local origin = head.Position
    	local finish = mouse.Hit.p
     
    	-- move the attachments 
    	attachment0.Position = origin
    	attachment1.Position = finish

        if beam.Enabled == true then
            if BeamActiveSound.Playing == false then
                BeamActiveSound:Play()
            end
            if mouse.Target == nil then
                beam.Color = ColorSequence.new(Color3.fromRGB(55,55,55))
            end
            if mouse.Target ~= nil then
            if mouse.Target.Parent.Name == "Sedan" or mouse.Target.Parent.Name == "Royce" or mouse.Target.Parent.Name == "Lucky" or mouse.Target.Parent.Name == "Armored Truck" or mouse.Target.Parent.Name == "Ole Reliable" or mouse.Target.Parent.Name == "Pickup Truck" or mouse.Target.Parent.Name == "Ole Reliable" or mouse.Target.Parent.Name == "Tan Jeep" or mouse.Target.Parent.Name == "Jeep Island" then
                beam.Color = ColorSequence.new(Color3.fromRGB(55, 55, 255))
                BeamActiveSound.Volume = 0.5
            else if mouse.Target.Name == "Door" or mouse.Target.Name == "Board" then
                BeamActiveSound.Volume = 0.5
                beam.Color = ColorSequence.new(Color3.fromRGB(56, 56, 255))
            else if mouse.Target.Parent:FindFirstChild("Humanoid") or mouse.Target.Parent:FindFirstChild("Handle") then
                if Ammo.Enabled == true then
                    if mouse.Target.Parent:FindFirstChild("NameTag") then
                        beam.Color = ColorSequence.new(mouse.Target.Parent.NameTag.TextLabel.TextColor3)
                    end
                end
            else beam.Color = ColorSequence.new(Color3.fromRGB(255, 55, 55))
                BeamActiveSound.Volume = 0.1
            end
            end
        end
    end
    end
        if beam.Enabled == false then
            BeamActiveSound:Stop()
        end
        end)
        mouse.KeyDown:Connect(function(key)
            if key == "z" then
                if beam.Enabled == false then
                beam.Enabled = true
                BeamAct:Play()
            else beam.Enabled = false
                BeamDAct:Play()
            end
            end
        end)
        mouse.Button1Down:Connect(function()
            if beam.Enabled == true then
                if Ammo.Enabled == false then
                if beam.Color == ColorSequence.new(Color3.fromRGB(55, 55, 255)) then
                    if mouse.Target.Parent:FindFirstChild("TrueOwner").Locked.Value == false then
                        if breathSound.Playing == true then
                            game.Workspace.Gravity = 0
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.PrimaryPart.Position, mouse.Hit.p))
                            game:GetService("TweenService"):Create(getRoot(game.Players.LocalPlayer.Character), TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,7,0))}):Play()
                            grappletrack:Play()
                            ClampSound:Play()
                            DragSound:Play()
                            grapplespark.Enabled = true
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                            beam.Enabled = false
                            wait(1)
                            beam.Enabled = true
                            BeamAct:Play()
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 55, 55))
                            game.Workspace.Gravity = 196.2
                            grappletrack:Stop()
                            FinishClampSound:Play()
                            grapplespark.Enabled = false
                        end
                        keySound:Play()
                        breathSound:Play()
                    end
                    if mouse.Target.Parent:FindFirstChild("TrueOwner"):FindFirstChild("Locked").Value == true then
                        mouse.Target.Parent.TrueOwner.Locked.Value = false 
                    keySound:Play()
                    end
                end
                if beam.Color == ColorSequence.new(Color3.fromRGB(56, 56, 255)) then
                    if mouse.Target.Transparency == 0.7 or mouse.Target.CanCollide == false then
                        if breathSound.Playing == true then
                            game.Workspace.Gravity = 0
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.PrimaryPart.Position, mouse.Hit.p))
                            game:GetService("TweenService"):Create(getRoot(game.Players.LocalPlayer.Character), TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,1,0))}):Play()
                            grappletrack:Play()
                            ClampSound:Play()
                            DragSound:Play()
                            grapplespark.Enabled = true
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                            beam.Enabled = false
                            wait(1)
                            beam.Enabled = true
                            BeamAct:Play()
                            beam.Color = ColorSequence.new(Color3.fromRGB(255, 55, 55))
                            game.Workspace.Gravity = 196.2
                            grappletrack:Stop()
                            FinishClampSound:Play()
                            grapplespark.Enabled = false
                        end
                        breathSound:Play()
                        keySound:Play()
                    else mouse.Target.CanCollide = false
                        mouse.Target.Transparency = 0.7
                        keySound:Play()
                    end
                end
                if beam.Color == ColorSequence.new(Color3.fromRGB(55,55,55)) then
                    if mouse.Target == nil then
                        NilTargetSound:Play()
                    end
                end
                if beam.Color == ColorSequence.new(Color3.fromRGB(255, 55, 55)) then
                    if mouse.Target ~= nil then
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = false         -- now the person isnt sitting if they were
                    wait(.1)
                end
                if breathSound.Playing ~= true then
                game.Workspace.Gravity = 0
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.PrimaryPart.Position, mouse.Hit.p))
                game:GetService("TweenService"):Create(getRoot(game.Players.LocalPlayer.Character), TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,7,0))}):Play()
                grappletrack:Play()
                ClampSound:Play()
                DragSound:Play()
                grapplespark.Enabled = true
                beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
                beam.Enabled = false
                wait(1)
                beam.Enabled = true
                BeamAct:Play()
                beam.Color = ColorSequence.new(Color3.fromRGB(255, 55, 55))
                game.Workspace.Gravity = 196.2
                grappletrack:Stop()
                FinishClampSound:Play()
                grapplespark.Enabled = false
                end
            end
            end
            end
        end
        end)
    beam.Enabled = false
--NOW WATCH ME NAE NAE
local RunService = game:GetService("RunService") --bobble boobel
local playerModel = game.Players.LocalPlayer.Character
local humanoid = playerModel:WaitForChild("Humanoid")
playerModel:WaitForChild("HumanoidRootPart"):WaitForChild("Running").SoundId = "rbxassetid://" .. RunningSound
local runsound = playerModel.HumanoidRootPart.Running
local function updateBobbleEffect()
    local now = tick()
    if humanoid.MoveDirection.Magnitude > 0 then -- Are we walking?
        if humanoid.WalkSpeed == 10 then
            runsound.PlaybackSpeed = 0.8
            runsound.Volume = 0.5
        end
        if humanoid.WalkSpeed == 16 then
            runsound.PlaybackSpeed = 1
            runsound.Volume = 0.75
        end
        if humanoid.WalkSpeed == 24 then 
            runsound.PlaybackSpeed = 1.2
            runsound.Volume = 1
        end
        local yeah = humanoid.WalkSpeed * 0.02
        local velocity = humanoid.RootPart.Velocity
        local bobble_X = math.cos(now * 9) * yeah
        local bobble_Y = math.abs(math.sin(now * 12)) * yeah
        local bobble = Vector3.new(bobble_X,bobble_Y,0) * math.min(1, velocity.Magnitude / humanoid.WalkSpeed * 2)
        if Player.PlayerGui.Ammo.Enabled == false or mouse.Icon ~= "rbxassetid://" .. CustomCrosshairIcon then
        humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble,.25)
        end
    else
        if Player.PlayerGui.Ammo.Enabled == false or mouse.Icon ~= "rbxassetid://" .. CustomCrosshairIcon then
            humanoid.CameraOffset = humanoid.CameraOffset * 0.75
        end
    end
end
 
-- Update the effect on every single frame.
RunService.RenderStepped:Connect(updateBobbleEffect)


    local TweenService = game:GetService("TweenService")
    local Died = false
    local DeathFrame = DeathGUI.DeathFrame
    local Blur = Instance.new("BlurEffect",game.Lighting)
    Blur.Size = 0
    local LoadingRing = DeathFrame.LoadRing
    local DeathTime = DeathFrame.Time
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 6)
    local tween = TweenService:Create(LoadingRing, tweenInfo, {Rotation=360})
    local DeathTickSound = Instance.new("Sound",workspace)
    DeathTickSound.SoundId = "rbxassetid://" .. DeathTimerTick
    DeathTickSound.Volume = 0.5
    local DeathMusic = Instance.new("Sound",workspace)
    DeathMusic.SoundId = "rbxassetid://" .. DeathSound
    DeathMusic.Volume = 0.5
    local YellowEqualizer = Instance.new("EqualizerSoundEffect",YellowNameMusic)
    local RedEqualizer = Instance.new("EqualizerSoundEffect",RedNameMusic)
    RedEqualizer.HighGain = 0
    RedEqualizer.MidGain = 0
    RedEqualizer.LowGain = 0
    YellowEqualizer.HighGain = 0
    YellowEqualizer.MidGain = 0
    YellowEqualizer.LowGain = 0
    char:WaitForChild("Humanoid").Died:Connect(function()
        ReloadSound:Stop()
        grapplespark.Parent = game.Workspace.Terrain
        if Died == false then
            Died = true
            if DeathMusic.TimePosition < DeathSoundStartPosition then
                DeathMusic.TimePosition = DeathSoundStartPosition
            end
            FinishClampSound:Play()
            Player.PlayerGui.Ammo.Enabled = false
            DeathFrame.BackgroundTransparency = 0
            LoadingRing.ImageTransparency= 0
            DeathTime.TextTransparency = 0
            DeathMusic:Play()
            tween:Play()
            DeathFrame.Visible = true
            local DefaultFoV = 65
            local Properties = {FieldOfView = DefaultFoV + 15}
            local Info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out) -- edit as you want
            local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
            T:Play()
            for i = 1, 10 do
                DeathDim.BackgroundTransparency = DeathDim.BackgroundTransparency - 0.05
                Blur.Size = Blur.Size + 1
                if RedNameMusic.Playing == true then
                    RedEqualizer.HighGain = RedEqualizer.HighGain - 2
                    RedEqualizer.MidGain = RedEqualizer.MidGain - 2
                end
                if YellowNameMusic.Playing == true then
                    YellowEqualizer.HighGain = YellowEqualizer.HighGain - 2
                    YellowEqualizer.MidGain = YellowEqualizer.MidGain - 2
                end
                wait()
            end
            DeathTime.Text = "5"
            DeathTickSound:Play()
            wait(1)
            DeathTime.Text = "4"
            DeathTickSound:Play()
            wait(1)
            DeathTickSound:Play()
            DeathTime.Text = "3"
            wait(1)
            DeathTickSound:Play()
            DeathTime.Text = "2"
            wait(1)
            DeathTickSound:Play()
            DeathTime.Text = "1"
            wait(1)
            DeathTickSound:Play()
            DeathTime.Text = "0"
            for i = 1, 10 do
                DeathDim.BackgroundTransparency = DeathDim.BackgroundTransparency + 0.05
                DeathFrame.BackgroundTransparency =  DeathFrame.BackgroundTransparency + 0.1
                LoadingRing.ImageTransparency= LoadingRing.ImageTransparency + 0.1
                DeathTime.TextTransparency = DeathTime.TextTransparency + 0.1
                Blur.Size = Blur.Size - 1
                RedEqualizer.HighGain = RedEqualizer.HighGain + 2
                RedEqualizer.MidGain = RedEqualizer.MidGain + 2
                YellowEqualizer.HighGain = YellowEqualizer.HighGain + 2
                YellowEqualizer.MidGain = YellowEqualizer.MidGain + 2
                wait()
            end
            DeathFrame.Visible = false
            Died = false
            wait(1)
            DeathTime.Text = "5"
            ReloadSound:Stop()
        end
    end)
    Player.CharacterAdded:Connect(function(char)
        grapplespark.Parent = char:WaitForChild("RightHand")
        grappletrack = char:WaitForChild("Humanoid"):LoadAnimation(animation)
        char.Humanoid.Died:Connect(function()
            ReloadSound:Stop()
            if Died == false then
                Died = true
                if DeathMusic.TimePosition < DeathSoundStartPosition then
                    DeathMusic.TimePosition = DeathSoundStartPosition
                end
                FinishClampSound:Play()
                Player.PlayerGui.Ammo.Enabled = false
                DeathFrame.BackgroundTransparency = 0
                LoadingRing.ImageTransparency= 0
                DeathTime.TextTransparency = 0
                DeathMusic:Play()
                tween:Play()
                DeathFrame.Visible = true
                local DefaultFoV = 65
                local Properties = {FieldOfView = DefaultFoV + 25}
                local Info = TweenInfo.new(5.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) -- edit as you want
                local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
                T:Play()
                for i = 1, 10 do
                    DeathDim.BackgroundTransparency = DeathDim.BackgroundTransparency - 0.05
                    Blur.Size = Blur.Size + 1
                    if RedNameMusic.Playing == true then
                        RedEqualizer.HighGain = RedEqualizer.HighGain - 2
                        RedEqualizer.MidGain = RedEqualizer.MidGain - 2
                    end
                    if YellowNameMusic.Playing == true then
                        YellowEqualizer.HighGain = YellowEqualizer.HighGain - 2
                        YellowEqualizer.MidGain = YellowEqualizer.MidGain - 2
                    end
                    wait()
                end
                DeathTime.Text = "5"
                DeathTickSound:Play()
                wait(1)
                DeathTime.Text = "4"
                DeathTickSound:Play()
                wait(1)
                DeathTickSound:Play()
                DeathTime.Text = "3"
                wait(1)
                DeathTickSound:Play()
                DeathTime.Text = "2"
                wait(1)
                DeathTickSound:Play()
                DeathTime.Text = "1"
                wait(1)
                DeathTickSound:Play()
                DeathTime.Text = "0"
                for i = 1, 10 do
                    DeathDim.BackgroundTransparency = DeathDim.BackgroundTransparency + 0.05
                    DeathFrame.BackgroundTransparency =  DeathFrame.BackgroundTransparency + 0.1
                    LoadingRing.ImageTransparency= LoadingRing.ImageTransparency + 0.1
                    DeathTime.TextTransparency = DeathTime.TextTransparency + 0.1
                    Blur.Size = Blur.Size - 1
                    RedEqualizer.HighGain = RedEqualizer.HighGain + 2
                    RedEqualizer.MidGain = RedEqualizer.MidGain + 2
                    YellowEqualizer.HighGain = YellowEqualizer.HighGain + 2
                    YellowEqualizer.MidGain = YellowEqualizer.MidGain + 2
                    wait()
                end
                DeathFrame.Visible = false
                Died = false
                wait(1)
                DeathTime.Text = "5"
                ReloadSound:Stop()
            end
        end)
    end)

            
--[[ GUI MODIFICATION
    PlayerGui stuff]]
    local GlitchVoice = Instance.new("Sound",workspace)
    GlitchVoice.SoundId = 'rbxassetid://1764961429'
    GlitchVoice.Looped = true
    GlitchVoice.PlaybackSpeed = 0
    GlitchVoice.Volume = 0
    AmmoAmount.TextColor3 = Color3.fromRGB(234, 244, 244)
    AmmoAmount.Font = GlobalFont
    Player.PlayerGui.Client.BuiltBy.Font = GlobalFont
    Player.PlayerGui.Ammo.Frame.warn.Font = Enum.Font.RobotoCondensed
    AmmoType.TextColor3 = Color3.fromRGB(200,210,210)
    AmmoType.Font = Enum.Font.Roboto
    Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(234, 244, 244)
    AmmoType.TextSize = 0
    Player.PlayerGui.TopBar.Frame:Destroy()
    Sidebar.Backpack.Image=("rbxassetid://0")
    Sidebar.Backpack.TextLabel.Font = GlobalFont
    Sidebar.Backpack.TextLabel.Text = ("")
    Sidebar.Menu.Image=("rbxassetid://0")
    Sidebar.Menu.TextLabel.Font = GlobalFont
    Sidebar.Menu.TextLabel.Text = ("")
    Sidebar.Build.Image=("rbxassetid://0")
    Sidebar.Build.TextLabel.Text = ("")
    Sidebar.Build.TextLabel.Font = GlobalFont
    Sidebar.Catalog.Image=("rbxassetid://6936032800")
    Sidebar.Catalog.ImageColor3 = Color3.fromRGB(200,200,200)
    Sidebar.Catalog.TextLabel.Font = GlobalFont
    Sidebar.Hunger.Image=("")
    Sidebar.Hunger.TextLabel.Font = GlobalFont
    Sidebar.Hunger.Frame.ImageColor3 = Color3.fromRGB(22,22,22)
    Sidebar.Hunger.Frame.Frame.ImageColor3 = Color3.fromRGB(55,55,55)
    inv.Slots.Font = GlobalFont
    inv.Slots.Amt.Font = GlobalFont
    inv.Currency.Font = GlobalFont
    inv.PCurrency.Font = GlobalFont
    inv.Currency.Amt.Font = GlobalFont
    inv.PCurrency.Amt.Font = GlobalFont
    crafting.hungry.Font = GlobalFont
    crafting.amt.Font = GlobalFont
    crafting.Image = 0
    crafting.hungry.Font = GlobalFont
    crafting.amt.Font = GlobalFont
    crafting.TextLabel.Font = GlobalFont
    crafting.TextLabel.TextSize = 55
    builtby.Font = GlobalFont
    builtby.report.Font = GlobalFont
    builtby.report.Text = ("Press 'U' to cry about it")
    Advice.Jetpack:ClearAllChildren()
    Advice.Gun:ClearAllChildren()
    Advice.Inventory:ClearAllChildren()
    Advice.Tele:ClearAllChildren()
    Advice.Vigor:ClearAllChildren()
    Player.PlayerGui.Client.Killzone.Font = GlobalFont
    Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
    NoteSample.textName.Font = GlobalFont
    NoteSample.textMessage.Font = GlobalFont
    NoteSample.textName.RichText = true
    NoteSample.textMessage.RichText = true
    Player.PlayerGui.Client.ver.Font = GlobalFont
    jet.Name = "Jetpack"
    val.Name = "RealValue"
    val.Value = "Static Jetpack"
    for _, a in pairs(Player.PlayerGui.Ammo.Frame:GetChildren()) do
    if a.Name == 'Line' then 
    a.Visible = false
    end
    end
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
if key == "m" then
        if MusicActivated == true then
            Note:Fire("Combat Sounds","Deactivated.  Press M to reactivate",5)
            MusicActivated = false
            wait(1)
       else
        Note:Fire("Combat Sounds","Activated.  Press M to deactivate",5)
        MusicActivated = true
        wait(1)
       end
    end
end)
local waa = math.random(1,1000)
if waa == 1 then
    getgenv().waawaa = true
end
local randomegg = math.random(1,25)
if randomegg == 1 then
    EasterEgg1:Play()
    while EasterEgg1.Playing do 
        wait()
            if EasterEgg1.TimePosition > 103.2 then
                EasterEgg1:Stop()
            end
        end
    end

    local p = game.Players.LocalPlayer
p.CharacterAdded:Connect(function(char)
    local RunService = game:GetService("RunService") --bobble boobel
    local playerModel = game.Players.LocalPlayer.Character
    local humanoid = playerModel:WaitForChild("Humanoid")
    playerModel:WaitForChild("HumanoidRootPart"):WaitForChild("Running").SoundId = "rbxassetid://" .. RunningSound
    local runsound = playerModel.HumanoidRootPart.Running
    local function updateBobbleEffect()
    	local now = tick()
    	if humanoid.MoveDirection.Magnitude > 0 then -- Are we walking?
            if humanoid.WalkSpeed == 10 then
                runsound.PlaybackSpeed = 0.8
                runsound.Volume = 0.5
            end
            if humanoid.WalkSpeed == 16 then
                runsound.PlaybackSpeed = 1
                runsound.Volume = 0.75
            end
            if humanoid.WalkSpeed == 24 then
                runsound.PlaybackSpeed = 1.2
                runsound.Volume = 1
            end
    		local velocity = humanoid.RootPart.Velocity
    		local bobble_X = math.cos(now * 9) / 5 
    		local bobble_Y = math.abs(math.sin(now * 12)) / 5
    		local bobble = Vector3.new(bobble_X,bobble_Y,0) * math.min(1, velocity.Magnitude / humanoid.WalkSpeed * 2)
            if Player.PlayerGui.Ammo.Enabled == false or mouse.Icon ~= "rbxassetid://" .. CustomCrosshairIcon then
    		humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble,.25)
            end
    	else
            if Player.PlayerGui.Ammo.Enabled == false or mouse.Icon ~= "rbxassetid://" .. CustomCrosshairIcon then
                humanoid.CameraOffset = humanoid.CameraOffset * 0.75
            end
    	end
    end
     
    -- Update the effect on every single frame.
    RunService.RenderStepped:Connect(updateBobbleEffect)
end)
--[[ WELCOME
    Welcomes the user. Standard stuff]]

local HarpmodLoaderGUI = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local HarpmodLabel1dot4 = Instance.new("ImageLabel")
local LoaderNote = Instance.new("TextLabel")

HarpmodLoaderGUI.IgnoreGuiInset = true
HarpmodLoaderGUI.Name = "HarpmodLoaderGUI"
HarpmodLoaderGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
HarpmodLoaderGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = HarpmodLoaderGUI
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 1.000
Background.Size = UDim2.new(1, 0, 1, 0)

HarpmodLabel1dot4.Name = "HarpmodLabel1dot4"
HarpmodLabel1dot4.Parent = Background
HarpmodLabel1dot4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HarpmodLabel1dot4.BackgroundTransparency = 1.000
HarpmodLabel1dot4.Position = UDim2.new(0.342365831, 0, 0.469508648, 0)
HarpmodLabel1dot4.Size = UDim2.new(0, 604, 0, 113)
HarpmodLabel1dot4.Image = "http://www.roblox.com/asset/?id=8840585658"
HarpmodLabel1dot4.ImageTransparency = 1.000

LoaderNote.Name = "LoaderNote"
LoaderNote.RichText = true
LoaderNote.Parent = Background
LoaderNote.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoaderNote.BackgroundTransparency = 1.000
LoaderNote.Position = UDim2.new(0.391349643, 0, 0.469444513, 0)
LoaderNote.Size = UDim2.new(0, 416, 0, 80)
LoaderNote.Font = Enum.Font.GothamSemibold
LoaderNote.Text = "<b>You shouldn't see this text!</b> Message romefalls#7154 or open an issue with the title 'I saw the text'."
LoaderNote.TextColor3 = Color3.fromRGB(255, 255, 255)
LoaderNote.TextSize = 23.000
LoaderNote.TextTransparency = 1.000

	local loadergui = HarpmodLoaderGUI
	local background = loadergui.Background
	local harpmodlabel = background.HarpmodLabel1dot4
	local LoaderNote = background.LoaderNote
	local blur = Instance.new("BlurEffect",game.Lighting)
	local startup = Instance.new("Sound",workspace)
	local switch = Instance.new("Sound",workspace)
	local errorsound = Instance.new("Sound",workspace)
	local gundraw = Instance.new("Sound",workspace)
	local glitching = Instance.new("Sound",workspace)
	blur.Size = 0
	errorsound.SoundId = "rbxassetid://8499261098"
	startup.SoundId = "rbxassetid://6963031429"
	switch.SoundId = "rbxassetid://4786831738"
	gundraw.SoundId = "rbxassetid://146740582"
	glitching.SoundId = "rbxassetid://6896112317"
		startup:Play()	
            if game:GetService("Players").LocalPlayer.PlayerData.Outfit.Value == "5900163546,6294416750,6312074205,4239780753.7103400905,5700137935,209995366" then
                game:GetService('ReplicatedStorage'):FindFirstChild('Events').MenuActionEvent:FireServer(8,{"Modi";tostring(5900163546,6294416750,6312074205,4239780753.7103400905,5700137935,209995366);true})
                YoLoaded:Play()
            end
		background.BackgroundTransparency = 1
		harpmodlabel.ImageTransparency = 1
		LoaderNote.TextTransparency = 1
		blur.Size = 0
		LoaderNote.TextColor3 = Color3.fromRGB(255,255,255)
		game:GetService("TweenService"):Create(blur, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 24}):Play()
		game:GetService("TweenService"):Create(background, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.3}):Play()
		game:GetService("TweenService"):Create(harpmodlabel, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
		wait(2)
		game:GetService("TweenService"):Create(harpmodlabel, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
		wait(0.5)
        if BetaVersion then
        glitching:Play()
		LoaderNote.Text = "<b>This is a development build of Harpmod.</b> \n Report all bugs directly to romefalls#7154."
        else if not BetaVersion and ver ~= CurrentVersion then
                LoaderNote.Text = "<b>This is an <font color="rgb(255,0,0)">outdated</font> build of Harpmod.</b> \n Join the support server to get a new version."
            end
        end
		game:GetService("TweenService"):Create(LoaderNote, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		wait(3)
		game:GetService("TweenService"):Create(LoaderNote, TweenInfo.new(0.25,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		wait(0.25)
		LoaderNote.Text = "MOTD: \n" .. MOTD
		gundraw:Play()
		game:GetService("TweenService"):Create(LoaderNote, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
		wait(2)
		game:GetService("TweenService"):Create(LoaderNote, TweenInfo.new(0.25,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		wait(0.25)
		game:GetService("TweenService"):Create(blur, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 0}):Play()
		game:GetService("TweenService"):Create(background, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
		game:GetService("TweenService"):Create(LoaderNote, TweenInfo.new(1,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	
--[[ COMMANDS
    Things that nobody should know :3]]
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
                        if Message == '/e custom' then
                            Note:Fire("custom","Added custom animations",1)
                            Player.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://6782867663"
                            Player.Character.Animate.idle.Animation2.AnimationId = "rbxassetid://6732653960"
                            game:GetService("ReplicatedStorage").Animations.Hover.AnimationId = "rbxassetid://6678793753"
                        end
                        if Message == '/e mod deagle' then
                            Note:Fire("mod deagle","Make sure to have your Deagle unequipped",5)
                            local GunToMod = "Deagle"
                            local NewGunName = "D-TYPE"
                            local AmmoType = "Pistol"
                            local MaxAmmo = 7
                            local FireRate = 0
                            local Spread = 0
                            local GunSound = 4
                            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                            modGunSound:Play()
                            Gun.LocalScript:Destroy()
                            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
                            Gun.Name = NewGunName
                            Gun.ToolTip = "Modified by Harpmod"
                            Note:Fire("Done!","Modding is done. Equip your Deagle now",5)
                        end
                        if Message == '/e mod mauser' then
                            Note:Fire("mod mauser","Make sure to have your Mauser unequipped",5)
                            -- Gun Settings
                            local GunToMod = "Mauser"
                            local NewGunName = "M-TYPE"
                            local AmmoType = "Pistol"
                            local MaxAmmo = 7
                            local FireRate = 0
                            local Spread = 0
                            local GunSound = 16
                            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                            modGunSound:Play()
                            Gun.LocalScript:Destroy()
                            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,18,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
                            Gun.Name = NewGunName
                            Gun.ToolTip = "Modified by Harpmod"
                            Note:Fire("Done!","Modding is done. Equip your Mauser now",5)
                        end
                        if Message == '/e mod lever' then
                            Note:Fire("mod lever","Make sure to have your Lever unequipped",5)
                            local GunToMod = "Lever Action"
                            local NewGunName = "LA-TYPE"
                            local AmmoType = "Rifle"
                            local MaxAmmo = 5
                            local FireRate = 0
                            local Spread = 0
                            local AutoFire = false -- do not change this
                            local GunSound = 4
                            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                            modGunSound:Play()
                            Gun.LocalScript:Destroy()
                            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,58,Spread,GunSound,1,nil,AmmoType .. " Ammo",1,2,2)
                            Gun.Name = NewGunName
                            Gun.ToolTip = "Modified by Harpmod"
                            Note:Fire("Done!","Modding is done. Equip your Lever now",5)
                        end
                    end)
 game.Players.LocalPlayer.Chatted:Connect(function(Message)
                        if Message == '/e mod vermin' then
                            Note:Fire("mod vermin","Make sure to have your Vermin unequipped",5)
                            local GunToMod = "Vermin Rifle"
                            local NewGunName = "VR-TYPE"
                            local AmmoType = "Rifle"
                            local MaxAmmo = 5
                            local FireRate = 0
                            local Spread = 0
                            local AutoFire = false -- do not change this
                            local GunSound = 4
                            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                            modGunSound:Play()
                            Gun.LocalScript:Destroy()
                            require(game:GetService("ReplicatedStorage").Modules.TS[(AutoFire and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,58,Spread,GunSound,1,nil,AmmoType .. " Ammo",1,2,2)
                            Gun.Name = NewGunName
                            Gun.ToolTip = "Modified by Harpmod"
                            Note:Fire("Done!","Modding is done. Equip your Vermin now",5)
                        end
                        if Message == '/e rj' then
                            TeleportSound:Play()
                            Note:Fire("Rejoining","Please wait",2)
                            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
                        end
                        if Message == '/e rejoin' then
                            TeleportSound:Play()
                            Note:Fire("Rejoining","Please wait",2)
                            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Player)
                        end
                        if Message == '/e cmds' then
                            Note:Fire("List of Commands","",1)
                            Note:Fire("Filler","You probably shouldn't be able to see this",7)
                            Note:Fire("<b>cmds</b> or commands","Shows you all current commands",5)
                            Note:Fire("rj or rejoin","Rejoins the game for you",1)
                            Note:Fire("fixreloadsound or fixrs","Stops reload sound in case of a jam",1)
                            Note:Fire("testnotes","Tests all notes, useful for custom sounds",1)
                            Note:Fire("help","Shows you ways to get technical support",1)
                            Note:Fire("maxhunger","Gives you maximum hunger",1)
                            Note:Fire("invisjet","Gives you an invisible Static Jetpack",1)
                            Note:Fire("autobuy","Buys ammo for you when it gets low",1)
                            Note:Fire("mod info","List of moddable guns",1)
                            Note:Fire("graphics","Graphics overhaul",1)
                        end
                    end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
                            if Message == '/e commands' then
                                Note:Fire("List of Commands","",1)
                                Note:Fire("Filler","You probably shouldn't be able to see this",7)
                                Note:Fire("cmds or <b>commands</b>","Shows you all current commands",5)
                                Note:Fire("rj or rejoin","Rejoins the game for you",1)
                                Note:Fire("fixreloadsound or fixrs","Stops reload sound in case of a jam",1)
                                Note:Fire("testnotes","Tests all notes, useful for custom sounds",1)
                                Note:Fire("help","Shows you ways to get technical support",1)
                                Note:Fire("maxhunger","Gives you maximum hunger",1)
                                Note:Fire("invisjet","Gives you an invisible Static Jetpack",1)
                                Note:Fire("autobuy","Buys ammo for you when it gets low",1)
                                Note:Fire("mod info","List of moddable guns",1)
                                Note:Fire("graphics","Graphics overhaul",1)
                            end
                            if Message == '/e fixrs' then
                                if ReloadSound.Playing == true then
                                ReloadSound:Stop()
                                AmmoAmount.Text = "Re-equip gun"
                                Note:Fire("fixrs","Fixed reload sound",1)
                                else Note:Fire("The reload sound isn't playing","Dumbass",4)
                                end
                            end
                            if Message == '/e fixreloadsound' then
                                if ReloadSound.Playing == true then
                                    ReloadSound:Stop()
                                    AmmoAmount.Text = "Re-equip gun"
                                    Note:Fire("fixreloadsound","Fixed reload sound",1)
                                    else Note:Fire("The reload sound isn't playing","Dumbass",4)
                                end
                            end
                            if Message == '/e help' then
                                Note:Fire("help","Ask any support questions to <b>romefalls#7154</b>",5)
                                Note:Fire("BE READY TO:","Show console [F9], and be questioned often",1)
                            end
                        end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
                            if Message == '/e maxhunger' then
                                if Player.PlayerData.Hunger.Value < 100 then
                                Note:Fire("maxhunger","Gave maximum possible hunger",6)
                                while wait(.3) do
                                Player.PlayerData.Hunger.Value = 100
                                end
                                else Note:Fire("Error","You already have max hunger!",4)
                                end
                            end
                            if Message == '/e testnotes' then
                                Note:Fire("Note 1","Lorem ipsum dolor sit amet",1)
                                wait(1)
                                Note:Fire("Note 2","Lorem ipsum dolor sit amet",2)
                                wait(1)
                                Note:Fire("Note 3","Lorem ipsum dolor sit amet",3)
                                wait(1)
                                Note:Fire("Error","Lorem ipsum dolor sit amet",4)
                                wait(1)
                                Note:Fire("Equip","Lorem ipsum dolor sit amet",5)
                                wait(1)
                                Note:Fire("Purchase","Lorem ipsum dolor sit amet",6)
                            end
                            if Message == '/e invisjet' then
                                    if jet.Parent == Player.Character.Util then
                                    Note:Fire("Error","You already have a jetpack!",4)
                                    else
                                    jet.Parent = Player.Character:WaitForChild("Util")
                                    Note:Fire("invisjet","Invisjet has succesfully been spawned",6)
                                    end
                            end
                            if Message == '/e autobuy' then
                                if CurrentlyAutoBuying == true then
                                Note:Fire("Error","You already have Autobuy on!",4)
                                else
                                    CurrentlyAutoBuying = true
                                    Note:Fire("autobuy","Autobuying ammo when it gets low",6)
                                    while wait(1) do
                                        if Player.PlayerData["Rifle Ammo"].Value <= 30 then
                                            Note:Fire("Autobuy","Rifle ammo is getting low, rebuying!",6)
                                            wait(1)
                                            game:GetService("ReplicatedStorage").Events.MenuEvent:FireServer(2, "Rifle Ammo (30x)", nil, 8)
                                            end
                                            if Player.PlayerData["Pistol Ammo"].Value <= 20 then
                                                Note:Fire("Autobuy","Pistol ammo is getting low, rebuying!",6)
                                                wait(1)
                                                game:GetService("ReplicatedStorage").Events.MenuEvent:FireServer(2, "Pistol Ammo (30x)", nil, 8)
                                                end
                                                if Player.PlayerData["Heavy Ammo"].Value <= 10 then
                                                    Note:Fire("Autobuy","Heavy ammo is getting low, rebuying!",6)
                                                    wait(1)
                                                    game:GetService("ReplicatedStorage").Events.MenuEvent:FireServer(2, "Heavy Ammo (10x)", nil, 8)
                                                    end
                                                    if Player.PlayerData["SMG Ammo"].Value <= 30 then
                                                        Note:Fire("Autobuy","SMG ammo is getting low, rebuying!",6)
                                                        wait(1)
                                                        game:GetService("ReplicatedStorage").Events.MenuEvent:FireServer(2, "SMG Ammo (60x)", nil, 8)
                                                        end
                                            end
                                end
                            end
                        end)
                        game.Players.LocalPlayer.Chatted:Connect(function(Message)
                            if Message == '/e graphics' then
                                Note:Fire("graphics","Please wait",5)
                                GraphicsSound:Play()
                                local GraphicsBlur = Instance.new("BlurEffect",game.Lighting)
                                game:GetService("TweenService"):Create(GraphicsBlur, TweenInfo.new(0.5,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 24}):Play()
                                wait(1)
                                GraphicsEnabled = true
                            if game.Lighting.Condition.Value == "Night" then
                                game.Lighting.FogEnd = "10000"
                                game.Lighting.FogStart = "1000"
                                game.Lighting.ColorCorrection.Contrast = 0.1
                                end
                                if game.Lighting.Condition.Value == "Day" then
                                    game.Lighting.FogEnd = "10000"
                                    game.Lighting.FogStart = "1000"
                                    game.Lighting.ExposureCompensation = 0
                                    game.Lighting.ColorCorrection.Contrast = 0
                                    game.Lighting.ColorCorrection.Saturation = 0.5
                                    game.Lighting.FogColor = Color3.fromRGB(255,255,255)
                                    game.Lighting.Ambient = Color3.fromRGB(25,25,25)
                                    game.Lighting.OutdoorAmbient = Color3.fromRGB(125,125,125)
                                end
                                    for i = 1, 24 do
                                        game:GetService("TweenService"):Create(GraphicsBlur, TweenInfo.new(2,Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = 0}):Play()
                                    while GraphicsEnabled do
                                        wait()
                                        if game.Lighting.Condition.Value == "Night" then
                                        game.Lighting.FogEnd = "10000"
                                        game.Lighting.FogStart = "1000"
                                        game.Lighting.ColorCorrection.Contrast = 0.1
                                        end
                                        if game.Lighting.Condition.Value == "Day" then
                                            game.Lighting.FogEnd = "10000"
                                            game.Lighting.FogStart = "1000"
                                            game.Lighting.ColorCorrection.Contrast = 0
                                            game.Lighting.ColorCorrection.Saturation = 0.5
                                            game.Lighting.FogColor = Color3.fromRGB(255,255,255)
                                            game.Lighting.Ambient = Color3.fromRGB(25,25,25)
                                            game.Lighting.OutdoorAmbient = Color3.fromRGB(125,125,125)
                                    end
                                end
                            end
                            if Message == '/e autoreload' then
                                if IsAutoReloadOn == true then
                                    Note:Fire("Error","Autoreload is already on!",4)
                                    else 
                                    IsAutoReloadOn = true
                                    Note:Fire("%autoreload","Harpmod is now compatible with Piano Client's Autoreload",6)
                                    Note:Fire("NOTE","To use Autoreload, turn on Piano Client by typing <b>%piano</b>",6)
                                    end
                                end
                            end
                        end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
        if Message == '/e mod tommy' then
            Note:Fire("mod tommy","Make sure to have your Tommy unequipped",5)
            local GunToMod = "Tommy Gun"
            local NewGunName = "Typewriter"
            local AmmoType = "SMG"
            local MaxAmmo = 30
            local FireRate = 0
            local Spread = 0
            local GunSound = 4
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,25,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your Tommy now",5)
        end
        if Message == '/e mod m1911' then
            Note:Fire("mod m1911","Make sure to have your M1911 unequipped",5)
            local GunToMod = "M1911"
            local NewGunName = "Z1911"
            local AmmoType = "Pistol"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 2
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,18,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your M1911 now",5)
        end
        if Message == '/e mod snubnose' then
            Note:Fire("mod snubnose","Make sure to have your Snubnose unequipped",5)
            local GunToMod = "Snubnose"
            local NewGunName = "Golden Retriever"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 7
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your Snubnose now",5)
        end
        if Message == '/e mod bizon' then
            Note:Fire("mod bizon","Make sure to have your Bizon unequipped",5)
            local GunToMod = "Bizon"
            local NewGunName = "Riot-30"
            local AmmoType = "SMG"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 7
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,18,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your Bizon now",5)
        end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
        if Message == '/e mod ar47' then
            Note:Fire("mod ar47","Make sure to have your AR47 unequipped",5)
            local GunToMod = "AR47"
            local NewGunName = "AR-4700"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 7
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,26,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your AR47 now",5)
            end
        if Message == '/e mod 45' then
            Note:Fire("mod 45","Make sure to have your 45 unequipped",5)
            local GunToMod = ".45 Revolver"
            local NewGunName = "Big Iron"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 7
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your 45 now",5)
            end
        if Message == '/e mod info' then --MOD INFO ADD HERE ONCE GUNS ARE ADDED
            Note:Fire("List of Moddable Guns","Not all guns are moddable.. yet.",1)
            Note:Fire("AR47","/e mod ar47 | Turns into AR-4700",1)
            Note:Fire("Bizon","/e mod bizon | Turns into Riot-30",1)
            Note:Fire("Snubnose","/e mod snubnose | Turns into Golden Retriever",1)
            Note:Fire(".45 Revolver","/e mod 45 | Turns into Big Iron",1)
            Note:Fire("M1911","/e mod m1911 | Turns into Z1911",1)
            Note:Fire("Tommy Gun","/e mod tommy | Turns into Typewriter",1)
            Note:Fire("Vermin Rifle","/e mod vermin | Turns into VR-TYPE",1)
            Note:Fire("Deagle","/e mod deagle | Turns into D-TYPE",1)
            Note:Fire("Mauser","/e mod mauser | Turns into M-TYPE",1)
            Note:Fire("Lever Action","/e mod lever | Turns into LR-TYPE",1)
            Note:Fire("Revolver","/e mod revolver | Turns into Schofield Revolver",1)
            Note:Fire("M16","/e mod m16 | Turns into Z16",1)
            Note:Fire("Garand","/e mod garand | Turns into M4 Garand",1)
            Note:Fire("Tec-9","/e mod tec | Turns into Dylan's Acquaintance",1)
            Note:Fire("USP","/e mod usp | Turns into XM9",1)
            Note:Fire("AK","/e mod ak | Turns into DN",1)
        end
        if Message == '/e piano' then
            Note:Fire("Piano is nuked","Thank GFX the FLIPer for doing so",4)
        end
    end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
        if Message == "/e mod revolver" then
            Note:Fire("mod revolver","Make sure to have your revolver unequipped",5)
            local GunToMod = "Revolver"
            local NewGunName = "Schofield Revolver"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 7
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your 45 now",5)
            end
        if Message == "/e mod garand" then
            Note:Fire("mod garand","Make sure to have your Garand unequipped",5)
            local GunToMod = "Garand"
            local NewGunName = "M4 Garand"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 19
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your M4 Garand now",5)
            end
        if Message == "/e mod m16" then
            Note:Fire("mod m16","Make sure to have your M16 unequipped",5)
            local GunToMod = "M16"
            local NewGunName = "Z16"
            local AmmoType = "Rifle"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 19
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod" 
            Note:Fire("Done!","Modding is done. Equip your Z16 now",5)
            end
                end)
    game.Players.LocalPlayer.Chatted:Connect(function(Message)
        if Message == '/e mod tec' then
            Note:Fire("mod tec","Make sure to have your Tec unequipped",5)
            local GunToMod = "Tec9"
            local NewGunName = "Dylan's Acquaintance"
            local AmmoType = "SMG"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 12
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            PumpedUp:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip Dylan's Acquaintance now",5)
        end
        if Message == '/e modi' then        
            YoLoaded:Play()
            GraphicsSound:Play()
            game:GetService('ReplicatedStorage'):FindFirstChild('Events').MenuActionEvent:FireServer(8,{"Modi";"5900163546,6294416750,6312074205,4239780753.7103400905,5700137935,209995366";true})
            wait(0.5)
            game:GetService('ReplicatedStorage'):FindFirstChild('Events').MenuActionEvent:FireServer(8,{"Modi";"Modi";false})
            while GraphicsSound.Playing do 
                wait()
            game.Lighting.ExposureCompensation = GraphicsSound.PlaybackLoudness / 4
            end
            end
        if Message == '/e 2j0y' then
                    game:GetService('ReplicatedStorage'):FindFirstChild('Events').MenuActionEvent:FireServer(8,{"2J0Y";"2309346267.6556551859,5319548498,5319515645,4820120408,4904499785.6368111159,5607662052.6556064120,5505948526,5164642101,5418629879.6556163479";true})
                    task.wait(5)
                    Note:Fire("In-game Moderator Found!!!","Moderator 2J0Y has joined your game!",4)
                    task.wait(1)
                    lsound:Play()
                    Player.Character.Humanoid:TakeDamage(100)
                    task.wait(0.7)
                    Player:Kick("You have been kicked from the game")
                    end
        if Message == '/e mod usp' then
            Note:Fire("mod usp","Make sure to have your USP unequipped",5)
            local GunToMod = "USP"
            local NewGunName = "XM9"
            local AmmoType = "Pistol"
            local MaxAmmo = 8
            local FireRate = 0
            local Spread = 0
            local AutoFire = false -- do not change this
            local GunSound = 18
            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
            modGunSound:Play()
            Gun.LocalScript:Destroy()
            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,26,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
            Gun.Name = NewGunName
            Gun.ToolTip = "Modified by Harpmod"
            Note:Fire("Done!","Modding is done. Equip your XM9 now",5)
        end
        end)
        game.Players.LocalPlayer.Chatted:Connect(function(Message)
            if Message == '/e mod ak' then
                Note:Fire("mod ak","Make sure to have your AK unequipped",5)
                Note:Fire("Use an Autoclicker","Your AK will turn into semi-automatic",4)
                local GunToMod = "AK"
                local NewGunName = "DN"
                local AmmoType = "Rifle"
                local MaxAmmo = 8
                local FireRate = 0
                local Spread = 0
                local AutoFire = false -- do not change this
                local GunSound = 7
                local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                modGunSound:Play()
                Gun.LocalScript:Destroy()
                require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,26,Spread,GunSound,1,nil,AmmoType .. " Ammo",1,2,2)
                Gun.Name = NewGunName
                Gun.ToolTip = "Modified by Harpmod"
                Note:Fire("Done!","Modding is done. Equip your DN now",5)
            end
        end)
--[[   game.Players.SouthModeI.Chatted:Connect(function(Message)
    if Message == '/e sd' then
    DistressSignal:Play()
    DistressSignal2:Play()
    Note:Fire("DISTRESS SIGNAL FOUND","Go to host area!",4)
    Note:Fire("DISTRESS SIGNAL FOUND","Go to host area!",4)
    Note:Fire("DISTRESS SIGNAL FOUND","Go to host area!",4)
    wait(5)
    DistressSignal:Stop()
    end
end)]]
    if pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/romefalls/harpmod/main/LatestVersion.lua'))() end) then
		if CurrentVersion ~= ver and WarnedVersion == false then
		    WarnedVersion = true
            if BetaVersion == true then
			warn("----HARPMOD----")
            warn("Beta Version Variable is true!!!")
            warn("Version: " .. CurrentVersion)
            warn("REPORT BUGS: romefalls#7154")
            warn("---------------")
            end
		end
	end
--[[ THE LOOP
    Da loop :3 place all necessary loops here.]]
    game:GetService("RunService").RenderStepped:Connect(function()
        if AmmoAmount.Text == "5/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "5/"..PlayerData["Rifle Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(234, 125, 125)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen5RoundsAreRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else if AmmoAmount.Text == "4/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "4/"..PlayerData["Rifle Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(234, 100, 100)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen4RoundsAreRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else if AmmoAmount.Text == "3/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "3/"..PlayerData["Pistol Ammo"].Value or AmmoAmount.Text == "3/"..PlayerData["Rifle Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(234, 75, 75)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen3RoundsAreRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else if AmmoAmount.Text == "2/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "2/"..PlayerData["Pistol Ammo"].Value or AmmoAmount.Text == "2/"..PlayerData["Rifle Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(234, 50, 50)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen2RoundsAreRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else if AmmoAmount.Text == "1/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "1/"..PlayerData["Pistol Ammo"].Value or AmmoAmount.Text == "1/"..PlayerData["Rifle Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(234, 25, 25)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen1RoundIsRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else if AmmoAmount.Text == "0/"..PlayerData["SMG Ammo"].Value or AmmoAmount.Text == "0/"..PlayerData["Pistol Ammo"].Value or AmmoAmount.Text == "0/"..PlayerData["Rifle Ammo"].Value or AmmoAmount.Text == "0/"..PlayerData["Heavy Ammo"].Value then
            AmmoAmount.TextColor3 = Color3.fromRGB(255, 0, 0)
            if IsAutoReloadOn == false then
                AmmoType.TextSize = 16
            end
            if IsAutoReloadOn == true then
                AmmoAmount.TextColor3 = Color3.fromRGB(255,55,55)
                wait()
                AmmoAmount.TextColor3 = Color3.fromRGB(255,0,0)
                wait()
                AmmoType.Visible = false
            end
            ReloadSound.PlaybackSpeed = ReloadPitchWhen0RoundsAreRemaining
            if ReloadSound.Playing == false then
            ReloadSound:Play()
            end
        else AmmoAmount.TextColor3 = Color3.fromRGB(234, 244, 244)
            AmmoType.TextSize = 0
            ReloadSound:Stop()
            end
            end
            end
            end
            end
            end
            if Player.PlayerGui.Ammo.Enabled == false then
                ReloadSound:Stop()
            end
        
        

            if Player.PlayerGui.Ammo.Enabled == true or beam.Enabled == true then
            mouse.Icon = "rbxassetid://" .. CustomCrosshairIcon
            end
            if beam.Enabled == false and Player.PlayerGui.Ammo.Enabled == false then
                mouse.Icon = "rbxassetid://" .. CustomCursorIcon
            end
            if Player.PlayerData.Hunger.Value < 15 then
                Sidebar.Hunger.Frame.Frame.ImageColor3 = Color3.fromRGB(255,55,55)
            end
            if Player.PlayerData.Hunger.Value > 80 then
                    Sidebar.Hunger.Frame.Frame.ImageColor3 = Color3.fromRGB(55,55,255)
            end
            if Player.PlayerData.Hunger.Value > 15 and Player.PlayerData.Hunger.Value < 80 then
            Sidebar.Hunger.Frame.Frame.ImageColor3 = Color3.fromRGB(55,55,55)
            end
        if IsAutoReloadOn == false then
                AmmoType.TextColor3 = Color3.fromRGB(255, 0, 0)
                AmmoType.Text = "RELOAD"
                wait()
                AmmoType.TextColor3 = Color3.fromRGB(255, 100, 100)
            end 

    if Player.Character:FindFirstChild("NameTag") then
        if Player.Character.NameTag.TextLabel.TextColor3 == Color3.fromRGB(255,187,69) then --YELLOW
            if Player.Character.Animate.idle.Animation1.AnimationId == "rbxassetid://6782867663" then
                Player.Character.Animate.idle.Animation1.AnimationId= "rbxassetid://2950333881"
            end
            if YellowNameMusic.Playing == false then
                YellowNameMusic:Play()
                YellowNameMusic.Volume = 0
                if YellowNameMusic.TimePosition < YellowNameTimePosition  then
                    YellowNameMusic.TimePosition = YellowNameTimePosition
                end
                for i = 1, 10 do
                    YellowNameMusic.Volume = YellowNameMusic.Volume + 0.1
                    wait()
                end
                end
            YellowNameMusic.Volume = YellowNameVolume
            if RedNameMusic.Playing == true then
                for i = 1, 20 do
                    RedNameMusic.Volume = RedNameMusic.Volume / 1.25
                    wait()
                    end
                end
            end
        if Player.Character.NameTag.TextLabel.TextColor3 == Color3.fromRGB(255,33,33) then --RED
            Player.PlayerData.Hunger.Value = 100
            if RedNameMusic.Playing == false then
                RedNameMusic:Play()
                RedNameMusic.Volume = RedNameVolume
            end
            if RedNameMusic.TimePosition < RedNameTimePosition  then
                RedNameMusic.TimePosition = RedNameTimePosition
            end
            if YellowNameMusic.Playing == true then
                for i = 1, 10 do
                YellowNameMusic.Volume = YellowNameMusic.Volume / 2
                wait()
                end
                YellowNameMusic:Stop()
            end
            end
        if Player.Character.NameTag.TextLabel.TextColor3 == Color3.fromRGB(255,255,255) then --WHITE
            if Player.Character.Animate.idle.Animation1.AnimationId == "rbxassetid://2950333881" then
                Player.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://6782867663"
            end
            if YellowNameMusic.Playing == true then
                for i = 1, 20 do
                    YellowNameMusic.Volume = YellowNameMusic.Volume / 1.15
                    wait()
                end
                YellowNameMusic:Stop()
            end
            if RedNameMusic.Playing == true then
                for i = 1, 20 do
                    RedNameMusic.Volume = RedNameMusic.Volume / 1.15
                    wait()
                end
                RedNameMusic:Stop()
            end
            end
            else YellowNameMusic:Stop()
                RedNameMusic:Stop()
            end
    if MusicActivated == false then
        RedNameMusic.SoundId = "rbxassetid://0"
        YellowNameMusic.SoundId = "rbxassetid://0"
        ReloadSound.SoundId = "rbxassetid://0"
        end
    if MusicActivated ==  true then
        RedNameMusic.SoundId = "rbxassetid://" .. RedNameMusicId
        YellowNameMusic.SoundId = "rbxassetid://" .. YellowNameMusicId
        ReloadSound.SoundId = "rbxassetid://" .. ReloadSoundId
        end
    if FinishClampSound.Playing == true then
            if GraphicsSound.Playing ~= true then
            game.Lighting.ExposureCompensation = FinishClampSound.PlaybackLoudness * 0.005
        else game.Lighting.ExposureCompensation = 0
        end
        end
    if BeamAct.Playing == true then
        GrappleCC.Contrast = BeamAct.PlaybackLoudness * 0.001
        else GrappleCC.Contrast = 0
        end
    if NilTargetSound.Playing then
        GrappleCC.Saturation = -0.9 + NilTargetSound.TimePosition * 1.5
        else GrappleCC.Saturation = 0
        end
    if waawaa == true then
        if GlitchVoice.Playing == false then
            GlitchVoice:Play()
        end
        GlitchVoice.PlaybackSpeed = game:GetService("Players").LocalPlayer.PlayerGui.Client.SFX.FlagWinds.PlaybackSpeed
        GlitchVoice.Volume = game:GetService("Players").LocalPlayer.PlayerGui.Client.SFX.FlagWinds.Volume * 2
        end
    Player.PlayerGui.Client.ver.Text = ("TICK:" ..os.time() .." Harpmod V" .. CurrentVersion)
end)
    getgenv().HarpmodRunning = true
    while wait(0.5) do
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,120,120)
        Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,4,4)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("! Low Karma !")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,100,100)
        Player.PlayerGui.Client.Killzone.Text = "[ KILLZONE NODE !]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,75,75)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("!! Low Karma !!")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,80,80)
        Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,4,4)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("! Low Karma !")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,60,60)
        Player.PlayerGui.Client.Killzone.Text = "[ KILLZONE NODE !]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,75,75)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("!! Low Karma !!")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,40,40)
        Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,4,4)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("! Low Karma !")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,20,20)
        Player.PlayerGui.Client.Killzone.Text = "[ KILLZONE NODE !]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,75,75)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("!! Low Karma !!")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,40,40)
        Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,4,4)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("! Low Karma !")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,60,60)
        Player.PlayerGui.Client.Killzone.Text = "[ KILLZONE NODE !]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,75,75)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("!! Low Karma !!")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,80,80)
        Player.PlayerGui.Client.Killzone.Text = "[! KILLZONE NODE ]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,4,4)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("! Low Karma !")
        wait(0.5)
        Player.PlayerGui.Client.Killzone.TextColor3 = Color3.fromRGB(255,100,100)
        Player.PlayerGui.Client.Killzone.Text = "[ KILLZONE NODE !]"
        Player.PlayerGui.Ammo.Frame.warn.TextColor3 = Color3.fromRGB(255,75,75)
        Player.PlayerGui.Ammo.Frame.warn.Text = ("!! Low Karma !!")
        local outfitstring = math.random(1,#outfittext)
        local pickedoutfitstring = outfittext[outfitstring]
        game.Players.LocalPlayer.PlayerGui.Client.Outfit.Desc.Text = pickedoutfitstring
        end

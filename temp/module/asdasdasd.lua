

for _,v in next,workspace.Regions.Winterville.Tiles:GetChildren() do
local args = {
	"Shovel",
	game:GetService("Players").LocalPlayer.Character["Push Blower"],
	{
        v
	}
}
game:GetService("ReplicatedStorage").Modules.Network.RemoteEvent:FireServer(unpack(args))
task.wait()
end 
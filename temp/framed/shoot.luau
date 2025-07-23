-- Generated with Sigma Spy Github: https://github.com/depthso/Sigma-Spy
-- Remote
local Shoot = workspace.Events.Shoot -- RemoteEvent 

Shoot:FireServer(
    {
        IsBackstab = false,
        Aiming = false,
        Bullets = {
            {
                Ray = Ray.new(Vector3.new(-20, 376, 270), Vector3.new(364, 9, -343)),
                Position = Vector3.new(68, 378, 186),
                Instance = Part,
                CFrame = CFrame.new(81, 368, 167, -1, 0, -0, 0, 1, 0, 0, 0, -1),
                Normal = Vector3.new(-1, 0, 0)
            }
        },
        LookDir = CFrame.new(-20, 376, 270, 1, -0, -1, -0, 1, -0, 1, 0, 1),
        Tool = Luger,
        Timestamp = workspace:GetServerTimeNow()
    }
)

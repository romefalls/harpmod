local global_font = Font.fromId(12187367901,Enum.FontWeight.SemiBold)

local color = {
    background = Color3.fromRGB(23,23,23),

}
local set_font = function(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
        v.FontFace = global_font
    end
end
local gui = game:GetService("Players").LocalPlayer.PlayerGui

for _,v in gui.Client:GetDescendants() do 
    set_font(v)
end

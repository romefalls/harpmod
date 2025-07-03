

local note = game.ReplicatedStorage.Events.Note

local ammo_type = {
    heavy = "Heavy Ammo",
    pistol = "Pistol Ammo",
    rifle = "Rifle Ammo",
    smg = "SMG Ammo",
}

local gun = {
    heavy = {
        "Laser Musket",
        -- .. i think thats it
    },
    pistol = {
        "Deagle",
        "M1911",
        "Mauser",
        "USP",
        -- ...
    },
    rifle = {
        "M4",
        "M16",
        "AK",
        "Schofield Revolver",
        "Garand",
        "Vermin Rifle",
        "Snubnose", 
        ".45 Revolver",
        -- ...
    },
    smg = {
        "Tec9",
        "Bizon",
        "Tommy Gun",
        -- ...
    }
}

function get_ammo_type(gun_name)
    for ammo_category, gun_list in pairs(gun) do
        for _, name in ipairs(gun_list) do
            if name == gun_name then
                return ammo_type[ammo_category]
            end
        end
    end
    return nil 
end


local modded_gun = { --[[
i made this table because i thought it mattered
i dont think it does because most of it is just serversided
but ill keep it here because i worked way too long on it
and also because it just looks dope
]]
    -- pistols

    Deagle = {
        new_gun_name      = "DX177",
        sound             = 9,
    },
    USP = {
        new_gun_name      = "XM9",
        sound             = 18,
    },

    -- smgs

    Tec9 = {
        new_gun_name = "Dylan's Acquaintance",
        sound = 12,
    },

    -- rifles 

    Garand = {
        new_gun_name = "M4 Garand",
        damage = 35, -- idfk
        sound = 19
    },
    AK = {
        new_gun_name = "AN-94",
        sound = 19
    }
}

for gun_name, data in pairs(modded_gun) do
    data.ammo_type = get_ammo_type(gun_name)
end


function modify_gun(old_gun,new_gun_name,ammo_type,max_ammo,damage,gun_sound)
    note:Fire("mod " .. old_gun, "Make sure to have your " .. old_gun .." unequipped",5)
    local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(old_gun)
    Gun.LocalScript:Destroy()
    require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,max_ammo,0,damage,0,gun_sound,4,nil,ammo_type .. " Ammo",1,2,2)
    Gun.Name = new_gun_name
    note:Fire("Done!","Modding is done. Equip your " .. new_gun_name .. " now",5)
end

-- example


game:GetService("RunService").RenderStepped:Connect(function(dt)

end)
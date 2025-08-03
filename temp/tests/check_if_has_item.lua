local check_for = "Remington"

for _,v in next,game.Players:GetPlayers() do
    if string.find(v.PlayerData.Inventory.Value,check_for) then
        print(v, " has a ", check_for)
    end
end
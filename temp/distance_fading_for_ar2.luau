local fileName = "ar2_unanchored_parts_" .. math.random(1, 2147483647) .. ".txt"
writefile(fileName, "list of ar2 unanchored parts\n")

local success, count = pcall(function()
	local total = 0
	for _, v in workspace:GetDescendants() do
		if v:IsA("BasePart") and not v.Anchored then
			v.Anchored = true
			appendfile(fileName, v:GetFullName() .. "\n")
			total += 1
		end
	end
	return total
end)

if success then
	appendfile(fileName, "\ntotal unanchored parts: " .. count .. "\n")
else
	-- hush... logservice is bugged! they read it!
end

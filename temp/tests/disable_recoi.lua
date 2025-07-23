for _, obj in pairs(getgc(true)) do
    if typeof(obj) == "table" and rawget(obj, "Shake") then
        obj.Shake = function() end
    end
end
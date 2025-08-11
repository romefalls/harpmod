local turboFunc = filtergc("function", {
    Constants = {
        400,
        "Turbo1",
        "Turbo2",
        "ParticleEmitter",
        "BodyForce",
        0.9,
        0.65,
        35
    }
}, true)

if type(turboFunc) == "table" then
    turboFunc = turboFunc[1]
end

-- Now you can use turboFunc with setconstant
print(getconstants(turboFunc)) -- See the constants and their indices

-- For example, patch the first 400 to 0
setconstant(turboFunc, 1, 0)
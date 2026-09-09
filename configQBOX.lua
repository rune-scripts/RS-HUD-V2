-- [ MADE BY RUNE SCRIPTS | V1.1.5] [ beta website : https://rune-scripts.pages.dev/ ]
-- INFO : With the default config the script runs at 0.00ms and ~0.50% of CPU TIME | Tested on : Ryzen 7 5700X


Config = {}

Config.Colors = {
    Primary = '#00FF8C', -- Used as top right accent, in the gradient of the minimap border and for the speedometer 
    Secondary = '#FFFFFFbb' -- Used in the gradient of the minimap border and for the speedometer 
}

Config.Values = { -- Available values : gametime, streetname, zonename, serverid
    TopLeft = 'serverid',
    TopRight = 'zonename'
}

Config.Bars = {
    {name = 'health', color = '#ff3859', source = function(ped) return (GetEntityHealth(ped) * 100) / 200 end},
    {name = 'armor', color = '#00ff88', source = function(ped) return GetPedArmour(ped) end},
}


-- Test version of the qbox config, I do not garanty this will work
local QBOX = exports['qbx_core']

local statusCache = {
    hunger = 100,
    thirst = 100
}

CreateThread(function()
    local playerData = QBOX:GetPlayerData()
    while not playerData or not playerData.metadata do
        Wait(500)
        playerData = QBOX:GetPlayerData()
    end

    if playerData.metadata.hunger then statusCache.hunger = playerData.metadata.hunger end
    if playerData.metadata.thirst then statusCache.thirst = playerData.metadata.thirst end
end)

RegisterNetEvent('qbx_core:playerDataChanged', function(playerData)
    if playerData.metadata then
        if playerData.metadata.hunger then statusCache.hunger = playerData.metadata.hunger end
        if playerData.metadata.thirst then statusCache.thirst = playerData.metadata.thirst end
    end
end)

local qboxBars = {
    {name = 'hunger', color = '#ff8138', source = function(ped) return statusCache.hunger end},
    {name = 'thirst', color = '#339dff', source = function(ped) return statusCache.thirst end},
}

for _, bar in ipairs(qboxBars) do
    table.insert(Config.Bars, bar)
end

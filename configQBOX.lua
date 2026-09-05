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

-- Adaptation QBox (qbx_core)
local QBX = exports['qbx_core']

local statusCache = { 
    hunger = 100,
    thirst = 100
}

local function updateStatus(metadata)
    if not metadata then return end
    if metadata.hunger then statusCache.hunger = metadata.hunger end
    if metadata.thirst then statusCache.thirst = metadata.thirst end
end

-- Synchronisation initiale et événement de mise à jour QBox
CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do
        Wait(500)
    end
    local playerData = QBX:GetPlayerData()
    if playerData and playerData.metadata then
        updateStatus(playerData.metadata)
    end
end)

RegisterNetEvent('qbx_core:client:playerLoaded', function()
    local playerData = QBX:GetPlayerData()
    if playerData and playerData.metadata then
        updateStatus(playerData.metadata)
    end
end)

RegisterNetEvent('qbx_core:client:onMetaDataUpdate', function(meta, value)
    if meta == 'hunger' then statusCache.hunger = value end
    if meta == 'thirst' then statusCache.thirst = value end
end)

local qbxBars = {
    {name = 'hunger', color = '#ff8138', source = function(ped) return statusCache.hunger end},
    {name = 'thirst', color = '#339dff', source = function(ped) return statusCache.thirst end},
}

for _, bar in ipairs(qbxBars) do
    table.insert(Config.Bars, bar)
end

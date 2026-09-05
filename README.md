# RS-HUD-V2

### Ingame Preview

<img width="1920" height="1080" alt="Capture d&#39;écran 2026-09-05 182147" src="https://github.com/user-attachments/assets/c665298e-5309-43a8-92a8-26677916823d" />
<img width="1920" height="1080" alt="Capture d&#39;écran 2026-09-05 182230" src="https://github.com/user-attachments/assets/e0b82a19-73b2-43cc-a8b0-cc757dc674a6" />


### Config.lua

```lua

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



-- for ESX this is the most optimized way i found it only updates when player eats or drink (when esx:setPlayerData is called)
local ESX = exports['es_extended']:getSharedObject()

local statusCache = { 
    hunger = 100,
    thirst = 100
}

CreateThread(function()
    while ESX.GetPlayerData().metadata == nil do
        Wait(500)
    end
    local playerData = ESX.GetPlayerData()
    if playerData.metadata.hunger then statusCache.hunger = playerData.metadata.hunger end
    if playerData.metadata.thirst then statusCache.thirst = playerData.metadata.thirst end
end)

RegisterNetEvent('esx:setPlayerData')
AddEventHandler('esx:setPlayerData', function(key, value)
    if key == 'metadata' then
        if value.hunger then statusCache.hunger = value.hunger end
        if value.thirst then statusCache.thirst = value.thirst end
    end
end)

local esxBars = {
    {name = 'hunger', color = '#ff8138', source = function(ped) return statusCache.hunger end},
    {name = 'thirst', color = '#339dff', source = function(ped) return statusCache.thirst end},
}

for _, bar in ipairs(esxBars) do
    table.insert(Config.Bars, bar)
end
```

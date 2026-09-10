# V1.3.0 has been released !

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
    {name = 'stamina', color = '#FFC04D', source = function(ped) return 100 - GetPlayerSprintStaminaRemaining(PlayerId()) end},
}
```

## Get support on [Discord](https://discord.gg/abFcpDKqdX)

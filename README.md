# RS-HUD-V2

<img width="2560" height="1440" alt="image" src="https://github.com/user-attachments/assets/8b9d0c30-eae2-4315-98a7-df3fe8699827" />

```lua
Config = {}

Config.Colors = {
    Primary = '#E576B8',
    Secondary = '#FFFFFF50'
}

Config.Bars = {
    {name = 'health', color = '#e63e5a', source = function(ped) return (GetEntityHealth(ped) * 100) / 200 end},
    {name = 'armor', color = '#00D2FF', source = function(ped) return GetPedArmour(ped) end},
    {name = 'hunger', color = '#f18343', source = function(ped) return 100 end},
    {name = 'thirst', color = '#77bdff', source = function(ped) return 80 end}
}

Config.Values = { -- Available values : gametime, streetname, zonename, serverid
    TopLeft = 'serverid',
    TopRight = 'zonename'
}
```

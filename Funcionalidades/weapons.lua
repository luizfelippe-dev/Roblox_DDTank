-- weapons.lua (StarterPlayerScripts)

local weapons = {
    ["Shuriken"] = { damage = 30, weight = 1, specialEffect = "none" },
    ["Bolsa de Tijolos"] = { damage = 50, weight = 3, specialEffect = "stun" },
    ["Equipamento Médico"] = { damage = 20, weight = 2, specialEffect = "heal" },
    ["Espadas Disparadas"] = { damage = 40, weight = 2, specialEffect = "pierce" },
    ["Saco de Dinamites"] = { damage = 70, weight = 4, specialEffect = "explode" },
    ["Raio"] = { damage = 60, weight = 1, specialEffect = "shock" }
}

function weapons.getWeapon(weaponName)
    return weapons[weaponName]
end

return weapons

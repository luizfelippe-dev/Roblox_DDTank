-- monsters.lua (StarterPlayerScripts)

local monsters = {
    ["Goblin"] = { health = 100, attack = 10, defense = 5 },
    ["Ogro"] = { health = 200, attack = 20, defense = 10 },
    ["Dragão"] = { health = 500, attack = 50, defense = 20, specialAttack = "fireBreath" },
    ["Necromante"] = { health = 300, attack = 30, defense = 15, specialAttack = "summonSkeletons" }
}

function monsters.getMonster(monsterName)
    return monsters[monsterName]
end

-- Ataques especiais dos monstros
function monsters.necromancerSpecialAttack()
    print("O Necromante invoca esqueletos!")
    -- Lógica para invocar novos monstros como "Esqueletos"
end

function monsters.dragonSpecialAttack()
    print("O Dragão usa sua respiração de fogo!")
    -- Lógica para ataque de fogo do Dragão
end

return monsters

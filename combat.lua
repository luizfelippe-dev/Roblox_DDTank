-- combat.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

-- Definindo diferentes tipos de monstros com atributos variados
local monsters = {
    ["Goblin"] = { health = 100, attack = 10, defense = 5 },
    ["Ogro"] = { health = 200, attack = 20, defense = 10 },
    ["Dragão"] = { health = 500, attack = 50, defense = 20, specialAttack = "fireBreath" },
    ["Necromante"] = { health = 300, attack = 30, defense = 15, specialAttack = "summonSkeletons" },
}

-- Função de ataque especial do Necromante (invocando esqueletos)
function necromancerSpecialAttack()
    print("O Necromante invoca esqueletos!")
    -- Aqui você pode adicionar a lógica para invocar novos monstros como "Esqueletos"
end

-- Monstro atual sendo enfrentado
local currentMonster = nil

-- Função para escolher um monstro para lutar
function chooseMonster(monsterName)
    currentMonster = monsters[monsterName]
    if currentMonster then
        print("Enfrentando um " .. monsterName .. " com " .. currentMonster.health .. " de vida!")
    else
        print("Monstro não encontrado!")
    end
end

-- Função para mostrar um efeito visual ao atacar
function showAttackEffect(target)
    local effectPart = Instance.new("Part")
    effectPart.Size = Vector3.new(1, 1, 1)
    effectPart.BrickColor = BrickColor.new("Bright red")
    effectPart.Transparency = 0.5
    effectPart.Anchored = true
    effectPart.CanCollide = false
    effectPart.CFrame = target.CFrame
    effectPart.Parent = workspace

    -- Desaparecer o efeito lentamente
    local tweenInfo = TweenInfo.new(0.5)
    local tween = TweenService:Create(effectPart, tweenInfo, {Transparency = 1})
    tween:Play()

    -- Remover o efeito após 0.5 segundos
    game:GetService("Debris"):AddItem(effectPart, 0.5)
end

-- Tabela de loot com diferentes itens e moedas
local lootTable = {
    {item = "Poção de Vida", chance = 50}, -- 50% de chance de dropar
    {item = "Pedra de Fortalecimento", chance = 25}, -- 25% de chance
    {item = "Espada de Ferro", chance = 10}, -- 10% de chance
    {item = "Escudo de Ouro", chance = 5} -- 5% de chance
}

-- Função para dropar loot aleatório
function dropLoot()
    local roll = math.random(1, 100) -- Rolar um número entre 1 e 100
    local cumulativeChance = 0

    for _, loot in ipairs(lootTable) do
        cumulativeChance = cumulativeChance + loot.chance
        if roll <= cumulativeChance then
            print("Você recebeu: " .. loot.item)
            addItemToInventory(loot.item) -- Função que adiciona o item ao inventário
            return
        end
    end

    print("Nenhum loot foi obtido.")
end


-- Função para atacar o monstro
function attackMonster()
    if not currentMonster then
        print("Nenhum monstro escolhido!")
        return
    end
    
    local damage = playerStats.attack - currentMonster.defense
    if damage < 0 then damage = 0 end
    currentMonster.health = currentMonster.health - damage
    -- Efeito visual ao atacar o monstro
    showAttackEffect(currentMonsterModel) -- Supondo que o monstro tenha um modelo visual

    print("Você causou " .. damage .. " de dano no monstro! Vida restante: " .. currentMonster.health)

    if currentMonster.health <= 0 then
        print("Monstro derrotado!")
        addCoins(50) -- Recompensa para o jogador
        dropLoot() -- Chama a função de loot ao derrotar o monstro
        currentMonster = nil -- Monstro derrotado, reset
    else
        monsterCounterAttack()
    end
end

-- Função de contra-ataque do monstro
function monsterCounterAttack()
    local damage = currentMonster.attack - playerStats.defense
    if damage < 0 then damage = 0 end
    playerStats.health = playerStats.health - damage
        -- Efeito visual ao monstro atacar o jogador
     showAttackEffect(character:FindFirstChild("HumanoidRootPart")) -- Efeito no jogador

    print("O monstro causou " .. damage .. " de dano em você! Sua vida: " .. playerStats.health)

    if playerStats.health <= 0 then
        print("Você foi derrotado!")
        -- Implementar lógica de respawn ou fantasma aqui
    end
end -

-- Exemplo de ataque especial do Dragão
function specialAttack()
    if currentMonster.specialAttack == "fireBreath" then
        print("O Dragão usa sua respiração de fogo!")
        local specialDamage = currentMonster.attack * 1.5 -- Aumenta o dano do ataque especial
        playerStats.health = playerStats.health - specialDamage
        print("O monstro causou " .. specialDamage .. " de dano com o ataque especial!")
    end
end

-- Exemplo de escolha de monstro
chooseMonster("Dragão")
attackMonster()  -- O jogador ataca o monstro

-- playerStats.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local statsGui = Instance.new("ScreenGui")
statsGui.Parent = player:WaitForChild("PlayerGui")

-- Atributos do jogador
local playerStats = {
    attack = 10,       -- Ataque inicial
    defense = 5,       -- Defesa inicial
    agility = 8,       -- Agilidade inicial
    luck = 6,          -- Sorte inicial
    damage = 12,       -- Dano básico inicial
    protection = 4,    -- Proteção inicial (armadura)
    physicalForce = 240,-- Força física inicial (energia)
    health = 100       -- Vida inicial
}

-- Exibe os atributos no HUD
local function createStatLabel(name, value, position)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.15, 0, 0.05, 0)
    label.Position = position
    label.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Text = name .. ": " .. value
    label.Parent = statsGui
    return label
end

-- Cria os labels para os atributos
local attackLabel = createStatLabel("Ataque", playerStats.attack, UDim2.new(0.05, 0, 0.10, 0))
local defenseLabel = createStatLabel("Defesa", playerStats.defense, UDim2.new(0.05, 0, 0.15, 0))
local agilityLabel = createStatLabel("Agilidade", playerStats.agility, UDim2.new(0.05, 0, 0.20, 0))
local luckLabel = createStatLabel("Sorte", playerStats.luck, UDim2.new(0.05, 0, 0.25, 0))
local damageLabel = createStatLabel("Dano", playerStats.damage, UDim2.new(0.05, 0, 0.30, 0))
local protectionLabel = createStatLabel("Proteção", playerStats.protection, UDim2.new(0.05, 0, 0.35, 0))
local physicalForceLabel = createStatLabel("Força Física", playerStats.physicalForce, UDim2.new(0.05, 0, 0.40, 0))
local healthLabel = createStatLabel("Vida", playerStats.health, UDim2.new(0.05, 0, 0.45, 0))

-- Função para atualizar os atributos na interface
local function updateStats()
    attackLabel.Text = "Ataque: " .. playerStats.attack
    defenseLabel.Text = "Defesa: " .. playerStats.defense
    agilityLabel.Text = "Agilidade: " .. playerStats.agility
    luckLabel.Text = "Sorte: " .. playerStats.luck
    damageLabel.Text = "Dano: " .. playerStats.damage
    protectionLabel.Text = "Proteção: " .. playerStats.protection
    physicalForceLabel.Text = "Força Física: " .. playerStats.physicalForce
    healthLabel.Text = "Vida: " .. playerStats.health
end

-- Funções para modificar os atributos
function increaseAttack(amount)
    playerStats.attack = playerStats.attack + amount
    updateStats()
end

function increaseDefense(amount)
    playerStats.defense = playerStats.defense + amount
    updateStats()
end

function increaseAgility(amount)
    playerStats.agility = playerStats.agility + amount
    playerStats.physicalForce = playerStats.physicalForce + math.floor(amount / 30) -- Aumenta a Força Física a cada 30 pontos de Agilidade
    updateStats()
end

function increaseLuck(amount)
    playerStats.luck = playerStats.luck + amount
    updateStats()
end

function increaseDamage(amount)
    playerStats.damage = playerStats.damage + amount
    updateStats()
end

function increaseProtection(amount)
    playerStats.protection = playerStats.protection + amount
    updateStats()
end

function increaseHealth(amount)
    playerStats.health = playerStats.health + amount
    updateStats()
end

function increasePhysicalForce(amount)
    playerStats.physicalForce = playerStats.physicalForce + amount
    updateStats()
end

-- pvpCombat.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")

-- Atributos de ambos os jogadores
local opponent = nil -- O oponente será definido ao aceitar o convite
local playerHealth = playerStats.health
local opponentHealth = nil -- Definido ao iniciar o combate

-- Função para atacar o oponente
function attackOpponent()
    if not opponent then
        print("Nenhum oponente foi encontrado!")
        return
    end

    local damage = playerStats.attack - opponent.Stats.defense
    if damage < 0 then damage = 0 end
    opponentHealth = opponentHealth - damage
    print("Você causou " .. damage .. " de dano em " .. opponent.Name .. ". Vida restante: " .. opponentHealth)

    if opponentHealth <= 0 then
        print(opponent.Name .. " foi derrotado!")
        -- Implementar lógica de vitória aqui
    else
        opponentCounterAttack()
    end
end

-- Função de contra-ataque do oponente
function opponentCounterAttack()
    local damage = opponent.Stats.attack - playerStats.defense
    if damage < 0 then damage = 0 end
    playerHealth = playerHealth - damage
    print(opponent.Name .. " causou " .. damage .. " de dano em você! Sua vida: " .. playerHealth)

    if playerHealth <= 0 then
        print("Você foi derrotado por " .. opponent.Name .. "!")
        -- Implementar lógica de derrota aqui
    end
end

-- Iniciar o combate
function startPvPCombat(targetPlayer)
    opponent = targetPlayer
    opponentHealth = targetPlayer.Stats.health
    print("Iniciando PvP contra " .. opponent.Name)
end

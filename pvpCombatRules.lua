-- pvpCombatRules.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PvPTimeLimit = 60 -- Tempo limite de 60 segundos

local opponent = nil -- Definido ao aceitar o convite
local playerHealth = playerStats.health
local opponentHealth = nil -- Definido ao iniciar o combate

local combatTimer = 0
local combatInProgress = false

-- Função para iniciar o combate com regras
function startPvPCombat(targetPlayer)
    opponent = targetPlayer
    opponentHealth = targetPlayer.Stats.health
    playerHealth = playerStats.health
    combatInProgress = true
    combatTimer = 0

    print("Iniciando PvP contra " .. opponent.Name)
    -- Iniciar contagem do tempo
    RunService.Heartbeat:Connect(updateCombatTime)
end

-- Função para atualizar o tempo do combate
function updateCombatTime(deltaTime)
    if combatInProgress then
        combatTimer = combatTimer + deltaTime
        if combatTimer >= PvPTimeLimit then
            endPvPCombat("time") -- Termina o combate se o tempo esgotar
        end
    end
end

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
        endPvPCombat("victory")
    else
        opponentCounterAttack()
    end
end

-- Função para o contra-ataque do oponente
function opponentCounterAttack()
    local damage = opponent.Stats.attack - playerStats.defense
    if damage < 0 then damage = 0 end
    playerHealth = playerHealth - damage
    print(opponent.Name .. " causou " .. damage .. " de dano em você! Sua vida: " .. playerHealth)

    if playerHealth <= 0 then
        endPvPCombat("defeat")
    end
end

-- Função para terminar o combate com base nas condições
function endPvPCombat(condition)
    combatInProgress = false -- Para o combate

    if condition == "victory" then
        print("Você venceu o combate!")
        updateLeaderboard(player, "win")
    elseif condition == "defeat" then
        print("Você perdeu o combate!")
        updateLeaderboard(opponent, "win")
    elseif condition == "time" then
        -- Verificar quem tem mais vida ao final do tempo
        if playerHealth > opponentHealth then
            print("Você venceu por ter mais vida!")
            updateLeaderboard(player, "win")
        elseif opponentHealth > playerHealth then
            print("Você perdeu, o oponente tinha mais vida!")
            updateLeaderboard(opponent, "win")
        else
            print("O combate terminou em empate!")
        end
    end

    -- Resetar as vidas após o combate
    playerHealth = playerStats.health
    opponentHealth = opponent.Stats.health
end

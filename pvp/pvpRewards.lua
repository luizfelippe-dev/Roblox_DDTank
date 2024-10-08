-- pvpRewards.lua (ServerScriptService)

local pvpRewardsThresholds = {
    { wins = 5, reward = { type = "item", value = "Espada de Prata" } },  -- Recompensa por 5 vitórias
    { wins = 10, reward = { type = "coins", value = 1000 } },  -- Recompensa por 10 vitórias
    { wins = 20, reward = { type = "item", value = "Escudo de Platina" } },  -- Recompensa por 20 vitórias
    { wins = 50, reward = { type = "coins", value = 5000 } }  -- Recompensa por 50 vitórias
}

-- Função para verificar e conceder prêmios
function checkPvPRewards(player)
    local playerStats = player:FindFirstChild("leaderstats")
    local pvpWins = playerStats and playerStats:FindFirstChild("PvPWins")

    if pvpWins then
        for _, threshold in ipairs(pvpRewardsThresholds) do
            if pvpWins.Value == threshold.wins then
                -- Conceder a recompensa
                givePvPReward(player, threshold.reward)
                print("Parabéns " .. player.Name .. "! Você ganhou uma recompensa por " .. threshold.wins .. " vitórias.")
            end
        end
    end
end

-- Função para dar a recompensa ao jogador
function givePvPReward(player, reward)
    if reward.type == "item" then
        addItemToInventory(reward.value, player)  -- Função que adiciona o item ao inventário do jogador
        print(player.Name .. " recebeu o item: " .. reward.value)
    elseif reward.type == "coins" then
        addCoins(reward.value, player)  -- Função que adiciona moedas ao jogador
        print(player.Name .. " recebeu " .. reward.value .. " moedas.")
    end
end

-- Atualizando a função de fim de combate PvP para verificar as recompensas
function endPvPCombat(condition)
    combatInProgress = false

    if condition == "victory" then
        print("Você venceu o combate!")
        updateLeaderboard(player, "win")
        checkPvPRewards(player)  -- Verifica se o jogador ganhou alguma recompensa
    elseif condition == "defeat" then
        print("Você perdeu o combate!")
        updateLeaderboard(opponent, "win")
        checkPvPRewards(opponent)  -- Verifica se o oponente ganhou alguma recompensa
    elseif condition == "time" then
        -- Regras do tempo limite para vitória ou empate
        if playerHealth > opponentHealth then
            print("Você venceu por ter mais vida!")
            updateLeaderboard(player, "win")
            checkPvPRewards(player)
        elseif opponentHealth > playerHealth then
            print("Você perdeu, o oponente tinha mais vida!")
            updateLeaderboard(opponent, "win")
            checkPvPRewards(opponent)
        else
            print("O combate terminou em empate!")
        end
    end

    -- Resetar as vidas após o combate
    playerHealth = playerStats.health
    opponentHealth = opponent.Stats.health
end

-- missions.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer

-- Tabela de Missões
local missions = {
    { id = 1, name = "Derrote 10 Goblins", objective = { type = "kill", target = "Goblin", count = 10 }, reward = { type = "coins", value = 500 } },
    { id = 2, name = "Colete 5 Pedras de Fortalecimento", objective = { type = "collect", item = "Pedra de Fortalecimento", count = 5 }, reward = { type = "item", value = "Armadura de Prata" } },
    { id = 3, name = "Complete uma Missão PvP", objective = { type = "pvp", wins = 1 }, reward = { type = "coins", value = 1000 } }
}

local currentMissions = {} -- Missões ativas do jogador

-- Função para adicionar uma missão ao jogador
function addMission(missionId)
    for _, mission in ipairs(missions) do
        if mission.id == missionId then
            table.insert(currentMissions, mission)
            print("Missão adicionada: " .. mission.name)
        end
    end
end

-- Função para verificar o progresso de uma missão
function checkMissionProgress(missionId, eventType, eventData)
    for _, mission in ipairs(currentMissions) do
        if mission.id == missionId then
            if eventType == mission.objective.type then
                if eventType == "kill" and eventData.target == mission.objective.target then
                    mission.objective.count = mission.objective.count - 1
                    if mission.objective.count <= 0 then
                        completeMission(mission)
                    end
                elseif eventType == "collect" and eventData.item == mission.objective.item then
                    mission.objective.count = mission.objective.count - 1
                    if mission.objective.count <= 0 then
                        completeMission(mission)
                    end
                elseif eventType == "pvp" and eventData.wins >= mission.objective.wins then
                    completeMission(mission)
                end
            end
        end
    end
end

-- Função para completar uma missão
function completeMission(mission)
    print("Missão completada: " .. mission.name)
    giveMissionReward(mission.reward)
end

-- Função para dar a recompensa da missão ao jogador
function giveMissionReward(reward)
    if reward.type == "coins" then
        addCoins(reward.value, player)
        print(player.Name .. " recebeu " .. reward.value .. " moedas.")
    elseif reward.type == "item" then
        addItemToInventory(reward.value, player)
        print(player.Name .. " recebeu o item: " .. reward.value)
    end
end

-- Exemplo de como adicionar e completar uma missão
addMission(1) -- Adiciona a missão "Derrote 10 Goblins"
checkMissionProgress(1, "kill", { target = "Goblin" }) -- Simula matar um Goblin

-- Lista de missões diárias e semanais
local dailyMissions = {
    { id = 1, name = "Derrote 5 Goblins", objective = { type = "kill", target = "Goblin", count = 5 }, reward = { type = "coins", value = 200 } },
    { id = 2, name = "Participe de 1 PvP", objective = { type = "pvp", wins = 1 }, reward = { type = "item", value = "Poção de Vida" } }
}

local weeklyMissions = {
    { id = 1, name = "Vença 10 PvPs", objective = { type = "pvp", wins = 10 }, reward = { type = "item", value = "Armadura de Ouro" } },
    { id = 2, name = "Colete 50 moedas em missões", objective = { type = "collect", item = "Moeda", count = 50 }, reward = { type = "coins", value = 5000 } }
}

-- Função para resetar missões diárias e semanais
function resetMissions()
    currentMissions = {} -- Limpa as missões atuais
    -- Adiciona as novas missões diárias e semanais
    for _, mission in ipairs(dailyMissions) do
        addMission(mission.id)
    end
    for _, mission in ipairs(weeklyMissions) do
        addMission(mission.id)
    end
    print("Missões diárias e semanais resetadas!")
end

-- Exemplo de reset diário/semana (pode ser acionado com um temporizador)
resetMissions()

local DataStoreService = game:GetService("DataStoreService")
local missionsDataStore = DataStoreService:GetDataStore("PlayerMissions")

-- Função para salvar progresso de missões
function saveMissionProgress(player, missionId, progress)
    local success, errorMessage = pcall(function()
        missionsDataStore:SetAsync(player.UserId .. "_mission_" .. missionId, progress)
    end)

    if success then
        print("Progresso da missão salvo para " .. player.Name)
    else
        warn("Erro ao salvar progresso da missão: " .. errorMessage)
    end
end

-- Função para carregar progresso da missão
function loadMissionProgress(player, missionId)
    local progress
    local success, errorMessage = pcall(function()
        progress = missionsDataStore:GetAsync(player.UserId .. "_mission_" .. missionId)
    end)

    if success and progress then
        print("Progresso da missão carregado para " .. player.Name)
        return progress
    else
        warn("Erro ao carregar progresso da missão: " .. errorMessage)
        return 0 -- Progresso inicial
    end
end

local rareItems = {
    { name = "Espada Lendária", rarity = "lendário" },
    { name = "Pet Dragão", rarity = "épico" }
}

-- Função para dar itens raros como recompensa
function giveRareItemReward(player)
    local rareItem = rareItems[math.random(1, #rareItems)] -- Seleciona um item aleatório da lista
    addItemToInventory(rareItem.name, player)
    print(player.Name .. " recebeu um item raro: " .. rareItem.name .. " (" .. rareItem.rarity .. ")")
end



-- guildRanking.lua (ServerScriptService)

local DataStoreService = game:GetService("DataStoreService")
local guildsDataStore = DataStoreService:GetDataStore("GuildPoints")

-- Função para adicionar pontos à guilda
function addGuildPoints(guildName, points)
    local guild = guilds[guildName]
    if guild then
        guild.points = guild.points + points
        print(guildName .. " ganhou " .. points .. " pontos! Pontuação total: " .. guild.points)

        -- Salvar a nova pontuação no DataStore
        pcall(function()
            guildsDataStore:SetAsync(guildName .. "_points", guild.points)
        end)
    else
        print("Guilda não encontrada.")
    end
end

-- Função para carregar os pontos da guilda
function loadGuildPoints(guildName)
    local success, points = pcall(function()
        return guildsDataStore:GetAsync(guildName .. "_points")
    end)

    if success and points then
        guilds[guildName].points = points
        print("Pontos carregados para a guilda " .. guildName .. ": " .. points)
    else
        print("Erro ao carregar os pontos da guilda ou guilda não encontrada.")
    end
end

-- Exemplo de atribuição de pontos em eventos
addGuildPoints("ExemploGuild", 50) -- Guilda ganha 50 pontos por completar um evento

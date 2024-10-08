-- guildTournaments.lua (ServerScriptService)

local guildTournamentBracket = {} -- Tabela para armazenar o chaveamento do torneio

-- Função para adicionar guildas ao torneio
function addGuildToTournament(guildName)
    table.insert(guildTournamentBracket, guildName)
    print("Guilda " .. guildName .. " adicionada ao torneio!")
end

-- Função para iniciar o torneio
function startGuildTournament()
    print("Torneio de Guildas iniciado!")
    -- Implementar lógica de chaveamento e batalhas entre guildas
end

-- Exemplo de vitória em uma batalha PvP de torneio
function guildPvPBattle(guild1, guild2)
    -- Lógica de batalha PvP entre duas guildas (a ser implementada)
    local winner = guild1 -- Exemplo de resultado
    print("Guilda " .. winner .. " venceu a batalha!")
    addGuildPoints(winner, 200) -- Atribui 200 pontos à guilda vencedora
end

-- guilds.lua (StarterPlayerScripts)

local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local guilds = {}  -- Tabela para armazenar todas as guildas
local maxGuildMembers = 10 -- Limite de membros por guilda

-- Função para criar uma guilda
function createGuild(guildName)
    if not guilds[guildName] then
        guilds[guildName] = {
            name = guildName,
            leader = player.Name,
            members = { player.Name },
            points = 0 -- Pontos iniciais da guilda
        }
        print("Guilda criada com sucesso: " .. guildName)
    else
        print("O nome da guilda já existe!")
    end
end

-- Função para convidar um jogador para a guilda
function inviteToGuild(guildName, targetPlayer)
    local guild = guilds[guildName]
    if guild then
        if #guild.members < maxGuildMembers then
            table.insert(guild.members, targetPlayer.Name)
            print(targetPlayer.Name .. " foi convidado para a guilda " .. guildName)
        else
            print("A guilda já atingiu o número máximo de membros!")
        end
    else
        print("Guilda não encontrada.")
    end
end

-- Função para entrar em uma guilda existente
function joinGuild(guildName)
    local guild = guilds[guildName]
    if guild then
        if #guild.members < maxGuildMembers then
            table.insert(guild.members, player.Name)
            print("Você entrou na guilda " .. guildName)
        else
            print("A guilda já está cheia!")
        end
    else
        print("Guilda não encontrada.")
    end
end

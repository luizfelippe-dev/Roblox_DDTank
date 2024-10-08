-- leaderboard.lua (ServerScriptService)

local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local pvpWinsDataStore = DataStoreService:GetDataStore("PvPWins")

-- Criar leaderboard quando o jogador entra no jogo
Players.PlayerAdded:Connect(function(player)
    -- Cria uma leaderboard de PvP wins para cada jogador
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local pvpWins = Instance.new("IntValue")
    pvpWins.Name = "PvPWins"
    pvpWins.Parent = leaderstats

    -- Tenta carregar o número de vitórias armazenado
    local success, data = pcall(function()
        return pvpWinsDataStore:GetAsync(player.UserId)
    end)

    if success and data then
        pvpWins.Value = data
    else
        pvpWins.Value = 0 -- Começa com 0 vitórias se nenhum dado for encontrado
    end
end)

-- Função para atualizar o leaderboard ao vencer
function updateLeaderboard(winner, result)
    if result == "win" then
        local playerStats = winner:FindFirstChild("leaderstats")
        local pvpWins = playerStats and playerStats:FindFirstChild("PvPWins")

        if pvpWins then
            pvpWins.Value = pvpWins.Value + 1

            -- Salvar a nova quantidade de vitórias no DataStore
            pcall(function()
                pvpWinsDataStore:SetAsync(winner.UserId, pvpWins.Value)
            end)

            print(winner.Name .. " agora tem " .. pvpWins.Value .. " vitórias em PvP.")
        end
    end
end

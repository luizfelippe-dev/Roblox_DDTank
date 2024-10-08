-- arena.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local pvpArena = workspace:WaitForChild("PvPArena") -- Supondo que você tenha uma área chamada 'PvPArena' no workspace
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Função para teletransportar jogador para a arena
function teleportToArena(player)
    if pvpArena then
        player.Character.HumanoidRootPart.CFrame = pvpArena.CFrame -- Teletransporta o jogador para o centro da arena
        print(player.Name .. " foi teletransportado para a arena!")
    else
        warn("A arena PvP não foi encontrada!")
    end
end

-- Exemplo de chamada para teletransportar o jogador
teleportToArena(player)

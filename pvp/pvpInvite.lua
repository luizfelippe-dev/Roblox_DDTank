-- pvpInvite.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Evento de convite de PvP
local pvpInviteEvent = Instance.new("RemoteEvent")
pvpInviteEvent.Name = "PvPInviteEvent"
pvpInviteEvent.Parent = ReplicatedStorage

-- Função para enviar convite de PvP
function sendPvPInvite(targetPlayer)
    pvpInviteEvent:FireServer(targetPlayer)
    print("Convite de PvP enviado para " .. targetPlayer.Name)
end

-- Função para aceitar convite de PvP
function acceptPvPInvite(sender)
    print(player.Name .. " aceitou o convite de PvP de " .. sender.Name)
    -- Teletransportar ambos os jogadores para a arena
    teleportToArena(player)
    teleportToArena(sender)
end

-- Função para recusar o convite
function declinePvPInvite(sender)
    print(player.Name .. " recusou o convite de PvP de " .. sender.Name)
end

-- Listener para receber convites de PvP
pvpInviteEvent.OnClientEvent:Connect(function(sender)
    print(sender.Name .. " convidou você para um PvP!")
    -- Aqui, você pode exibir um popup para aceitar ou recusar o convite
    acceptPvPInvite(sender) -- Exemplo de aceitação automática
end)

-- Enviar um convite para PvP a outro jogador
local targetPlayer = Players:FindFirstChild("OtherPlayerName") -- Substitua com o nome do jogador
sendPvPInvite(targetPlayer)

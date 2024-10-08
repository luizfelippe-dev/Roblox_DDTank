-- coins.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local coins = 0 -- Saldo inicial de moedas

-- Exibe o saldo de moedas no HUD
local coinLabel = Instance.new("TextLabel")
coinLabel.Size = UDim2.new(0.1, 0, 0.05, 0)
coinLabel.Position = UDim2.new(0.05, 0, 0.05, 0) -- Canto superior esquerdo
coinLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
coinLabel.TextColor3 = Color3.new(1, 1, 0)
coinLabel.TextScaled = true
coinLabel.Text = "Moedas: " .. coins
coinLabel.Parent = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

-- Função para adicionar moedas
function addCoins(amount)
    coins = coins + amount
    coinLabel.Text = "Moedas: " .. coins
    print("Ganhou " .. amount .. " moedas. Saldo atual: " .. coins)
end

-- Função para remover moedas
function removeCoins(amount)
    if coins >= amount then
        coins = coins - amount
        coinLabel.Text = "Moedas: " .. coins
        print("Gastou " .. amount .. " moedas. Saldo atual: " .. coins)
    else
        print("Saldo insuficiente!")
    end
end

-- Exemplo de como adicionar moedas
addCoins(200)

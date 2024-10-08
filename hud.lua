-- hud.lua (StarterGui)

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Barra de Vida
local healthBar = Instance.new("Frame")
healthBar.Size = UDim2.new(0.3, 0, 0.05, 0)
healthBar.Position = UDim2.new(0.05, 0, 0.9, 0) -- Posição no canto inferior esquerdo
healthBar.BackgroundColor3 = Color3.new(1, 0, 0) -- Vermelho para a vida
healthBar.Parent = screenGui

-- Barra de Força
local forceBar = Instance.new("Frame")
forceBar.Size = UDim2.new(0.3, 0, 0.05, 0)
forceBar.Position = UDim2.new(0.05, 0, 0.85, 0) -- Abaixo da barra de vida
forceBar.BackgroundColor3 = Color3.new(0, 1, 0) -- Verde para a força
forceBar.Parent = screenGui

-- Botão da Mochila
local backpackButton = Instance.new("TextButton")
backpackButton.Size = UDim2.new(0.1, 0, 0.05, 0) -- Tamanho do botão
backpackButton.Position = UDim2.new(0.85, 0, 0.9, 0) -- Posição no canto inferior direito
backpackButton.Text = "Mochila"
backpackButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
backpackButton.TextColor3 = Color3.new(1, 1, 1)
backpackButton.Parent = screenGui

-- Botão da Loja
local shopButton = Instance.new("TextButton")
shopButton.Size = UDim2.new(0.1, 0, 0.05, 0) -- Tamanho do botão
shopButton.Position = UDim2.new(0.73, 0, 0.9, 0) -- Posição ao lado do botão da mochila
shopButton.Text = "Loja"
shopButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
shopButton.TextColor3 = Color3.new(1, 1, 1)
shopButton.Parent = screenGui

-- Função para abrir a mochila
backpackButton.MouseButton1Click:Connect(function()
    print("Abrir Mochila")
end)

-- Função para abrir a loja
shopButton.MouseButton1Click:Connect(function()
    print("Abrir Loja")
end)

-- Atualiza a barra de vida conforme o jogador perde/gana vida
local character = player.Character or player.CharacterAdded:Wait()
character.Humanoid.HealthChanged:Connect(function(health)
    healthBar.Size = UDim2.new(health / character.Humanoid.MaxHealth, 0, 0.05, 0)
end)

-- Exemplo para atualizar a barra de força
local maxForce = 100
local currentForce = 0
function updateForceBar(force)
    forceBar.Size = UDim2.new(force / maxForce, 0, 0.05, 0)
end

-- Simulação do aumento de força
game:GetService("RunService").Heartbeat:Connect(function()
    if currentForce < maxForce then
        currentForce = currentForce + 1
        updateForceBar(currentForce)
    end
end)

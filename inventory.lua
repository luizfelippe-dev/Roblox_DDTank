-- inventory.lua (StarterGui)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")

local equippedLabel = Instance.new("TextLabel")
equippedLabel.Size = UDim2.new(0.3, 0, 0.05, 0)
equippedLabel.Position = UDim2.new(0.05, 0, 0.8, 0)
equippedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
equippedLabel.TextColor3 = Color3.new(1, 1, 1)
equippedLabel.TextScaled = true
equippedLabel.Text = "Equipado: Nenhum"
equippedLabel.Parent = screenGui

local equippedItem = nil -- Armazena o item atualmente equipado
local equippedModel = nil -- Armazena o modelo visual do item

-- Função para adicionar visualização de equipamento no personagem
function equipVisualItem(itemName)
    -- Remover o item equipado anteriormente, se existir
    if equippedModel then
        equippedModel:Destroy()
    end

    -- Criar o novo item equipado
    if itemName == "Espada de Bronze" then
        equippedModel = Instance.new("Part")
        equippedModel.Name = "Espada"
        equippedModel.Size = Vector3.new(1, 4, 0.2)
        equippedModel.BrickColor = BrickColor.new("Bright yellow") -- Exemplo de cor
        equippedModel.Parent = character -- Adiciona ao avatar do jogador

        -- Posicionar a espada na mão do jogador
        local weld = Instance.new("Weld")
        weld.Part0 = equippedModel
        weld.Part1 = character:FindFirstChild("RightHand") -- Liga à mão direita
        weld.C0 = CFrame.new(0, 0, 0) -- Ajuste a posição relativa à mão
        weld.Parent = equippedModel
    elseif itemName == "Escudo de Ferro" then
        equippedModel = Instance.new("Part")
        equippedModel.Name = "Escudo"
        equippedModel.Size = Vector3.new(2, 3, 0.5)
        equippedModel.BrickColor = BrickColor.new("Dark stone grey")
        equippedModel.Parent = character

        -- Posicionar o escudo no braço esquerdo do jogador
        local weld = Instance.new("Weld")
        weld.Part0 = equippedModel
        weld.Part1 = character:FindFirstChild("LeftHand")
        weld.C0 = CFrame.new(0, 0, 0)
        weld.Parent = equippedModel
    end
end

-- Função para equipar o item e modificar stats
function equipItem(itemName)
    equippedItem = itemName
    equippedLabel.Text = "Equipado: " .. itemName

    -- Conectar ao sistema de stats para modificar os atributos
    if itemName == "Espada de Bronze" then
        increaseAttack(20)
    elseif itemName == "Escudo de Ferro" then
        increaseDefense(15)
    end

    -- Visualmente equipar o item no personagem
    equipVisualItem(itemName)
end

-- Função para adicionar itens à mochila
function addItemToInventory(itemName)
    local itemButton = Instance.new("TextButton")
    itemButton.Size = UDim2.new(0.2, 0, 0.2, 0)
    itemButton.Text = itemName
    itemButton.Parent = inventoryFrame

    -- Quando o jogador clica no item, ele é equipado
    itemButton.MouseButton1Click:Connect(function()
        equipItem(itemName)
    end)
end

-- Exemplo de como adicionar itens
addItemToInventory("Espada de Bronze")
addItemToInventory("Escudo de Ferro")

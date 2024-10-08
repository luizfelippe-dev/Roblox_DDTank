-- Script para a Loja
local shopFrame = Instance.new("Frame")
shopFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
shopFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
shopFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
shopFrame.Visible = false -- Começa invisível até ser aberta
shopFrame.Parent = screenGui

-- Título da Loja
local shopTitle = Instance.new("TextLabel")
shopTitle.Size = UDim2.new(1, 0, 0.1, 0)
shopTitle.Text = "Loja"
shopTitle.TextScaled = true
shopTitle.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
shopTitle.Parent = shopFrame

-- Função para mostrar/esconder a loja
local shopVisible = false

local shopButton = screenGui:WaitForChild("ShopButton")
shopButton.MouseButton1Click:Connect(function()
    shopVisible = not shopVisible
    shopFrame.Visible = shopVisible
end)

-- Função para adicionar itens à loja
function addItemToShop(itemName, price)
    local itemButton = Instance.new("TextButton")
    itemButton.Size = UDim2.new(0.2, 0, 0.2, 0) -- Tamanho de cada item
    itemButton.Text = itemName .. " - " .. price .. " moedas"
    itemButton.Parent = shopFrame
    
    -- Quando o jogador compra o item
    itemButton.MouseButton1Click:Connect(function()
        print("Item comprado: " .. itemName)
        -- Aqui você pode adicionar lógica para verificar o saldo do jogador
        -- E adicionar o item à mochila após a compra
        addItemToInventory(itemName)
    end)
end

-- Exemplo de itens na loja
addItemToShop("Espada de Bronze", 100)
addItemToShop("Escudo de Ferro", 150)

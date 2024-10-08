-- Variáveis principais
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Configurações de times
local team1 = {} -- Time 1
local team2 = {} -- Time 2
local currentPlayerTurn = 1
local currentTeam = 1
local totalPlayersPerTeam = 3 -- Número de jogadores por time
local maxPlayers = 6 -- Máximo de jogadores

-- linha de mira
local aimingLine = Instance.new("Part")
aimingLine.Size = Vector3.new(0.2, 0.2, 20) -- Comprimento e espessura da linha de mira
aimingLine.Anchored = true
aimingLine.CanCollide = false
aimingLine.BrickColor = BrickColor.new("Bright yellow") -- Cor da linha de mira
aimingLine.Transparency = 0.5
aimingLine.Parent = workspace

-- ajuste de força
local holdingDown = false
local holdStartTime = 0
local maxForce = 500 -- Força máxima
local minForce = 100 -- Força mínima

-- Função atualizar a mira enquanto o mouse se move
function updateAimingLine()
    local direction = (mouse.Hit.p - player.Character.Head.Position).unit
    aimingLine.CFrame = CFrame.new(player.Character.Head.Position, mouse.Hit.p) * CFrame.new(0, 0, -aimingLine.Size.Z/2)
end

-- Atualiza a mira enquanto o jogador move o mouse
mouse.Move:Connect(updateAimingLine)

-- Função para disparar o projetil
function fireProjectile(force)
    local projectile = Instance.new("Part") -- Criando o projetil
    projectile.Shape = Enum.PartType.Ball -- Formato da esfera
    projectile.Size = Vector3.new(1,1,1) -- Tamanho do projetil
    projectile.Position = player.Character.Head.Position -- Posição de disparo (pode ajustar)
    projectile.Anchored = false
    projectile.CanCollide = true
    projectile.Parent = workspace

    -- Física do projetil (simulação de força e ângulo)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    
    -- Calculando a direção do disparo
    local direction = (mouse.Hit.p - projectile.Position).unit

    -- Aplicando força ao projetil
    bodyVelocity.Velocity = direction * force
    bodyVelocity.Parent = projectile

    -- Remover o projetil após um tempo (para evitar que fique no jogo)
    game.Debris:AddItem(projectile, 10)
end

-- Função para trocar de turno entre os times
function changeTurn()
    if currentTeam == 1 then
        currentPlayerTurn = currentPlayerTurn + 1
        if currentPlayerTurn > #team1 then
            currentPlayerTurn = 1
            currentTeam = 2 -- Troca para o Time 2
        end
    else
        currentPlayerTurn = currentPlayerTurn + 1
        if currentPlayerTurn > #team2 then
            currentPlayerTurn = 1
            currentTeam = 1 -- Troca para o Time 1
        end
    end
    print("Agora é a vez do jogador do Time " .. currentTeam .. " e o jogador é o número " .. currentPlayerTurn)
end

-- Verificar se é o turno do jogador antes de permitir disparar
mouse.Button1Up:Connect(function()
    local currentTeamTable = (currentTeam == 1) and team1 or team2

    if holdingDown and player == currentTeamTable[currentPlayerTurn] then
        holdingDown = false
        local holdDuration = tick() - holdStartTime -- Tempo que o botão foi segurado
        local force = minForce + (holdDuration * (maxForce - minForce)) -- Calcular a força com base no tempo segurado
        if force > maxForce then force = maxForce end -- Limitar a força máxima

        fireProjectile(force) -- Disparar com a força calculada

        -- Trocar o turno para o próximo jogador
        changeTurn()
    end
end)

-- Iniciar a medição do tempo quando o jogador segurar o botão
mouse.Button1Down:Connect(function()
    holdingDown = true
    holdStartTime = tick() -- Guarda o tempo em que o botão começou a ser pressionado
end)

-- Função para atribuir jogadores aos times (simulação)
function assignTeams()
    for i, p in pairs(game.Players:GetPlayers()) do
        if i <= totalPlayersPerTeam then
            table.insert(team1, p) -- Adiciona ao Time 1
        else
            table.insert(team2, p) -- Adiciona ao Time 2
        end
    end
end

-- Atribui os jogadores aos times no início do jogo
assignTeams()

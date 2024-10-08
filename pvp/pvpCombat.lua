-- pvpCombat.lua (StarterPlayerScripts)

local combatPhysics = require(game.StarterPlayerScripts.combatPhysics)
local weapons = require(game.StarterPlayerScripts.weapons)

-- Configurações de times e turnos
local team1 = {}
local team2 = {}
local currentPlayerTurn = 1
local currentTeam = 1
local maxPlayersPerTeam = 3
local maxPlayers = 6

-- Atributos dos jogadores
local playerHealth = playerStats.health
local opponentHealth = nil -- Definido ao iniciar o combate

-- Função para atacar o oponente usando o sistema de projétil
function attackOpponentWithProjectile(weaponName, angle, force, player)
    if not isPlayerTurn(player) then
        print("Não é o seu turno!")
        return
    end

    local weapon = weapons.getWeapon(weaponName)
    if weapon then
        print(player.Name .. " está disparando uma " .. weaponName)

        -- Lançar o projétil
        local startPosition = player.Character.HumanoidRootPart.Position
        local time = 0

        -- Criar o projétil
        local projectile = Instance.new("Part")
        projectile.Position = startPosition
        projectile.Size = Vector3.new(1, 1, 1)
        projectile.BrickColor = BrickColor.new("Bright red")
        projectile.Anchored = false
        projectile.Parent = workspace

        -- Simular o movimento do projétil
        while projectile.Position.Y > 0 do
            time = time + 0.1
            local newPosition = combatPhysics.calculateProjectileTrajectory(angle, force - weapon.weight, startPosition, time)
            projectile.Position = newPosition
            wait(0.1)
        end

        -- Cálculo de dano com base no ataque da arma e defesa do oponente
        local damage = weapon.damage - opponent.Stats.defense
        if damage < 0 then damage = 0 end
        opponentHealth = opponentHealth - damage
        print("Você causou " .. damage .. " de dano em " .. opponent.Name .. ". Vida restante: " .. opponentHealth)

        if opponentHealth <= 0 then
            print(opponent.Name .. " foi derrotado!")
            -- Implementar lógica de vitória
        else
            -- Passar o turno para o próximo jogador
            changeTurn()
        end
    else
        print("Arma desconhecida.")
    end
end

-- Iniciar o combate PvP entre dois jogadores
function startPvPCombat(targetPlayer)
    opponent = targetPlayer
    opponentHealth = targetPlayer.Stats.health
    print("Iniciando PvP contra " .. opponent.Name)
end

-- Verifica se é o turno do jogador antes de permitir que ele ataque
function isPlayerTurn(player)
    local currentTeamTable = (currentTeam == 1) and team1 or team2
    return player == currentTeamTable[currentPlayerTurn]
end

-- Troca de turno entre os jogadores
function changeTurn()
    if currentTeam == 1 then
        currentPlayerTurn = currentPlayerTurn + 1
        if currentPlayerTurn > #team1 then
            currentPlayerTurn = 1
            currentTeam = 2
        end
    else
        currentPlayerTurn = currentPlayerTurn + 1
        if currentPlayerTurn > #team2 then
            currentPlayerTurn = 1
            currentTeam = 1
        end
    end
    print("Agora é a vez do jogador do Time " .. currentTeam .. " e o jogador é o número " .. currentPlayerTurn)
end

-- Função para atribuir jogadores aos times
function assignTeams()
    for i, p in pairs(game.Players:GetPlayers()) do
        if i <= maxPlayersPerTeam then
            table.insert(team1, p)
        else
            table.insert(team2, p)
        end
    end
end

-- Atribui os jogadores aos times no início do jogo
assignTeams()

-- Exemplo de ataque com a arma "Shuriken"
attackOpponentWithProjectile("Shuriken", 45, 50, player)

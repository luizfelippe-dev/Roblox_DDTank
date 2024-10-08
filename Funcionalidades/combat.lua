-- combat.lua (StarterPlayerScripts)

local player = game.Players.LocalPlayer
local combatPhysics = require(game.StarterPlayerScripts.combatPhysics)
local monsters = require(game.StarterPlayerScripts.monsters)
local weapons = require(game.StarterPlayerScripts.weapons)

-- Função para atacar com uma arma
function fireWeapon(weaponName, angle, force)
    local weapon = weapons.getWeapon(weaponName)
    if weapon then
        print("Lançando " .. weaponName .. "!")
        local startPosition = player.Character.HumanoidRootPart.Position
        local time = 0

        -- Criar um projétil
        local projectile = Instance.new("Part")
        projectile.Position = startPosition
        projectile.Size = Vector3.new(1, 1, 1)
        projectile.BrickColor = BrickColor.new("Bright red")
        projectile.Anchored = false
        projectile.Parent = workspace

        -- Simula o movimento do projétil
        while projectile.Position.Y > 0 do
            time = time + 0.1  -- Incrementa o tempo
            local newPosition = combatPhysics.calculateProjectileTrajectory(angle, force - weapon.weight, startPosition, time)
            projectile.Position = newPosition
            wait(0.1)  -- Espera um curto tempo antes de calcular a próxima posição
        end
        print("O projétil atingiu o chão!")
    else
        print("Arma desconhecida.")
    end
end

-- Exemplo de combate contra um monstro
local currentMonster = monsters.getMonster("Dragão")
if currentMonster then
    print("Enfrentando o monstro: " .. "Dragão")
    fireWeapon("Shuriken", 45, 50)
    -- Lógica adicional de combate com o monstro...
end

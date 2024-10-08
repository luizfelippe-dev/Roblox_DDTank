-- combatPhysics.lua (StarterPlayerScripts)

local combatPhysics = {}

local gravity = 9.8  -- Valor da gravidade (m/s²)
local wind = 2  -- Força do vento (positivo para direita, negativo para esquerda)

function combatPhysics.calculateProjectileTrajectory(angle, force, startPosition, time)
    local radians = math.rad(angle)  -- Converte o ângulo de graus para radianos
    local x = startPosition.X + (force * math.cos(radians) * time) + (wind * time)  -- Calcula a posição X
    local y = startPosition.Y + (force * math.sin(radians) * time) - (0.5 * gravity * time^2)  -- Calcula a posição Y
    return Vector3.new(x, y, startPosition.Z)  -- Retorna a nova posição do projétil
end

return combatPhysics

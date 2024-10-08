-- guildEvents.lua (ServerScriptService)

local boss = {
    health = 10000,
    attack = 50,
    defense = 20
}

-- Função para atacar o chefe em um evento de guilda
function attackGuildBoss(player, damage)
    boss.health = boss.health - damage
    print(player.Name .. " causou " .. damage .. " de dano no chefe! Vida restante: " .. boss.health)

    if boss.health <= 0 then
        print("Chefe derrotado pela guilda!")
        addGuildPoints("ExemploGuild", 100) -- Atribui 100 pontos à guilda ao derrotar o chefe
        resetGuildBoss() -- Reiniciar o chefe para o próximo evento
    end
end

-- Função para resetar o chefe após a derrota
function resetGuildBoss()
    boss.health = 10000 -- Reseta a vida do chefe
    print("O chefe foi resetado para o próximo evento.")
end

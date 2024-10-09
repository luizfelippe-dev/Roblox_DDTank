const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

app.get('/updates', (req, res) => {
  res.json([
    { version: '1.0', description: 'Lançamento inicial do DDBlox! Introduzimos os modos de batalha 1v1, 2v2 e 3v3, além de uma cidade central repleta de atividades.', date: '2024-10-01' },
    { version: '1.1', description: 'Novo sistema de guildas e eventos semanais exclusivos para clãs! Junte-se a outros jogadores e conquiste o topo do ranking de guildas.', date: '2024-10-10' },
    { version: '1.2', description: 'Expansão de áreas na cidade e novas missões PvE para explorar. Derrote chefes poderosos e ganhe recompensas raras!', date: '2024-10-20' }
  ]);
});

app.get('/game-info', (req, res) => {
  res.json({
    description: 'DDBlox é um jogo de ação e aventura que combina elementos de batalha PvP inspirados em DDTANK com o estilo único do universo Roblox. Os jogadores podem explorar uma cidade central, personalizar seus avatares e competir em diversas arenas.',
    features: [
      { name: 'Sistema de PvP', detail: 'Batalhas em tempo real com física de tiro e estratégia. Ajuste o ângulo, força e desvie dos ataques dos adversários.' },
      { name: 'Guildas', detail: 'Junte-se a amigos para criar uma guilda poderosa e participe de eventos e guerras entre clãs.' },
      { name: 'Missões PvE', detail: 'Explore as regiões fora da cidade e enfrente inimigos desafiadores para obter recompensas especiais.' },
      { name: 'Personalização Completa', detail: 'Customize seu avatar com roupas, acessórios e armas exclusivas para se destacar no campo de batalha.' }
    ]
  });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
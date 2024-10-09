import React from 'react';
import './HomePage.css';

function HomePage() {
  return (
    <div className="home-page">
      <header className="header">
        <h1>Bem-vindo ao DDBlox!</h1>
        <p>
          DDBlox é um jogo multiplayer online inspirado no clássico DDTANK, mas com uma pegada totalmente nova e adaptada para o universo do Roblox. Desafie seus amigos em batalhas PvP épicas, junte-se a guildas para conquistar eventos exclusivos e explore um mundo cheio de aventuras e mistérios. 
        </p>
        <p>
          Embarque em uma jornada onde você pode evoluir seu personagem, desbloquear armas poderosas e personalizar cada detalhe do seu avatar para se destacar nas arenas e nos rankings globais. Seja um guerreiro destemido, um estrategista nato ou um explorador curioso: o caminho é seu para escolher!
        </p>
      </header>
      <img src="path-to-banner-image.jpg" alt="Banner do Jogo" className="banner-image" />
      <section className="highlights">
        <h2>Destaques do Jogo</h2>
        <div className="highlights-grid">
          <div className="highlight-item">
            <span>⚔️</span>
            <p>Batalhas PvP intensas em modos 1v1, 2v2 e 3v3, com mecânicas de tiro inspiradas em DDTANK e jogabilidade adaptada ao estilo Roblox.</p>
          </div>
          <div className="highlight-item">
            <span>🏰</span>
            <p>Participe de guildas e enfrente eventos exclusivos, colaborando com outros jogadores para dominar o ranking de clãs.</p>
          </div>
          <div className="highlight-item">
            <span>🌍</span>
            <p>Explore diversas áreas da cidade principal, enfrente monstros poderosos em instâncias especiais e descubra segredos ocultos.</p>
          </div>
          <div className="highlight-item">
            <span>📈</span>
            <p>Personalize seu personagem, melhore suas habilidades e equipamentos, e torne-se uma lenda nas arenas de DDBlox.</p>
          </div>
        </div>
      </section>
    </div>
  );
}

export default HomePage;

import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './GameInfoPage.css';

function GameInfoPage() {
  const [gameInfo, setGameInfo] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:5000/game-info')
      .then(response => {
        setGameInfo(response.data);
      })
      .catch(error => {
        console.error('Erro ao buscar informações do jogo:', error);
      });
  }, []);

  return (
    <div className="game-info-page">
      <h1>Sobre o DDBlox</h1>
      {gameInfo ? (
        <div className="game-details">
          <p className="description">{gameInfo.description}</p>
          <h2>Principais Funcionalidades:</h2>
          <ul className="features-list">
            {gameInfo.features.map((feature, index) => (
              <li key={index} className="feature-item">
                <strong>{feature.name}:</strong> {feature.detail}
              </li>
            ))}
          </ul>
        </div>
      ) : (
        <p>Carregando informações do jogo...</p>
      )}
    </div>
  );
}

export default GameInfoPage;

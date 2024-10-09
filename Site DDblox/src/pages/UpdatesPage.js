import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './UpdatesPage.css';

function UpdatesPage() {
  const [updates, setUpdates] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:5000/updates')
      .then(response => {
        setUpdates(response.data);
      })
      .catch(error => {
        console.error('Erro ao buscar atualizações:', error);
      });
  }, []);

  return (
    <div className="updates-page">
      <h1>Últimas Atualizações do Jogo</h1>
      {updates.length > 0 ? (
        <ul className="updates-list">
          {updates.map((update, index) => (
            <li key={index} className="update-item">
              <h3>Versão {update.version}</h3>
              <p>{update.description}</p>
              <span className="update-date">Lançado em: {update.date}</span>
            </li>
          ))}
        </ul>
      ) : (
        <p>Carregando atualizações...</p>
      )}
    </div>
  );
}

export default UpdatesPage;

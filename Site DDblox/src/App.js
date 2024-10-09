import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';
import UpdatesPage from './pages/UpdatesPage';
import GameInfoPage from './pages/GameInfoPage';
import Navbar from './components/Navbar';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/updates" element={<UpdatesPage />} />
        <Route path="/game-info" element={<GameInfoPage />} />
      </Routes>
    </Router>
  );
}

export default App;

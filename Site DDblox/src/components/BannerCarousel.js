import React from 'react';
import Slider from 'react-slick';
import './BannerCarousel.css';

function BannerCarousel() {
  const settings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
  };

  return (
    <div className="banner-carousel">
      <Slider {...settings}>
        <div className="banner-item">
          <img src="/images/banner1.jpg" alt="Evento Especial PvP" />
          <h2>Participe do Torneio PvP e ganhe prêmios exclusivos!</h2>
        </div>
        <div className="banner-item">
          <img src="/images/banner2.jpg" alt="Novo Modo de Jogo" />
          <h2>Explore o novo modo Aventura e desbrave novas áreas!</h2>
        </div>
        <div className="banner-item">
          <img src="/images/banner3.jpg" alt="Atualização de Guildas" />
          <h2>Crie uma guilda e participe de eventos únicos com seus amigos!</h2>
        </div>
      </Slider>
    </div>
  );
}

export default BannerCarousel;

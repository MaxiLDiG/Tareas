import React, { useState, useEffect } from 'react';
import '../styles/ImageGallery.css';

const images = [
  'img/image1.webp',
  'img/image2.jpeg',
  'img/image3.jpg',
];

function ImageGallery() {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);

  const handleKeyDown = (event) => {
    if (event.key === 'ArrowRight') {
      setCurrentImageIndex((prevIndex) =>
        prevIndex === images.length - 1 ? 0 : prevIndex + 1
      );
    } else if (event.key === 'ArrowLeft') {
      setCurrentImageIndex((prevIndex) =>
        prevIndex === 0 ? images.length - 1 : prevIndex - 1
      );
    }
  };

  useEffect(() => {
    window.addEventListener('keydown', handleKeyDown);
    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, []);

  return (
    <div className="gallery full-screen">
      <img
        src={images[currentImageIndex]}
        alt={`Imagen ${currentImageIndex + 1}`}
        className="gallery-image"
      />
    </div>
  );
}

export default ImageGallery;

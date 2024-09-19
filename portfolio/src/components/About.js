import React from 'react';
import { motion } from 'framer-motion';

const About = () => {
  return (
    <section id="about">
      <motion.h2
        initial={{ x: -100, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        Sobre Mí
      </motion.h2>
      <p>Soy un apasionado desarrollador web con experiencia en la creación de aplicaciones interactivas y funcionales. Me especializo en tecnologías como React, JavaScript y CSS, buscando siempre implementar las mejores prácticas y un diseño atractivo. Me encanta resolver problemas complejos y aprender nuevas habilidades que me permitan crecer en mi carrera. Fuera del desarrollo, disfruto de ir al gimnasio, lo que me ayuda a mantenerme creativo y motivado.</p>
    </section>
  );
};

export default About;

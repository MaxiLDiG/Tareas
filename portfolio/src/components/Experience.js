import React from 'react';
import { motion } from 'framer-motion';

const Experience = () => {
  return (
    <section id="experience">
      <motion.h2
        initial={{ x: -100, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        Experiencia
      </motion.h2>
      <p>He trabajado en varios proyectos que me han permitido desarrollar mis habilidades en el desarrollo web. He colaborado con equipos para crear aplicaciones dinámicas utilizando React y otras tecnologías. Mi enfoque ha sido siempre ofrecer soluciones efectivas y centradas en el usuario, aprendiendo de cada desafío y contribuyendo al éxito del equipo.</p>
    </section>
  );
};

export default Experience;

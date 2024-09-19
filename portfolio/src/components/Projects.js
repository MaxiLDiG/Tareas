import React from 'react';
import { motion } from 'framer-motion';

const Projects = () => {
  return (
    <section id="projects">
      <motion.h2
        initial={{ x: -100, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        Proyectos
      </motion.h2>
      <ul>
        <li>Expotec 2022</li>
        <li>Expotec 2023</li>
        <li>Juego de memorización C++</li>
      </ul>
    </section>
  );
};

export default Projects;

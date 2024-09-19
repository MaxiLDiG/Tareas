import React from 'react';
import { motion } from 'framer-motion';

const Skills = () => {
  return (
    <section id="skills">
      <motion.h2
        initial={{ x: -100, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        Habilidades
      </motion.h2>
      <ul>
        <li>React</li>
        <li>JavaScript</li>
        <li>CSS</li>
      </ul>
    </section>
  );
};

export default Skills;

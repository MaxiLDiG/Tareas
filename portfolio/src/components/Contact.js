import React, { useState } from 'react';
import { motion } from 'framer-motion';

const Contact = () => {
  const [formState, setFormState] = useState({ name: '', email: '', message: '' });

  const handleChange = (e) => {
    setFormState({ ...formState, [e.target.name]: e.target.value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    alert('Formulario enviado!');
  };

  return (
    <section id="contact">
      <motion.h2
        initial={{ x: -100, opacity: 0 }}
        animate={{ x: 0, opacity: 1 }}
        transition={{ duration: 0.5 }}
      >
        Contacto
      </motion.h2>
      <form onSubmit={handleSubmit}>
        <label>
          Nombre:
          <input type="text" name="name" value={formState.name} onChange={handleChange} />
        </label>
        <label>
          Email:
          <input type="email" name="email" value={formState.email} onChange={handleChange} />
        </label>
        <label>
          Mensaje:
          <textarea name="message" value={formState.message} onChange={handleChange} />
        </label>
        <button type="submit">Enviar</button>
      </form>
    </section>
  );
};

export default Contact;

import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet, ActivityIndicator, Animated } from 'react-native';
import axios from 'axios';

const LoginScreen = () => {
  const [user, setUser] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [fadeAnim] = useState(new Animated.Value(0));
  const [message, setMessage] = useState('');

  const handleLogin = () => {
    setLoading(true);
    setMessage('');

    axios.post('http://192.168.56.1/backend/login.php', {
      user: user,
      email: email,
      password: password,
    })
      .then(response => {
        setLoading(false);
        if (response.data.success) {
          setMessage('Login exitoso');
          animateMessage();
        } else {
          setMessage('Error en el login. Verifica tus datos.');
        }
      })
      .catch(error => {
        setLoading(false);
        setMessage('Error en la conexión con el servidor');
        console.error(error);
      });
  };

  const animateMessage = () => {
    Animated.timing(fadeAnim, {
      toValue: 1,
      duration: 1000,
      useNativeDriver: true,
    }).start();
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Iniciar Sesión</Text>

      <TextInput
        style={styles.input}
        placeholder="Usuario"
        value={user}
        onChangeText={setUser}
        placeholderTextColor="#aaa"
      />

      <TextInput
        style={styles.input}
        placeholder="Email"
        value={email}
        onChangeText={setEmail}
        keyboardType="email-address"
        placeholderTextColor="#aaa"
      />

      <TextInput
        style={styles.input}
        placeholder="Contraseña"
        value={password}
        onChangeText={setPassword}
        secureTextEntry={true}
        placeholderTextColor="#aaa"
      />

      {loading ? (
        <ActivityIndicator size="large" color="#ff6347" />
      ) : (
        <TouchableOpacity style={styles.button} onPress={handleLogin}>
          <Text style={styles.buttonText}>Ingresar</Text>
        </TouchableOpacity>
      )}

      {message ? (
        <Animated.View style={{ ...styles.message, opacity: fadeAnim }}>
          <Text style={styles.messageText}>{message}</Text>
        </Animated.View>
      ) : null}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#1a1a2e',
    padding: 16,
  },
  title: {
    fontSize: 36,
    fontWeight: 'bold',
    marginBottom: 30,
    color: '#e94560',
    textShadowColor: '#000',
    textShadowOffset: { width: 2, height: 2 },
    textShadowRadius: 10,
  },
  input: {
    width: '85%',
    padding: 15,
    marginVertical: 10,
    borderWidth: 1,
    borderColor: '#333',
    borderRadius: 10,
    backgroundColor: '#0f3460',
    color: '#fff',
    fontSize: 16,
    shadowColor: '#000',
    shadowOffset: { width: 2, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 5,
  },
  button: {
    width: '85%',
    backgroundColor: '#e94560',
    padding: 15,
    borderRadius: 10,
    alignItems: 'center',
    marginTop: 25,
    shadowColor: '#000',
    shadowOffset: { width: 2, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 5,
  },
  buttonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
  },
  message: {
    marginTop: 20,
    padding: 12,
    borderRadius: 10,
    backgroundColor: '#22a6b3',
    width: '85%',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 2, height: 2 },
    shadowOpacity: 0.8,
    shadowRadius: 5,
  },
  messageText: {
    fontSize: 16,
    color: '#fff',
  },
});

export default LoginScreen;

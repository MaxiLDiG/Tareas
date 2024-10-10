import React, { useState } from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';

export default function App() {
  const [screen, setScreen] = useState('home'); // Estado para alternar entre pantallas

  return (
    <View style={styles.container}>
      {screen === 'home' ? (
        <View>
          <Text style={styles.homeText}>Hola Mundo</Text>
          <Button title="Ir a otra pantalla" onPress={() => setScreen('other')} />
        </View>
      ) : (
        <View>
          <Text style={styles.otherText}>Hola Mundo</Text>
          <Button title="Volver a Home" onPress={() => setScreen('home')} />
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  homeText: {
    fontSize: 24,
    color: 'blue',
    textAlign: 'center'
  },
  otherText: {
    fontSize: 24,
    color: 'red',
  },
});

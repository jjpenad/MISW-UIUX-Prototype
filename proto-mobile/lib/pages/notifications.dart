import 'package:flutter/material.dart';
import 'home.dart'; // Importar el archivo home.dart para usar ReminderCard

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2235), // Fondo oscuro
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2235),
        elevation: 0, // Sin sombra
        title: Text(
          'Últimas Notificaciones',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReminderCard(), // Reutilizamos el componente ReminderCard
          ],
        ),
      ),
    );
  }
}

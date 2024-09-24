import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2235), // Color de fondo
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2235),
        elevation: 0, // Sin sombra
        title: Text(
          'GeoRecall',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/qr'); // Navegar a la página QR
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications'); // Navegar a la página Notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mis recordatorios:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ReminderCard(),
            ReminderCard(),
            ReminderCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new'); // Navegar a la página Add
        },
        backgroundColor: Colors.blue, // Color del FAB
        child: Icon(Icons.add, color: Colors.white), // Ícono del FAB
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/view'); // Navegar a la página View
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(
                    'Universidad de los Andes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('9:41 AM', style: TextStyle(color: Colors.black54)),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Devolver el libro',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Antes del 18 de Septiembre.',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context, 'Tu recordatorio ha sido completado', Icons.check, Colors.green);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF163C86),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('COMPLETAR', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context, 'Tu recordatorio ha sido eliminado', Icons.delete, Colors.red);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF54336),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('BORRAR', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String action, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Bordes redondeados
          ),
          elevation: 16,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 60), // Ícono más grande
                SizedBox(height: 20),
                Text(
                  '$action',
                  style: TextStyle(
                    fontSize: 22, // Tamaño de texto más grande
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Bordes redondeados en el botón
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Espaciado del botón
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // Tamaño del texto en el botón
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

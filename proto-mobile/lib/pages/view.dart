import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ViewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2235),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2235),
        elevation: 0,
        title: Text(
          'Nuevo Recordatorio',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navegar hacia atrás
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/edit'); // Navegar a la página Home
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReadOnlyInput(value: 'Devolver el libro', icon: Icons.title),
            SizedBox(height: 20),
            ReadOnlyInput(value: '2024-09-18', icon: Icons.date_range),
            SizedBox(height: 20),
            ReadOnlyInput(value: 'Universidad de los Andes', icon: Icons.place),
            SizedBox(height: 20),
            Expanded(child: ReadOnlyPlaceInputMap(initialLocation: LatLng(4.6018, -74.0660))),
          ],
        ),
      ),
    );
  }
}

class ReadOnlyInput extends StatelessWidget {
  final String value; // El valor a mostrar
  final IconData icon; // El icono a mostrar

  ReadOnlyInput({required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: value, // Mostrar el valor especificado
          readOnly: true, // Hacer que el campo sea solo lectura
          decoration: InputDecoration(
            labelText: 'Título del recordatorio',
            hintText: value, // El valor también puede usarse como hint
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(icon, color: Colors.white), // Cambié el icono para indicar que es read-only
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class ReadOnlyPlaceInputMap extends StatelessWidget {
  final LatLng initialLocation; // Posición inicial del marcador (readonly)

  ReadOnlyPlaceInputMap({required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Definir la altura si es necesario
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlutterMap(
          options: MapOptions(
            center: initialLocation, // Centramos el mapa en la posición inicial
            zoom: 13.0,
            interactiveFlags: InteractiveFlag.none, // Hacer el mapa no interactivo
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: initialLocation, // Mostrar marcador en la posición inicial
                  builder: (ctx) => Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



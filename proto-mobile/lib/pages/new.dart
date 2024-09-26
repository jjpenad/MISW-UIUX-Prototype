import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewScreen extends StatelessWidget {

  final Function showNotification;

  NewScreen({required this.showNotification});

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
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              showNotification(); // Mostrar la notificación
              Navigator.pushNamed(context, '/'); // Navegar a la página Home
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TitleInput(),
            SizedBox(height: 20),
            DateInput(),
            SizedBox(height: 20),
            PlaceInputText(),
            SizedBox(height: 20),
            PlaceInputMap(),
          ],
        ),
      ),
    );
  }
}

class TitleInput extends StatelessWidget {
  final String? initialValue;

  TitleInput({this.initialValue});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: initialValue ?? 'Título del recordatorio',
            hintText: 'Quiero recordar...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.title, color: Colors.white),
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

class DateInput extends StatefulWidget {
  final String? initialValue;

  DateInput({this.initialValue});

  @override
  _DateInputState createState() => _DateInputState(initialValue: initialValue);
}

class _DateInputState extends State<DateInput> {
  final String? initialValue;
  DateTime? selectedDate;

  _DateInputState({this.initialValue});

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    setState(() {
      selectedDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: selectedDate != null
            ? '${selectedDate?.toLocal()}'.split(' ')[0] : (initialValue ?? 'Fecha límite'),
          ),
          onTap: () => _selectDate(context), // Muestra el DatePicker
          decoration: InputDecoration(
            labelText: 'Fecha límite',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.date_range, color: Colors.white),
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

class PlaceInputText extends StatelessWidget {

  final String? intialValue;

  PlaceInputText({this.intialValue});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'En algún lugar...',
            labelText: intialValue ?? 'Lugar para recordarme',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(Icons.place, color: Colors.white),
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

class PlaceInputMap extends StatefulWidget {
  @override
  _PlaceInputMapState createState() => _PlaceInputMapState();
}

class _PlaceInputMapState extends State<PlaceInputMap> {
  // Posición inicial del marcador
  LatLng _selectedLocation = LatLng(4.60971, -74.08175); // Bogotá, Colombia

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FlutterMap(
            options: MapOptions(
              center: _selectedLocation,
              zoom: 13.0,
              interactiveFlags: InteractiveFlag.all,
              // Detecta cuando el usuario hace tap en el mapa
              onTap: (tapPosition, LatLng latLng) {
                setState(() {
                  _selectedLocation = latLng; // Actualiza la ubicación del marcador
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: _selectedLocation, // Usa la ubicación seleccionada
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
      ),
    );
  }
}

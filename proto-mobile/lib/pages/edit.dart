import 'package:flutter/material.dart';
import 'new.dart';

class EditScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2235),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2235),
        elevation: 0,
        title: Text(
          'Editar Recordatorio',
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TitleInput(initialValue: "Devolver el libro"),
            SizedBox(height: 20),
            DateInput(initialValue: "2024-09-18"),
            SizedBox(height: 20),
            PlaceInputText(intialValue: "Universidad de los Andes"),
            SizedBox(height: 20),
            PlaceInputMap(),
          ],
        ),
      ),
    );
  }
}
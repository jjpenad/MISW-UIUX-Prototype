import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New'),
      ),
      body: Center(
        child: Text('Soy New'),
      ),
    );
  }
}
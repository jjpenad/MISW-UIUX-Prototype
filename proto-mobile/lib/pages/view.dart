import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View'),
      ),
      body: Center(
        child: Text('Soy View'),
      ),
    );
  }
}
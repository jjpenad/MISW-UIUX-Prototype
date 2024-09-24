import 'package:flutter/material.dart';
import 'package:georecall/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoRecall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/qr': (context) => QrScreen(),
        '/new': (context) => NewScreen(),
        '/edit': (context) => EditScreen(),
        '/view': (context) => ViewScreen(),
        '/notifications': (context) => NotificationsScreen(),
      },
    );
  }
}

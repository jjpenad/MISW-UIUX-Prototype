import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:georecall/pages/pages.dart'; // Asegúrate de tener correctamente los imports de tus páginas.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    // Inicializa el plugin de notificaciones locales.
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    // Cambiamos IOSInitializationSettings por DarwinInitializationSettings
    var darwinInitSettings = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: darwinInitSettings, // Cambiado a darwinInitSettings
    );

    flutterLocalNotificationsPlugin.initialize(initSettings);

    // Pide permiso de notificación en iOS.
    _requestNotificationPermission();
  }

  void _requestNotificationPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  // Método para manejar notificaciones recibidas en iOS.
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title ?? "Notificación"),
        content: Text(body ?? ""),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }

  // Método para mostrar una notificación local.
  Future<void> _showNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'channelDescription',
      importance: Importance.max,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    // Cambiamos IOSNotificationDetails por DarwinNotificationDetails
    const iosDetails = DarwinNotificationDetails();

    const generalNotificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails, // Cambiado a iosDetails con DarwinNotificationDetails
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Dejar ropa en lavandería',
      'Estás cerca de Lavomatic Kr 7a. ¡No olvides tu pendiente!',
      generalNotificationDetails,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoRecall',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/qr': (context) => QrScreen(),
        '/new': (context) => NewScreen(
          showNotification: _showNotification, // Pasar el método para mostrar notificaciones.
        ),
        '/edit': (context) => EditScreen(),
        '/view': (context) => ViewScreen(),
        '/notifications': (context) => NotificationsScreen(),
      },
    );
  }
}

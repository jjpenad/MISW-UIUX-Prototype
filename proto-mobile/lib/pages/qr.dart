import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class QrScreen extends StatefulWidget {
  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isDenied || status.isRestricted) {
      // Solicitar permiso
      status = await Permission.camera.request();
    }

    if (status.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
      _initializeCamera();
    } else {
      // Manejo si el usuario no otorga el permiso
      setState(() {
        _isPermissionGranted = false;
      });
    }
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras!.first,
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F2235), // Fondo oscuro
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2235),
        elevation: 0, // Sin sombra
        title: Text(
          'Añadir Dispositivo',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Muestra si el permiso no fue concedido
            if (!_isPermissionGranted)
              Container(
                width: 300,
                height: 300,
                color: Colors.black26,
                child: Center(
                  child: Text(
                    'Permiso de cámara no concedido',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            // Muestra la cámara si está inicializada y el permiso está concedido
            else if (_isCameraInitialized && _cameraController != null)
              Container(
                width: 300,
                height: 300,
                child: CameraPreview(_cameraController!),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            // Muestra el estado de carga
            else
              Container(
                width: 300,
                height: 300,
                color: Colors.black26,
                child: Center(
                  child: Text(
                    'Cargando cámara...',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Escanea el código QR generado en el administrador de dispositivos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

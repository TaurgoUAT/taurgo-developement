import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:taurgo_developement/pages/loginPage.dart';
import 'package:taurgo_developement/pages/newProperty.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure cameras are initialized before runApp
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NewPropertyScreen(camera: camera),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:taurgo_developement/costants/AppColors.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final bool isVisible;

  const CustomFloatingActionButton({Key? key, required this.isVisible})
      : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    if (_cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras!.first,
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) return SizedBox.shrink();

    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 48,
      ),
      onPressed: () async {
        if (_cameraController != null && _cameraController!.value.isInitialized) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPreviewPage(cameraController: _cameraController!),
            ),
          );
        }
      },
    );
  }
}

class CameraPreviewPage extends StatelessWidget {
  final CameraController cameraController;

  const CameraPreviewPage({Key? key, required this.cameraController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Preview')),
      body: CameraPreview(cameraController),
    );
  }
}

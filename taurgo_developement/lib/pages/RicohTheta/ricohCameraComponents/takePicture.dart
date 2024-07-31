import 'package:flutter/material.dart';
import 'package:theta_client_flutter/theta_client_flutter.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../navpages/upload_image_page.dart';

class TakePictureScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen>
    with WidgetsBindingObserver {
  final _thetaClientFlutter = ThetaClientFlutter();

  Uint8List frameData = Uint8List(0);
  bool previewing = false;
  bool shooting = false;
  PhotoCaptureBuilder? builder;
  PhotoCapture? photoCapture;

  List<File> images = [];  // Initialize images list here

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initialize();
  }

  @override
  void deactivate() {
    WidgetsBinding.instance.removeObserver(this);
    stopLivePreview();
    super.deactivate();
    debugPrint('close TakePicture');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.paused:
        onPause();
        break;
      default:
        break;
    }
  }

  void onResume() {
    debugPrint('onResume');
    _thetaClientFlutter.isInitialized().then((isInit) {
      if (isInit) {
        startLivePreview();
      }
    });
  }

  void onPause() {
    debugPrint('onPause');
    stopLivePreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Take Pictures',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              color: Colors.black,
              child: Center(
                child: shooting
                    ? const Text(
                  'Taking Picture...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
                    : Image.memory(
                  frameData,
                  errorBuilder: (a, b, c) {
                    return Container(
                      color: Colors.black,
                    );
                  },
                  gaplessPlayback: true,
                ),
              )),
          Container(
              alignment: const Alignment(0, 0.8),
              child: MaterialButton(
                height: 80,
                shape: const CircleBorder(),
                color: Colors.white,
                onPressed: () {
                  if (shooting) {
                    debugPrint('already shooting');
                    return;
                  }
                  takePicture();
                },
              )),
        ],
      ),
    );
  }

  Future<bool> backButtonPress(BuildContext context) async {
    debugPrint('backButtonPress');
    stopLivePreview();
    return true;
  }

  void initialize() async {
    debugPrint('init TakePicture');
    builder = _thetaClientFlutter.getPhotoCaptureBuilder();
    builder!.build().then((value) {
      photoCapture = value;
      debugPrint('Ready PhotoCapture');
      Future.delayed(const Duration(milliseconds: 500), () {}).then((value) {
        startLivePreview();
      });
    }).onError((error, stackTrace) {
      // Handle initialization error
      debugPrint('Error initializing PhotoCaptureBuilder: $error');
    });

    debugPrint('initializing...');
  }

  bool frameHandler(Uint8List frameData) {
    if (!mounted) return false;
    setState(() {
      this.frameData = frameData;
    });
    return previewing;
  }

  void startLivePreview() {
    previewing = true;
    _thetaClientFlutter.getLivePreview(frameHandler).then((value) {
      debugPrint('LivePreview end.');
    }).onError((error, stackTrace) {
      debugPrint('Error getLivePreview.$error');
      // Handle live preview error
    });
    debugPrint('LivePreview starting..');
  }

  void stopLivePreview() {
    previewing = false;
  }

  void _updateImageList(List<File> newImages) {
    setState(() {
      images = newImages; // Update the images list with new images
    });
  }
  // void _loadInitialImages() {
  //   setState(() {
  //     images = widget.initialImages.map((path) => File(path)).toList();
  //   });
  // }

  void takePicture() {
    if (shooting) {
      debugPrint('already shooting');
      return;
    }
    setState(() {
      shooting = true;
    });

    stopLivePreview();

    photoCapture!.takePicture((fileUrl) {
      setState(() {
        shooting = false;
      });
      debugPrint('take picture: $fileUrl');
      if (!mounted) return;
      if (fileUrl != null) {
        _updateImageList(fileUrl as List<File>);
        // Navigate to UploadByCategoryPage with the fileUrl
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadByCategoryPage(
              // initialImages: [fileUrl], // Pass the initial image as a list
              onImagesSelected: _updateImageList, // Pass the callback
            ),
          ),
        );
      } else {
        setState(() {
          shooting = true;
        });
        debugPrint('takePicture canceled.');
      }
    }, (exception) {
      setState(() {
        shooting = false;
      });
      debugPrint(exception.toString());
    });
  }
}

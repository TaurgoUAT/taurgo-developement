import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraComponents/captureVideo.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraComponents/fileListScreen.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraComponents/messageBox.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraComponents/takePicture.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/bottom_nav_bar.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/change_password_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/help_support_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/profile_section.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/setting_button.dart';
import 'package:taurgo_developement/pages/navpages/accountPageComponents/susbcribtion_section.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/navpages/upload_image_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/authController.dart';
import '../home.dart';
import 'package:theta_client_flutter/theta_client_flutter.dart';

class RicohCameraPage extends StatefulWidget {
  const RicohCameraPage({super.key});

  @override
  State<RicohCameraPage> createState() => _RicohCameraPageState();
}

class _RicohCameraPageState extends State<RicohCameraPage>
    with WidgetsBindingObserver {
  String _platformVersion = 'Unknown';
  final _thetaClientFlutter = ThetaClientFlutter();
  bool _isInitTheta = false;
  bool _initializing = false;
  ThetaModel? _thetaModel;

  final String endpoint = 'http://192.168.1.1:80/';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPlatformState();
    initTheta();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        setState(() {
          _isInitTheta = false;
        });
        break;
      default:
        break;
    }
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _thetaClientFlutter.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initTheta() async {
    if (_initializing) {
      return;
    }
    bool isInitTheta;
    ThetaModel? thetaModel;
    try {
      _initializing = true;
      isInitTheta = await _thetaClientFlutter.isInitialized();
      debugPrint('start initialize');
      await _thetaClientFlutter.initialize(endpoint);
      thetaModel = await _thetaClientFlutter.getThetaModel();

      // // Client mode authentication settings
      // final config = ThetaConfig();
      // config.clientMode = DigestAuth('THETAXX12345678', '12345678');
      // await _thetaClientFlutter.initialize(endpoint, config);

      isInitTheta = true;
    } on PlatformException {
      if (!mounted) return;
      debugPrint('Error. init');
      isInitTheta = false;
      MessageBox.show(context, 'Initialize error.');
    } finally {
      _initializing = false;
    }

    if (!mounted) return;

    setState(() {
      _isInitTheta = isInitTheta;
      _thetaModel = thetaModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      home: Home(
        platformVersion: _platformVersion,
        isInitialized: _isInitTheta,
        connectTheta: initTheta,
        thetaModel: _thetaModel,
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String platformVersion;
  final bool isInitialized;
  final Function connectTheta;
  final ThetaModel? thetaModel;

  const Home({
    super.key,
    required this.platformVersion,
    required this.isInitialized,
    required this.connectTheta,
    required this.thetaModel,
  });

  @override
  Widget build(BuildContext context) {
    String camera = isInitialized ? 'connected! $thetaModel' : 'disconnected';
    var image = Image.asset('assets/logo/Taurgo Logo.png',
        height: 250, fit: BoxFit.scaleDown);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Capture Property',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ),
          ),
          centerTitle: true,
          backgroundColor: bWhite,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kPrimaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadImagePage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.help_outline,
                color: kPrimaryColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            children: [
              Center(
                child: IconButton(
                  icon: FaIcon(FontAwesomeIcons.camera,
                      color: Colors.redAccent, size: 200),
                  onPressed: () {},
                ),
              ),
              Center(
                  child: RichText(
                text: TextSpan(
                    text: "Camera Status: ",
                    style: TextStyle(
                      color: kSecondaryTextColour,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),
                    children: [
                      TextSpan(
                        // status = $camera.toUpperCase()
                          text: "$camera\n",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),)
                    ]),
              )),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: isInitialized
                        ? null
                        : () {
                            connectTheta();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryButtonColor,
                      foregroundColor: kSecondaryButtonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help_outline, color: Colors.black),
                            SizedBox(width: 8),
                            Text('Connect',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.chevron_right, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: !isInitialized
                        ? null
                        : () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const TakePictureScreen()));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryButtonColor,
                      foregroundColor: kSecondaryButtonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help_outline, color: Colors.black),
                            SizedBox(width: 8),
                            Text('Take Picture',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.chevron_right, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: !isInitialized
                        ? null
                        : () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const CaptureVideoScreen()));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryButtonColor,
                      foregroundColor: kSecondaryButtonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help_outline, color: Colors.black),
                            SizedBox(width: 8),
                            Text('Capture Video',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.chevron_right, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: Center(
              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text('Running on: $platformVersion\n'),
              //         Text('Camera: $camera\n'),
              //         // TextButton(
              //         //   onPressed: isInitialized
              //         //       ? null
              //         //       : () {
              //         //     connectTheta();
              //         //   },
              //         //   child: const Text('Connect'),
              //         // ),
              //         // TextButton(
              //         //   onPressed: !isInitialized
              //         //       ? null
              //         //       : () {
              //         //     Navigator.of(context).push(MaterialPageRoute(
              //         //         builder: (_) => const TakePictureScreen()));
              //         //   },
              //         //   child: const Text('Take Picture'),
              //         // ),
              //         // TextButton(
              //         //   onPressed: !isInitialized
              //         //       ? null
              //         //       : () {
              //         //     Navigator.of(context).push(MaterialPageRoute(
              //         //         builder: (_) => const CaptureVideoScreen()));
              //         //   },
              //         //   child: const Text('Capture Video'),
              //         // ),
              //         // TextButton(
              //         //   onPressed: !isInitialized
              //         //       ? null
              //         //       : () {
              //         //     Navigator.of(context).push(MaterialPageRoute(
              //         //         builder: (_) => const FileListScreen()));
              //         //   },
              //         //   child: const Text('File List'),
              //         // ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}

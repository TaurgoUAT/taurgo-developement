import 'package:flutter/material.dart';

class RicohThetaZ1GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connecting to Ricoh Theta Z1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Connecting to the Ricoh Theta Z1 and the Theta App Using Wi-Fi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('1. Prepare the Camera'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ensure that your Ricoh Theta Z1 camera is turned on and has sufficient battery life. It\'s also a good idea to fully charge your camera before starting.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('2. Enable Wi-Fi on the Camera'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Press the wireless button on the camera to turn on the Wi-Fi function. On the OLED panel of the camera, you should see the wireless icon displayed, indicating that the Wi-Fi is enabled.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('3. Connect to the Camera\'s Wi-Fi Network'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'On your smartphone or tablet, go to the Wi-Fi settings and look for the Wi-Fi network name (SSID) of your Ricoh Theta Z1 camera. The network name typically starts with "THETA" followed by the serial number of the camera. Select the camera\'s Wi-Fi network to connect to it.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('4. Launch the Theta App'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Open the Theta app on your smartphone or tablet. If you haven\'t installed the app yet, you can download it from the app store.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('5. Pair the Camera with the App'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Once the Theta app is launched, it should automatically detect the connected Ricoh Theta Z1 camera. Follow the on-screen instructions to complete the pairing process between the camera and the app.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('6. Start Using the App'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'After the camera and the app are successfully paired, you can use the Theta app to control the camera, capture photos or videos, adjust settings, and access various features and shooting modes.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
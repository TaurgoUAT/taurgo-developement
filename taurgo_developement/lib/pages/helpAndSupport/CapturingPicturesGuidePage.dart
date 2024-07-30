import 'package:flutter/material.dart';

class CapturingPicturesGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capturing Virtual Tour Pictures'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Capturing Virtual Tour Pictures',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('1. Prepare the Equipment'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ensure that your Ricoh Theta Z1 camera is fully charged and turned on. Make sure your mobile phone is charged and has the Taurgo app installed. You can download the app from the app store.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('2. Connect the Ricoh Theta Z1 to your Mobile Phone'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enable Wi-Fi on the Ricoh Theta Z1 camera by pressing the wireless button on the camera. On your mobile phone, go to the Wi-Fi settings and connect to the Wi-Fi network of the Ricoh Theta Z1 camera. The network name typically starts with "THETA" followed by the camera\'s serial number.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('3. Launch the Taurgo App'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Open the Taurgo app on your mobile phone. If you don\'t have an account, sign up for one using your email address. Log in to the Taurgo app using your credentials. Only connect to the Ricoh camera to capture the images, as it has its own Wi-Fi.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('4. Start a New Virtual Tour'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'In the Taurgo app, create a new virtual tour project by following the on-screen instructions. By selecting the properties tab, and beginning a project, this will then allow you to add your pictures from your gallery. While using your Ricoh Theta to capture, you will be on the Wi-Fi of the camera and unable to connect to the internet. Remember to disconnect from the camera once you have captured your images. Enter the necessary details, such as the property address and any additional information required.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('5. Capture Images with the Ricoh Theta Z1'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Use the Taurgo app to control the Ricoh Theta Z1 camera and capture 360-degree images. Follow the instructions provided by the Taurgo app to ensure you capture all the necessary shots for the virtual tour. Position the camera in different areas of the property to capture a comprehensive view.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                  '6. Capture Additional Images with your Mobile Phone Camera'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'In addition to the Ricoh Theta Z1 camera, use your mobile phone camera to capture additional images and scan a floorplan diagram of specific areas or details within the property. Ensure that these images complement the 360-degree images captured with the Ricoh Theta Z1.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('7. Upload and Share the Images'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Once you have captured all the necessary images, use the Taurgo app’s “Share with Taurgo” button to upload them to the virtual tour project. Follow the instructions provided by the Taurgo app to upload the images from both the Ricoh Theta Z1 camera and your mobile phone camera. Make sure to organize the images within the virtual tour project according to the desired sequence. It is better to send all the images at the same time.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('8. Notify the Taurgo Back-End Team'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'After uploading the images, the Taurgo back-end team will be notified about the completion of the virtual tour. Use the communication or notification feature within the Taurgo app to inform the team. Provide any additional information or instructions required by the team by email to info@taurgo.co.uk if you have any further requirements or special instructions.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title:
              Text('9. Receive Notification from the Taurgo Back-End Team'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The Taurgo back-end team will process the uploaded images and create the virtual tour. Within 24 hours of sending the images, you will receive a notification from the Taurgo app indicating that the virtual tour is ready.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Remember to refer to the specific instructions provided by the Taurgo app and the Ricoh Theta Z1 camera\'s user manual for any additional details or features specific to those devices.',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
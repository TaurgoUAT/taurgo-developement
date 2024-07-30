import 'package:flutter/material.dart';

class TipsForCapturingBestImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips for Capturing the Best Quality Pictures'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Tips for Capturing the Best Quality Pictures',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text('1. Shoot in HDR Mode'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The Ricoh Theta Z1 offers HDR mode, which can help improve image quality and capture a wider range of lighting conditions. Shooting in HDR mode can result in more vibrant and detailed images. This is automatically set up on the Taurgo App for you.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('2. Use a Stable Tripod'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To avoid camera shake and ensure sharp images, use a stable tripod to hold the Ricoh Theta Z1 camera. This will help maintain consistency and reduce blurriness in the photos.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('3. Clean the Lenses'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Before starting the photo shoot, make sure to clean the lenses of the Ricoh Theta Z1 camera. Dust or smudges on the lenses can affect image quality, so use a microfiber cloth or lens cleaning solution to remove any dirt or fingerprints.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('4. Consider Lighting Conditions'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pay attention to the lighting conditions in the space you are capturing. Ideally, aim for well-balanced lighting with minimal shadows and even illumination. If necessary, use additional lighting equipment to enhance the overall lighting quality.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('5. Capture Multiple Angles'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To provide a comprehensive view of the property, capture multiple angles and perspectives. This will allow viewers to explore the space from different vantage points and get a better sense of the property\'s layout and features.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('6. Compose the Shots Carefully'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Take the time to compose each shot thoughtfully. Consider the framing, symmetry, and overall aesthetics of the image. Look for interesting angles and focal points that highlight the property\'s unique features.',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('7. Review and Retake if Necessary'),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'After capturing each shot, review the image on the Ricoh Theta Z1 camera\'s display or the connected mobile app. If you notice any issues with exposure, composition, or image quality, retake the shot to ensure you have the best possible result.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Remember, the Ricoh Theta Z1 camera is designed to capture high-quality 360-degree images, but it\'s important to pay attention to the shooting conditions and follow best practices to achieve the best results.',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
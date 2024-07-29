import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Clipboard package for copying text
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/home.dart';

class ShareImagePage extends StatefulWidget {
  final String referenceCode;

  const ShareImagePage({
    Key? key,
    required this.referenceCode,
  }) : super(key: key);

  @override
  _ShareImagePageState createState() => _ShareImagePageState();
}

class _ShareImagePageState extends State<ShareImagePage> {
  // TextStyle for the reference code
  final TextStyle referenceTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Function to copy text to clipboard
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // Show a SnackBar to confirm the copy action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reference code copied to clipboard',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor:
            kPrimaryColor.withOpacity(0.4), // Use your primary color for the
        // SnackBar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Share Image',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: bWhite,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              child:
                  Image.asset('assets/images/prop-img.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset(
                'assets/logo/logo.png',
                height: 50,
                width: 400,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    'Please keep this reference number safe for future correspondence.',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),

                  Text(
                    'Reference Code:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),


                  // Container to display the reference code and copy button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // Light background color for contrast
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SelectableText widget allows users to select the text
                        SelectableText(
                          widget.referenceCode,
                          style: referenceTextStyle,
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: kPrimaryColor),
                          onPressed: () =>
                              _copyToClipboard(widget.referenceCode),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 30.0),
                      child: Text(
                        'Go Back to Home',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(50), // Button corner radius
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[300],
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(height: 20),
            // Commented-out section for additional sharing options
            // Center(
            //   child: Column(
            //     children: [
            //       Text(
            //         'Other Share Options',
            //         style: TextStyle(fontSize: 14, color: allBlack),
            //       ),
            //       SizedBox(height: 20),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           IconButton(
            //             icon: FaIcon(FontAwesomeIcons.whatsapp,
            //                 color: Colors.green, size: 32),
            //             onPressed: () {},
            //           ),
            //           SizedBox(width: 16),
            //           IconButton(
            //             icon: FaIcon(FontAwesomeIcons.facebook,
            //                 color: Colors.blue, size: 32),
            //             onPressed: () {},
            //           ),
            //           SizedBox(width: 16),
            //           IconButton(
            //             icon: FaIcon(FontAwesomeIcons.instagram,
            //                 color: Colors.purple, size: 32),
            //             onPressed: () {},
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 20),
            //       Divider(
            //           height: 1,
            //           thickness: 1,
            //           color: Colors.grey[300],
            //           indent: 40,
            //           endIndent: 40),
            //       SizedBox(height: 20),
            //       Text(
            //         'Share via External Link',
            //         style: TextStyle(fontSize: 14, color: allBlack),
            //       ),
            //       SizedBox(height: 12),
            //       ElevatedButton(
            //         onPressed: () {},
            //         child: Icon(Icons.link, color: kPrimaryColor),
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: kGrey,
            //           shape: CircleBorder(), // Make the button circular
            //           padding: EdgeInsets.all(
            //               16), // Adjust padding to make it look like a circle
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

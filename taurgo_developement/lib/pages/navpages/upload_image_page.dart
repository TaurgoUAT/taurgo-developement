import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/imagePageComponents/search_bar_section.dart';
import 'package:taurgo_developement/pages/navpages/shareImagePage.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:path_provider/path_provider.dart';
import 'package:taurgo_developement/pages/select_image.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  List<File> images = []; // List to store selected images

  Future<void> selectFromGallery(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final imageTemp = File(pickedFile.path);

      // Update images list
      setState(() {
        images.add(imageTemp);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected from gallery')),
      );
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> selectFromCamera(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile == null) return;

      final imageTemp = File(pickedFile.path);

      // Update images list
      setState(() {
        images.add(imageTemp);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image captured from camera')),
      );
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void onTabSelected(int index) {
    setState(() {
      Navigator.of(context)
          .pop(); // Return to the previous page when a tab is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Properties',
          style: TextStyle(
            fontSize: 18,
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
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bWhite,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomPaint(
                painter: DottedBorderPainter(),
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => UploadByCategoryPage(),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: kPrimaryColor, size: 32),
                          SizedBox(height: 8),
                          // Add spacing between the icon and the text
                          Text(
                            'Upload 2D Images',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: images.isEmpty
                    ? Center(child: Text('No images selected'))
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.file(
                          images[index],
                          fit: BoxFit.cover,
                          width: 320,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Area',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Area',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Postal Code',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '123456',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShareImagePage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Share with Taurgo',
                    style: TextStyle(fontSize: 18),
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
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = kPrimaryColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(8)));

    var dashWidth = 4.0;
    var dashSpace = 4.0;
    var distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



class UploadByCategoryPage extends StatefulWidget {
  const UploadByCategoryPage({super.key});

  @override
  State<UploadByCategoryPage> createState() => _UploadByCategoryPageState();
}

class _UploadByCategoryPageState extends State<UploadByCategoryPage> {
  int _selectedCategory = 0; // Track selected category index
  List<File> images = [];
  List<String> rooms = [
    "Entrance",
    "Driveway",
    "Streetview",
    "Dining Room",
    "Kitchen",
    "Lounge",
    "Backgarden",
    "Staircase",
    "Bedroom 1",
    "Bedroom 2",
    "Bedroom 3",
    "Master Bedroom",
  ];
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectFromCamera() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // Handle the selected image
        print('Image path: ${image.path}');
      }
    } else if (status.isDenied) {
      // Permission denied, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera permission is required to take photos.')),
      );
    } else if (status.isPermanentlyDenied) {
      // Open app settings if the permission is permanently denied
      openAppSettings();
    }
  }

  Future<void> _selectFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final imageTemp = File(pickedFile.path);

      // Update images list
      setState(() {
        // Assuming you have a list to store selected images
        images.add(imageTemp);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image selected from gallery')),
      );
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Container(
          color: bWhite,
          padding: EdgeInsets.all(16),
          height: 761, // Adjust height as needed
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Image Category',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              SearchBarForDialogBox(), // Your search bar widget
              SizedBox(height: 8),
              Text(
                'List of Rooms',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 180, // Fixed height for the list container
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kSecondaryButtonBorderColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: rooms.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = index;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: index,
                                          groupValue: _selectedCategory,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedCategory = value as int;
                                            });
                                          },
                                          activeColor: kPrimaryColor,
                                        ),
                                        Text(
                                          rooms[index],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.grid_view_outlined,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Sketch of Floor Plans',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(onPressed: () {
                              _selectFromGallery();
                            }, icon: Icon(Icons.broken_image_outlined,
                              size: 24, color: kIconColour,)),
                            SizedBox(height: 4),
                            Text('Floor Plan',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                            Text(
                              "(Ground)",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: () {
                              _selectFromGallery();
                            }, icon: Icon(Icons.broken_image_outlined,
                              size: 24, color: kIconColour,)),
                            SizedBox(height: 4),
                            Text('Floor Plan',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                            Text(
                              "(1st Floor)",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: () {
                              _selectFromGallery();
                            }, icon: Icon(Icons.broken_image_outlined,
                              size: 24, color: kIconColour,))
                            ,
                            SizedBox(height: 4),
                            Text('Floor Plan',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                            Text(
                              "(2nd Floor)",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Company Logo',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 50, // Adjust width as needed
                height: 50, // Adjust height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGrey,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.black, size: 24),
                  onPressed: () {
                    _selectFromGallery();
                  },
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Other Image',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 50, // Adjust width as needed
                height: 50, // Adjust height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGrey,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.black, size: 24),
                  onPressed: () {
                    _selectFromGallery();
                  },
                ),
              ),
              SizedBox(height: 10),
              CaptureImageButton(),

            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarForDialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 326,
            height: 40,
            decoration: BoxDecoration(
              color: bWhite,
              border: Border.all(
                color: kSecondaryButtonBorderColor, // Replace with your desired
                // border color
                width: 2.0, // Adjust the border width as needed
              ), // Background color of the search bar
              borderRadius: BorderRadius.circular(30.0),

              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 2,
              //     blurRadius: 5,
              //     offset: Offset(0, 3),
              //   ),
              // ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search, color: kSecondaryButtonBorderColor), // Search icon
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: kSecondaryButtonBorderColor),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.mic, color: kSecondaryButtonBorderColor), // Mic icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CaptureImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: 40,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RicohCameraPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Capture',
                      style: TextStyle(fontSize: 16, color: bWhite,),
                    textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

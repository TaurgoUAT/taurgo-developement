import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/propertyPageComponents/uploadImageButton.dart';
import 'package:taurgo_developement/pages/navpages/shareImagePage.dart';
import 'package:taurgo_developement/services/mogo_service.dart';

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

  void _updateImageList(List<File> newImages) {
    setState(() {
      images = newImages; // Update the images list with new images
    });
  }

  void onTabSelected(int index) {
    setState(() {
      Navigator.of(context)
          .pop(); // Return to the previous page when a tab is selected
    });
  }

  // Upload Images to Firebase Storage
  Future<void> uploadImages() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    if (user == null) {
      print('User not authenticated');
      return;
    }

    final String userEmail = user.email!;
    final FirebaseStorage storage = FirebaseStorage.instance;

    for (var image in images) {
      try {
        String filePath =
            'images/$userEmail/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await storage.ref(filePath).putFile(image);
        print('Upload successful for $filePath');
      } catch (e) {
        print('Failed to upload image: $e');
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Images uploaded successfully')),
    );
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
                          builder: (context) => UploadByCategoryPage(
                            onImagesSelected: _updateImageList, // Pass the callback
                          ),
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
                onPressed: () async {
                  await uploadImages(); // Upload images before navigating
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

class UploadByCategoryPage extends StatefulWidget {
  final Function(List<File>) onImagesSelected; // Callback to pass images back

  const UploadByCategoryPage({super.key, required this.onImagesSelected});

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
    "Floor Plans",
    "Logo",
  ];
  final ImagePicker _picker = ImagePicker();

  Future<void> _selectFromCamera() async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        final imageTemp = File(image.path);
        setState(() {
          images.add(imageTemp);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image captured from camera')),
        );
      }
    } else {
      print('Camera permission not granted');
    }
  }

  Future<void> _selectFromGallery() async {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemp = File(image.path);
        setState(() {
          images.add(imageTemp);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image selected from gallery')),
        );
      }
    } else {
      print('Gallery permission not granted');
    }
  }

  void _onDoneButtonPressed() {
    widget.onImagesSelected(images); // Invoke the callback with selected images
    Navigator.of(context).pop(); // Close the page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bWhite,
        elevation: 1,
        title: Text(
          'Upload By Category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kPrimaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = index; // Update selected category index
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedCategory == index
                            ? kPrimaryColor
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          rooms[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedCategory == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: images.isEmpty
                  ? Center(child: Text('No images selected'))
                  : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RicohCameraPage()),
                    );
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _selectFromGallery,
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _onDoneButtonPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

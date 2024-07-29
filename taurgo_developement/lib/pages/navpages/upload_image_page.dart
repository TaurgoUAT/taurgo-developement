import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taurgo_developement/costants/AppColors.dart';
import 'package:taurgo_developement/costants/status.dart';
import 'package:taurgo_developement/pages/RicohTheta/ricohCameraPage.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/pages/navpages/propertyPageComponents/uploadImageButton.dart';
import 'package:taurgo_developement/pages/navpages/shareImagePage.dart';

class UploadImagePage extends StatefulWidget {
  final String address;
  final String areaCode;
  final String postalCode;
  final String imagePath;

  const UploadImagePage({
    super.key,
    required this.address,
    required this.areaCode,
    required this.postalCode, required this.imagePath,
  });

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  //This set Image has to be Uploaded to the Server
  List<File> images = []; // List to store selected images

  List<File> imagesToUpload = [];

  List<File> logoUpload = [];

  List<File> floorPlansUpload = [];

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

  Future<void> selectFromGalleryForLogo(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final imageTemp = File(pickedFile.path);

      // Update images list
      setState(() {
        //Condition to Add Only Image has to be added
        images.add(imageTemp);
        // logoUpload.add(imageTemp);
        // imagesToUpload.add(imageTemp);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: kPrimaryColor,
            content: Text(
                'Logo '
                'has been '
                'Selected',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ))),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sorry for the Inconvenience: $e',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
    }
  }

  Future<void> selectFromGalleryForFloorPlans(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final imageTemp = File(pickedFile.path);

      // Update images list
      setState(() {
        //Condition to Add Only Image has to be added
        images.add(imageTemp);
        // imagesToUpload.add(imageTemp);
        // floorPlansUpload.add(imageTemp);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:kPrimaryColor,content: Text('Floor Plan has '
            'been Selected',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sorry for the Inconvenience: $e',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
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
        SnackBar(content: Text('Image captured from camera',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
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

  @override
  void dispose() {
    // Clean up resources here
    super.dispose();
  }

  void onTabSelected(int index) {
    setState(() {
      Navigator.of(context)
          .pop(); // Return to the previous page when a tab is selected
    });
  }

  Future<void> someAsyncOperation() async {
    try {
      // Perform some async operation
      await Future.delayed(Duration(seconds: 1)); // Example delay
      if (mounted) {
        setState(() {
          // Update state only if the widget is still mounted
        });
      }
    } catch (e) {
      if (mounted) {
        // Handle error if needed
      }
    }
  }

  String generateCustomReference(String userId) {
    DateTime now = DateTime.now();
    int randomNumber = Random().nextInt(99999); // Generate a random number
    return 'REF-${userId.substring(0, 4)}-${now.year}${now.month}${now.day}-${randomNumber.toString().padLeft(5, '0')}';
  }

  // Upload Images to Firebase Storage
  Future<void> uploadImages() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user == null) {
      print('User not authenticated');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please sign in to upload images.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor, // Set the color to your primary color
            strokeWidth: 6.0,
            strokeCap: StrokeCap.square, // Set the stroke width
          ),
        );
      },
    );
    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseFirestore firestore =
        FirebaseFirestore.instance; // Access Firestore
    List<String> imageUrls = []; // List to store image URLs

    for (var image in images) {
      if (image.existsSync()) {
        try {
          String filePath =
              'images/${user.email}/${DateTime.now().millisecondsSinceEpoch}.jpg';
          await storage.ref(filePath).putFile(image);
          final Reference ref = storage.ref().child(filePath);
          final UploadTask uploadTask = ref.putFile(image);
          final TaskSnapshot snapshot = await uploadTask;

          // Retrieve the download URL of the uploaded image
          final String downloadUrl = await snapshot.ref.getDownloadURL();

          // Add the download URL to the list of image URLs
          imageUrls.add(downloadUrl);
          // if (mounted) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Images uploaded successfully')),
          //   );
          // }
          print('Upload successful for $filePath');
        } catch (e) {
          print('Failed to upload image: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: $e',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ))),
          );
        }
      } else {
        print('Image file does not exist');
      }

      try {
        await firestore
            .collection('to-be-completed')
            .doc(referenceNumber) // Use user ID for unique identification
            .collection('properties')
            .add({
          'address': widget.address,
          'areaCode': widget.areaCode,
          'postalCode': widget.postalCode,
          'imageUrls': imageUrls, // This should be a list of URLs
          'email': user.email,
          'userId': user.uid,
          'referanceNumber': referenceNumber,
          'status': status[0],
          'createdAt': FieldValue.serverTimestamp(),
        });

        print('Property details uploaded successfully');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor:kPrimaryColor,content: Text('Well Done! Your files are now with Taurgo, and will be sent back to you within 24 hours.',

              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ))),
        );

        // Navigate to PropertyPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShareImagePage(referenceCode:
            referenceNumber,),
          ),
        );
      } catch (e) {
        print('Failed to upload property details: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor:Colors.redAccent,content: Text('Failed to upload property details: $e',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ))),
        );
      }

      try {
        await firestore
            .collection('all-images')
            .doc("images") // Use user ID for unique identification
            .collection('images')
            .add({
          'imageUrls': imageUrls, // This should be a list of URLs
          'createdAt': FieldValue.serverTimestamp(),
        });
        print("Images Uploaded to the Server");
      } catch (e) {
        print('Failed to upload Images to the Server: $e');
      }
    }
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
                            onImagesSelected:
                                _updateImageList, // Pass the callback
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
                            'Upload Images',
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPaint(
                    painter: DottedBorderPainter(),
                    child: Container(
                      width: 175,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            selectFromGalleryForLogo(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: kPrimaryColor, size: 32),
                              SizedBox(height: 8),
                              // Add spacing between the icon and the text
                              Text(
                                'Upload Logo',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
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
                  CustomPaint(
                    painter: DottedBorderPainter(),
                    child: Container(
                      width: 175,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            selectFromGalleryForFloorPlans(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: kPrimaryColor, size: 32),
                              SizedBox(height: 8),
                              // Add spacing between the icon and the text
                              Text(
                                'Upload Floor Plans',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
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
                ],
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 12),
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
                      widget.address,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 12),
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
                                  widget.areaCode,
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
                                  widget.postalCode,
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
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await uploadImages(); // Upload images before navigating
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
          const SnackBar(content: Text('Image captured from camera',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ))),
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
          const SnackBar(backgroundColor:kPrimaryColor,content: Text('Image '
              'selected from '
              'gallery',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "Inter",
              ))),
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
                      _selectedCategory =
                          index; // Update selected category index
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      MaterialPageRoute(
                          builder: (context) => RicohCameraPage()),
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

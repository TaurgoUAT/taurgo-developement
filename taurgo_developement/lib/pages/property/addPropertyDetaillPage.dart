import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'dart:io';
import '../../costants/AppColors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await MongoDatabase.connect();
// }
//

class AddPropertyDetailsPage extends StatefulWidget {
  final String imagePath;

  const AddPropertyDetailsPage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _AddPropertyDetailsPageState createState() => _AddPropertyDetailsPageState();
}

class _AddPropertyDetailsPageState extends State<AddPropertyDetailsPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaCodeController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  List<File> images = []; // List to store selected images

  List<File> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    //This is where we are adding Images to the
    _imageFiles.add(File(widget.imagePath));
  }

  void _updateImageList(List<File> newImages) {
    setState(() {
      _imageFiles = newImages; // Update the images list with new images
    });
  }

  @override
  void dispose() {
    // _addressController.dispose();
    // _areaCodeController.dispose();
    // _postalCodeController.dispose();
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

  Future<void> addPropertyDetails() async {
    // Retrieve user input from text fields
    final address = _addressController.text;
    final areaCode = _areaCodeController.text;
    final postalCode = _postalCodeController.text;

    if (address.isEmpty || areaCode.isEmpty || postalCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:Colors.redAccent,content: Text('All fields '
            'are required.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
      return;
    }

    // Access Firebase authentication instance
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    // Check if the user is authenticated
    if (user == null) {
      // Print error message and notify the user if not authenticated
      print('User not authenticated');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:Colors.redAccent,content: Text('Please sign in to upload images.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: "Inter",
            ))),
      );
      return; // Exit the function if user is not authenticated
    }
    print(user.email);

    // Access Firebase Storage and Firestore instances
    final FirebaseStorage storage = FirebaseStorage.instance;
    final FirebaseFirestore firestore =
        FirebaseFirestore.instance; // Access Firestore
    List<String> imageUrls = []; // List to store image URLs

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor, // Set the color to your primary color
            strokeWidth: 6.0,
            strokeCap: StrokeCap.square,// Set the stroke width
          ),
        );
      },
    );
    // Loop through each image and attempt to upload it
    for (var image in _imageFiles) {
      // Check if the image file exists
      if (image.existsSync()) {
        try {
          // Construct the file path using the user's email and current timestamp
          String filePath =
              'property-details/${user.email}/${DateTime.now().millisecondsSinceEpoch}.jpg';

          // Upload the image file and await the completion of the upload task
          final Reference ref = storage.ref().child(filePath);
          final UploadTask uploadTask = ref.putFile(image);
          final TaskSnapshot snapshot = await uploadTask;

          // Retrieve the download URL of the uploaded image
          final String downloadUrl = await snapshot.ref.getDownloadURL();

          // Add the download URL to the list of image URLs
          imageUrls.add(downloadUrl);

          // Print success message for the upload
          print('Upload successful for $filePath');
        } catch (e) {
          // Print and notify the user if the image upload fails
          print('Failed to upload image: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor:Colors.redAccent,content: Text('Failed to upload image: $e',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Inter",
                ))),
          );
        }
      } else {
        // Print message if the image file does not exist
        print('Image file does not exist');
      }
    }

    // After all images are uploaded, store the property details in Firestore
    // Adding Property Details to Firestore
    try {
      await firestore
          .collection('users')
          .doc(user.uid) // Use user ID for unique identification
          .collection('properties')
          .add({
        'address': address,
        'areaCode': areaCode,
        'postalCode': postalCode,
        'imageUrls': imageUrls, // This should be a list of URLs
        'email': user.email,
        'userId': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      print('Property details uploaded successfully');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:kPrimaryColor,content: Text('Property details uploaded '
            'successfully',
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
          builder: (context) => Homepage(),
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Property Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        centerTitle: true,
        backgroundColor: bWhite,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo/Taurgo Logo.png'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.file(
                  File(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Property Details",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: allBlack,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              cursorColor: kPrimaryColor,
              controller: _addressController,
              decoration: InputDecoration(
                labelText: "Address",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: kPrimaryTextColourTwo,
                  fontSize: 14,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              cursorColor: kPrimaryColor,
              controller: _areaCodeController,
              decoration: InputDecoration(
                labelText: "Area Code",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: kPrimaryTextColourTwo,
                  fontSize: 14,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              cursorColor: kPrimaryColor,
              controller: _postalCodeController,
              decoration: InputDecoration(
                labelText: "Postal Code",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: kPrimaryTextColourTwo,
                  fontSize: 14,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              // keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: addPropertyDetails,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  child: Text('Save', style: TextStyle(fontSize: 18)),
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
      ),
    );
  }
}

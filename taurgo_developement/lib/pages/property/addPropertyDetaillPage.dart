import 'package:flutter/material.dart';
import 'package:taurgo_developement/pages/home.dart';
import 'package:taurgo_developement/services/mongo.dart';
import 'dart:io';
import '../../costants/AppColors.dart';
import '../navpages/propertyPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
}

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
  List<File> _imageFiles = [];
  @override
  void initState() {
    super.initState();
    MongoDatabase.connect();
    _imageFiles.add(File(widget.imagePath));
  }

  @override
  void dispose() {
    _addressController.dispose();
    _areaCodeController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  Future<void> _uploadSelectedImages() async {
    if (_imageFiles.isNotEmpty) {
      await MongoDatabase.insertImageDatas(_imageFiles);
      // Reset the selection after upload
      setState(() {
        _imageFiles = [];
      });
    }
  }

  void _saveDetails() async {
    // Extract values from the text controllers
    final address = _addressController.text;
    final areaCode = _areaCodeController.text;
    final postalCode = _postalCodeController.text;

    // Insert property details into MongoDB with image data
    await MongoDatabase.insertData({
      'address': address,
      'areaCode': areaCode,
      'postalCode': postalCode,
    }, imageFiles: _imageFiles);

    // Reset the selection after upload
    setState(() {
      _imageFiles = [];
    });

    // Navigate to the PropertyPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProperyPage(
          imagePath: widget.imagePath,
          address: address,
          areaCode: areaCode,
          postalCode: postalCode,
        ),
      ),
    );
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
                onPressed: _saveDetails,
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

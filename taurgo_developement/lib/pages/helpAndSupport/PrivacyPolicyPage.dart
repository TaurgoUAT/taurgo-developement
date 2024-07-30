import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle, ByteData;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import '../../costants/AppColors.dart';

class PrivacyPolicyPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    try {
      final ByteData data = await rootBundle.load('assets/pdf/Privacy Policy.pdf');
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile = File('${tempDir.path}/Privacy Policy.pdf');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      setState(() {
        pathPDF = tempFile.path;
      });
      print("PDF loaded successfully: $pathPDF");
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),
        ),
        backgroundColor: Colors.white, // Ensure the AppBar color contrasts with the text
        iconTheme: IconThemeData(color: kPrimaryColor), // Ensure the back icon color is visible
      ),
      body: pathPDF.isNotEmpty
          ? PDFView(
        filePath: pathPDF,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        pageSnap: true,
        fitPolicy: FitPolicy.BOTH,
      )
          : Center(
        child: SizedBox(
          width: 60.0,
          height: 60.0,
          child: CircularProgressIndicator(
            color: kPrimaryColor,
            strokeWidth: 6.0,
            strokeCap: StrokeCap.square,
          ),
        ),
      ),
    );
  }
}

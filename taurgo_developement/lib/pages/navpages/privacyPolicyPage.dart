import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle, ByteData;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

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
      final ByteData data =
          await rootBundle.load('assets/pdf/PrivacyPolicy.pdf');
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile = File('${tempDir.path}/PrivacyPolicy.pdf');
      await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
      setState(() {
        pathPDF = tempFile.path;
        print("PDF loaded successfully: $pathPDF");
      });
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: pathPDF.isNotEmpty
          ? PDFView(
              filePath: pathPDF,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

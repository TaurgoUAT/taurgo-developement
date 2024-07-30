import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle, ByteData;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class TermsandConidtions extends StatefulWidget {
  @override
  _TermsandConditionsState createState() => _TermsandConditionsState();
}

class _TermsandConditionsState extends State<TermsandConidtions> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    try {
      final ByteData data =
          await rootBundle.load('assets/pdf/TaurgoAppTermsandConditions.pdf');
      final Directory tempDir = await getTemporaryDirectory();
      final File tempFile =
          File('${tempDir.path}/TaurgoAppTermsandConditions.pdf');
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

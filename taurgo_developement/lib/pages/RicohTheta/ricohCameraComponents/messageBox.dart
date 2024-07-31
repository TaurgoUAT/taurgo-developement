import 'package:flutter/material.dart';

import '../../../costants/AppColors.dart';

class MessageBox extends StatelessWidget {
  final String title;
  final Function? onClose;

  const MessageBox({super.key, required this.title, this.onClose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: TextStyle(
          color: kPrimaryColor,
          fontSize: 16
      )),
      content: Text(
          'Please Try Again, with Ricoh Camera',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w100
      )),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (onClose != null) {
                onClose!();
              }
            },
            child: const Text('OK',style: TextStyle(
                color: kPrimaryColor
            ))),
      ],
    );
  }
  static void show(BuildContext context, String title, [Function? onClose]) {
    showDialog(
        context: context,
        builder: (context) {
          return MessageBox(
            title: title,
            onClose: onClose,
          );
        });
  }
}

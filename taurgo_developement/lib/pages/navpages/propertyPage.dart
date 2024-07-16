import 'package:flutter/material.dart';
import 'package:taurgo_developement/costants/AppColors.dart';


class ProperyPage extends StatefulWidget {
  const ProperyPage({super.key});

  @override
  State<ProperyPage> createState() => _ProperyPageState();
}

class _ProperyPageState extends State<ProperyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Properties', style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
          ),),
          centerTitle: true,
          backgroundColor: bWhite,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/logo/Taurgo Logo.png'), // Path to your company icon
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none,color: kPrimaryColor,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.help_outline, color: kPrimaryColor,),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: bWhite,
          padding: const EdgeInsets.all(16.0),

        )
    );
  }
}

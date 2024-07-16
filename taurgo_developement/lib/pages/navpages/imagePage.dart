import 'package:flutter/material.dart';


class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Page"),),
      body: Center(
        child: Text("Propery Page"),
      ),
    );
  }
}

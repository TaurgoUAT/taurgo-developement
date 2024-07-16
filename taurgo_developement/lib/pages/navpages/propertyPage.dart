import 'package:flutter/material.dart';


class ProperyPage extends StatefulWidget {
  const ProperyPage({super.key});

  @override
  State<ProperyPage> createState() => _ProperyPageState();
}

class _ProperyPageState extends State<ProperyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Property Page"),),
      body: Center(
        child: Text("Propery Page"),
      ),
    );
  }
}

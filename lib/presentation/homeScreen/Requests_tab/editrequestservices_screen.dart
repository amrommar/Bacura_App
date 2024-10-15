import 'package:flutter/material.dart';

class EditRequestServices_Screen extends StatefulWidget {
  const EditRequestServices_Screen({super.key});

  @override
  State<EditRequestServices_Screen> createState() =>
      _EditRequestServices_ScreenState();
}

class _EditRequestServices_ScreenState
    extends State<EditRequestServices_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Request Services'),
      ),
    );
  }
}

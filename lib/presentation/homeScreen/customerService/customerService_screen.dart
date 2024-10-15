import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Customerservice_Screen extends StatefulWidget {
  @override
  State<Customerservice_Screen> createState() => _CustomerserviceScreenState();
}

class _CustomerserviceScreenState extends State<Customerservice_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Service')),
      body: Center(
        child: Icon(
          Icons.headset_mic_outlined,
          color: ColorManager.primaryBlueColor,
          size: 100,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ServiceDetails_Screen extends StatefulWidget {
  @override
  State<ServiceDetails_Screen> createState() => _ServiceDetails_ScreenState();
}

class _ServiceDetails_ScreenState extends State<ServiceDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Service Details')),
    );
  }
}

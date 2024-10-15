import 'package:flutter/material.dart';

class Notifications_Screen extends StatefulWidget {
  @override
  State<Notifications_Screen> createState() => _Notifications_ScreenState();
}

class _Notifications_ScreenState extends State<Notifications_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
    );
  }
}

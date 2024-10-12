import 'package:flutter/material.dart';

class test_screen extends StatefulWidget {
  @override
  _test_screenState createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
    );
  }
}

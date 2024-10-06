import 'package:flutter/material.dart';

class PersonalDetails_Screen extends StatefulWidget {
  const PersonalDetails_Screen({super.key});

  @override
  State<PersonalDetails_Screen> createState() => _PersonalDetails_ScreenState();
}

class _PersonalDetails_ScreenState extends State<PersonalDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة الشخصية'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

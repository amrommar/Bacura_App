import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class UserGuide_Screen extends StatefulWidget {
  const UserGuide_Screen({super.key});

  @override
  State<UserGuide_Screen> createState() => _UserGuide_ScreenState();
}

class _UserGuide_ScreenState extends State<UserGuide_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Guide'),
      ),
      body: Center(
        child: Icon(Icons.library_books_outlined,
            size: 150, color: ColorManager.primaryBlueColor),
      ),
    );
  }
}

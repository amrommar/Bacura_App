import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class UserGuideViewBody extends StatelessWidget {
  const UserGuideViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.library_books_outlined,
        size: 150,
        color: ColorManager.primaryBlueColor,
      ),
    );
  }
}

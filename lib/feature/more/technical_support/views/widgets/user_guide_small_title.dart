import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class UserGuideSmallTitle extends StatelessWidget {
  String title;

  UserGuideSmallTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.justify,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold),
    );
  }
}

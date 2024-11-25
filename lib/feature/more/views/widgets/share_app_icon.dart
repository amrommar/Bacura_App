import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ShareAppIcon extends StatelessWidget {
  const ShareAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.ios_share,
        color: ColorManager.blackColor,
        size: 30,
      ),
    );
  }
}

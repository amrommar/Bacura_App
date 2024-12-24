import 'package:bacura_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BacuraLogoContainer extends StatelessWidget {
  const BacuraLogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 280.h,
        child: SvgPicture.asset(ImageAssets.bacuraLogo),
      ),
    );
  }
}

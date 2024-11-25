import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarSection extends StatelessWidget {
  const AvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        // This allows the profile image to overflow out of the container
        children: [
          Container(height: 100.h, color: ColorManager.primaryBlueColor),
          Positioned(
              top: 40.h,
              left: 0.w,
              right: 0.w,
              child: Column(children: [
                Stack(children: [
                  // Profile picture
                  const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/Ellipse 1.png')),
                  // Edit icon on top of the profile picture
                  Positioned(
                      ///////////////////////   want method to edit image /////////////////////////////////
                      bottom: 4.h,
                      right: 5.w,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.primaryBlueColor,
                        radius: 12,
                        child: Icon(Icons.camera_alt_outlined, size: 15, color: ColorManager.whiteColor),
                      ))
                ]),
                const SizedBox(height: 8),
                // User name
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(AppStrings.userName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  //////////////////////// Want method to edit the Name /////////////////////
                  Icon(Icons.drive_file_rename_outline, color: ColorManager.primaryBlueColor, size: 25),
                ])
              ]))
        ]);
  }
}
